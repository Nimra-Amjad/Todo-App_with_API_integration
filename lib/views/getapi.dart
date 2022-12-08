import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_1/controllers/apicontroller.dart';
import 'package:todo_app_1/services/api.dart';

class apiGet extends StatelessWidget {
  final APIController controller = Get.put(APIController());

  // void _printLatestValue() {
  //   print('First text field: ${mycontroller.text}');
  // }

  // void _printLatestValue2() {
  //   print('Second text field: ${myController2.text}');
  // }

  // getdata() async {
  //   result = await apiService().getUser();
  //   if (isloaded != null) {
  //     setState(() {
  //       isloaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Obx((() => ListView.builder(
          itemCount: controller.completeData.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${controller.completeData.value[index].id}'),
                Text('${controller.completeData.value[index].title}'),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext) {
                          return Container(
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller.mycontroller,
                                    decoration: InputDecoration(
                                        hintText:
                                            '${controller.completeData.value[index].id}'),
                                  ),
                                  TextFormField(
                                    controller: controller.myController2,
                                    decoration: InputDecoration(
                                        hintText:
                                            '${controller.completeData.value[index].title}'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.onSavePressed(
                                          controller
                                              .completeData.value[index].id
                                              .toString(),
                                          controller
                                              .completeData.value[index].title
                                              .toString());
                                      authenicationPut().updateAlbum(
                                          controller.mycontroller.text
                                              .toString(),
                                          controller.myController2.text
                                              .toString());
                                      Get.back();
                                    },
                                    child: Text('Edit'),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.edit),
                ),
                GestureDetector(
                  onTap: () {
                    authenicationPut().deleteAlbum(
                        controller.completeData.value[index].id.toString());
                  },
                  child: Icon(Icons.delete),
                )
              ],
            );
          },
        )));
  }
}
