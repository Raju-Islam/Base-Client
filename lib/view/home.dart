import 'package:base_client/controller/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  var json = {'name': 'raju', 'job': 'leader'};
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {
                  Get.find<UserController>().getData();
                },
                child: const Text('Get')),
            sizedBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {
                  Get.find<UserController>().postData();
                },
                child: const Text('Post')),
            sizedBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {},
                child: const Text('Delete')),
            sizedBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {},
                child: const Text('Update')),
          ],
        ),
      ),
    );
  }
}
