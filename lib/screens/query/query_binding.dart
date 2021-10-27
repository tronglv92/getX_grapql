import 'package:get/get.dart';
import 'package:get_grapql_master/screens/query/query_controller.dart';



class QueryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QueryController>(
            () => QueryController());
  }
}