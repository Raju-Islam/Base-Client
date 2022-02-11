import 'package:base_client/controller/user.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => UserController(), fenix: true);
}
