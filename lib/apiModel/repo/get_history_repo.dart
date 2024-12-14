import 'dart:developer';

import '../api_services/api_services/api_routes.dart';
import '../api_services/api_services/api_service.dart';
import '../model/responseModel/get_history_response_model.dart';

class GetHistoryRepo extends ApiRoutes {
  Future<dynamic> getHistoryRepo(
      {String? goal, String? duration, String? gender, String? userId}) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.history);
    log("responseresponseresponse $response");
    GetHistoryResponseModel getHistoryResponseModel =
        GetHistoryResponseModel.fromJson(response);
    return getHistoryResponseModel;
  }
}
