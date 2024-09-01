import 'package:weather_app_v1/helper/network_service.dart';
import 'package:weather_app_v1/SelectMainService/user_list_model.dart';

class SelectMainService {
// https://reqres.in/api/users?page=1
  Future<UserList> getUserList() async {
    final Map<String, dynamic> params = {"page": 1};
    final service = RouteService(
      urlPath: BaseURL.appBaseURL,
      parameters: params,
      endpoint: "users",
    );
    final response = await NetworkService.get(
      service: service,
      fromJson: (json) => UserList.fromJson(json),
    );
    return response;
  }
}
