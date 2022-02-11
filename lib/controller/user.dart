import 'package:base_client/app_constants/app_constants.dart';
import 'package:base_client/service/base_client.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  void getData() async {
    final response =
        await BaseClient().get(AppConstants.baseUrl, AppConstants.getUser);
    print(response['data']);
  }

  void postData() async {
    var request = {'name': 'raju', 'job': 'leader'};
    final response = await BaseClient()
        .post(AppConstants.baseUrl, AppConstants.createPost, request);
    print(response);
  }
}
