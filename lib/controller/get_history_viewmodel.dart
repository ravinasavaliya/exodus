import 'package:exodus/apiModel/model/responseModel/get_history_response_model.dart';
import 'package:exodus/apiModel/repo/get_history_repo.dart';
import 'package:get/get.dart';

import '../apiModel/api_services/api_services/api_response.dart';

class GetHistoryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  Future<void> getHistoryViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    update();
    try {
      GetHistoryResponseModel response =
          await GetHistoryRepo().getHistoryRepo();
      print('GetHistoryResponseModel=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("----- GetHistoryResponseModel === >$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
