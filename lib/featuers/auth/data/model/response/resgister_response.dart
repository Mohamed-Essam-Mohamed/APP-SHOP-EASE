class RegisterResponse {
  final String? id;
  final String? email;

  RegisterResponse({this.id, this.email});

  // from json
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      id: json['id'],
      email: json['email'],
    );
  }
}
