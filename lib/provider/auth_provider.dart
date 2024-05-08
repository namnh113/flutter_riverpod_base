import 'package:flutter_riverpod_base/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

enum AuthState {
  signedIn,
  unauthorized,
}

@riverpod
class Auth extends _$Auth {
  User _user = User(email: '');

  @override
  AuthState build() {
    return _user.email.isNotEmpty ? AuthState.signedIn : AuthState.unauthorized;
  }

  void onSignIn({
    required String email,
    required String password,
  }) {
    _user = User(email: email);
    ref.invalidateSelf();
  }
}
