class UsersResponse {
  Data? data;

  UsersResponse({this.data});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Users>? users;

  Data({this.users});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }
}

class Users {
  String? name;

  Users({this.name});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
