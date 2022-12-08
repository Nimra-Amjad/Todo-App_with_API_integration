import 'package:todo_app_1/constants.dart';
import 'package:todo_app_1/models/apimodel.dart';
import 'package:http/http.dart' as http;

class AuthenicationService {
  Future<List<TodoModel>?> apiService() async {
    String url = Constants.baseurl + Constants.endpoint;
    final response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return todoModelFromJson(response.body);
    }

    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('something Went Wrong');
    }
  }
}

class authenticationpost {
  Future<List<TodoModel>?> apiServicePost(
      String id,
      String title,
      String description,
      String category,
      String timestamp,
      String priority,
      String user_id,
      String iscompleted) async {
    var url = Uri.parse(Constants.baseurl + Constants.endpoint);
    Map<String, String> data2 = {
      "title": title,
      "description": description,
      "category": category,
      "timestamp": timestamp,
      "priority": priority,
      "user_id": user_id,
      "isCompleted": iscompleted,
      "id": id
    };

    var response = await http.post(url, body: data2);
  }
}

class authenicationPut {
  Future<List<TodoModel>> updateAlbum(String id, String title) async {
    var url = Uri.parse(Constants.baseurl + Constants.edit(id));
    Map<String, String> data = {'id': id, 'title': title};
    final response = await http.put(
      url,
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },

      body: data,
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return todoModelFromJson(response.body);
      }
      if (response.statusCode == 500) {
        print(response.statusCode);
        throw Exception('Server Error');
      } else {
        print(response.statusCode);
        throw Exception('Failed to update album.');
      }
    } on Exception catch (_) {
      print(response.statusCode);
      print("throwing new error");
      throw Exception("Error on server");
    }
  }

  Future<List<TodoModel>> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(Constants.baseurl + Constants.edit(id)),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise `snapshot.hasData`
      // will always return false on `FutureBuilder`.
      return todoModelFromJson(response.body);
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete album.');
    }
  }
}
