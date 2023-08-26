import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPassword extends Cubit<bool> {
  LoginPassword() : super(true);
  upDateObscureText() {
    emit((state) ? false : true);
  }
}

class SignUpPassword extends Cubit<bool> {
  SignUpPassword() : super(true);
  upDateObscureText() {
    emit((state) ? false : true);
  }
}

class ConformPassword extends Cubit<bool> {
  ConformPassword() : super(true);
  upDateObscureText() {
    emit((state) ? false : true);
  }
}
