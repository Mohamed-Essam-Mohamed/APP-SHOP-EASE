class RegisterRequest {
  final String? email;
  final String? password;
  final String? name;

  const RegisterRequest({this.email, this.password, this.name});

  // to json
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
      };
}
