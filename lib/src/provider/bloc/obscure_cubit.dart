import 'package:flutter_bloc/flutter_bloc.dart';

class ObscureText extends Cubit<bool> {
  ObscureText() : super(false);
  upDateObscureText() {
    emit((state) ? false : true);
  }
}
