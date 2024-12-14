import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';

class AuthQueries {
  Map<String, dynamic> loginQuery({required LoginRequest request}) {
    return {
      'query': r'''
        mutation Login($email: String!, $password: String!) {
        login(email: $email, password: $password) {
          access_token
          refresh_token
        }
      }
      ''',
      'variables': {
        'email': request.email,
        'password': request.password,
      },
    };
  }
}
