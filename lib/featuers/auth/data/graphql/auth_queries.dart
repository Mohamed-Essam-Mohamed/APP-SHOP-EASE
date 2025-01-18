import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/regsiter_request.dart';

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

  Map<String, dynamic> registerQuery({required RegisterRequest request}) {
    return {
      'query': r'''
            mutation Register($email: String!, $password: String!, $name: String!) {
      addUser(
        data: {
          name: $name
          email: $email
          password: $password
          avatar: "https://api.lorem.space/image/face?w=150&h=220"
          role: customer
        }
      ) {
        id
        email
      }
    }
      ''',
      'variables': {
        'email': request.email,
        'password': request.password,
        'name': request.name,
      },
    };
  }
}
