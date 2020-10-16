import 'dart:convert';
import 'package:http/http.dart' as http;
import '../general.dart';

abstract class ApiCall {
  Future<dynamic> callSignInApi(String phoneNum, String password);

}

class ApiCallService implements ApiCall {
    @override
  Future callSignInApi(String phoneNum, String password) async {
    var result = await http.post('$host/user_log_in',
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'phone': phoneNum, 'password': password}));
    return json.decode(result.body);
  }
}