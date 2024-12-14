class LoginResponse {
  Data? data;

  LoginResponse({this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(login: Login(accessToken: "Invalid Password or Email"));
  }
}

class Data {
  Login? login;

  Data({this.login});

  Data.fromJson(Map<String, dynamic> json) {
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
  }
}

class Login {
  String? accessToken;
  String? refreshToken;

  Login({this.accessToken, this.refreshToken});

  Login.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}
