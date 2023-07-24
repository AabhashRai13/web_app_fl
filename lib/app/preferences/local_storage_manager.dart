// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class LocalStorageService {
  void saveTokenToLocalStorage(String token) {
    html.window.localStorage['jwt_token'] = token;
  }

  String? getTokenFromLocalStorage() {
    return html.window.localStorage['jwt_token'];
  }

  void clearLocalStorage() {
    html.window.localStorage.clear();
  }
}
