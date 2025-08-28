// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:gallery_apps/api/endpoint/endpoint.dart';
// import 'package:gallery_apps/model/login_model.dart';
// import 'package:gallery_apps/preferences/shared_preferences.dart';

// class AuthenticationAPI {
//   static Future<LoginModel> loginUser(String email, String password) async {
//     final url = Uri.parse(Endpoint.login);
//     final response = await http.post(
//       url,
//       body: {"email": email, "password": password},
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final loginModel = LoginModel.fromJson(data);

//       // simpan token
//       await PreferenceHandler.saveToken(loginModel.token);

//       return loginModel;
//     } else {
//       throw Exception("Login gagal: ${response.body}");
//     }
//   }
// }
