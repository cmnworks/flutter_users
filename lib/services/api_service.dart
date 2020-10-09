import 'package:flutter_users/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  void authenticate({String email, String password, Function onAuth}) async {
    Map<String, String> log = {"email": email, "password": password};
    await http.post(Config.endPointAuthenticate, body: log).then((response) {
      onAuth(response);
    });
  }

  void register({String email, String password, Function onRegister}) async {
    Map<String, String> log = {"email": email, "password": password};
    await http.post(Config.endPointRegister, body: log).then((response) {
      onRegister(response);
    });
  }
}
