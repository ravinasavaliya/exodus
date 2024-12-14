import 'dart:developer';

import '../api_services/api_services/api_routes.dart';
import '../api_services/api_services/api_service.dart';
import '../model/responseModel/get_amount_res_model.dart';

class GetAmountRepo extends ApiRoutes {
  Future<dynamic> getAmountRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.balance);
    log("responseresponseresponse $response");
    GetAmontResModel getAmontResModel = GetAmontResModel.fromJson(response);
    return getAmontResModel;
  }
}
