import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app_1/models/apimodel.dart';
import 'package:todo_app_1/services/api.dart';

class APIController extends GetxController {
  // late Future<TodoModel> futureGetApi;
  var isLoading = false.obs;
  var completeData = <TodoModel>[].obs;

  TextEditingController mycontroller = TextEditingController();
  TextEditingController myController2 = TextEditingController();

  TextEditingController controllerid = TextEditingController();
  TextEditingController controllertitle = TextEditingController();
  TextEditingController controllerdescription = TextEditingController();
  TextEditingController controllercategory = TextEditingController();
  TextEditingController controllertimestamp = TextEditingController();
  TextEditingController controllerpriority = TextEditingController();
  TextEditingController controlleruserid = TextEditingController();
  TextEditingController controlleriscomplete = TextEditingController();
  @override
  void onInit() {
    getResult();
    super.onInit();
    // futureGetApi = apiService();
  }

  Future<List<TodoModel>> getResult() async {
    var result = await AuthenicationService().apiService();
    completeData.value = result!;
    isLoading.value = false;
    return result;
  }

  void onSavePressed(String id, String text) {
    id = mycontroller.text;
    text = myController2.text;
  }

  void onAdd(String id, String title, String description, String category,
      String timestamp, String priority, String userid, String iscomplete) {
    id = controllerid.text;
    title = controllertitle.text;
    description = controllerdescription.text;
    category = controllercategory.text;
    timestamp = controllertimestamp.text;
    priority = controllerpriority.text;
    userid = controlleruserid.text;
    iscomplete = controlleriscomplete.text;
  }
  //List<Getapi>? result;
  // var Listresult = <Getapi>[].obs;
  // var getApiii = Getapi().obs;

  // var isLoaded = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // Future<Getapi?> getApiUser() async {
  //   isLoaded.value = true;

  // }
}