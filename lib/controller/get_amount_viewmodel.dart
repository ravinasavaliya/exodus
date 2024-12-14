import 'package:get/get.dart';

import '../apiModel/api_services/api_services/api_response.dart';
import '../apiModel/model/responseModel/get_amount_res_model.dart';
import '../apiModel/repo/get_amount_repo.dart';

class GetAmountViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getAmountViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    update();
    try {
      GetAmontResModel response = await GetAmountRepo().getAmountRepo();
      print('getAmountRepogetAmountRepo=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("----- getAmountRepo === >$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
