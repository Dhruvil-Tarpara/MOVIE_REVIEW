import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/auth/sign_up/sign_up_bloc.dart';
import 'package:movie_review/src/provider/bloc/obscure_cubit.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/utils/validetion.dart';
import 'package:movie_review/src/views/login.dart';
import 'package:movie_review/src/views/login/dialog.dart';

import 'login/bottom_button.dart';
import 'login/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _singUpKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();
  final ValueNotifier<AutovalidateMode> _valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  @override
  void initState() {
    super.initState();
    _valueNotifier.value = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    super.dispose();
    _cancelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.white,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            loding: (isLoding) {
              if (isLoding) {
                Dialogs.showLoadingDialog(context);
              } else {
                Navigator.pop(context);
              }
            },
            success: (loginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: FxText(
                    text: ConstString.createAcoount,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.white,
                ),
              );
              Navigator.of(context)
                  .pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  )
                  .then(
                    (value) => _clearController(),
                  );
            },
            error: (massage) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: FxText(
                    text: massage,
                    color: Colors.red,
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.white,
                ),
              );
            },
          );
        },
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, value, child) => Form(
            autovalidateMode: value,
            key: _singUpKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height(context: context) * 0.14,
                  ),
                  const FxText(
                    text: ConstString.signUpTitle,
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height(context: context) * 0.01,
                  ),
                  FxText(
                    text: ConstString.signUpSubtitle,
                    size: 14,
                    color: ConstColor.grey,
                  ),
                  SizedBox(
                    height: height(context: context) * 0.06,
                  ),
                  FxTextFormField(
                    controller: _userNameController,
                    textInputType: TextInputType.text,
                    labelText: FxText(
                      text: ConstString.userName,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.nameError1;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.02,
                  ),
                  FxTextFormField(
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: FxText(
                      text: ConstString.email,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.emailError1;
                      } else if (!emailValidation(
                          email: _emailController.text)) {
                        return ConstString.emailError2;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.02,
                  ),
                  FxTextFormField(
                    controller: _passwordController,
                    textInputType: TextInputType.text,
                    obscureText: context.watch<SignUpPassword>().state,
                    maxLine: 1,
                    suffix: IconButton(
                      focusColor: Colors.transparent,
                      disabledColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        context.read<SignUpPassword>().upDateObscureText();
                      },
                      icon: context.watch<SignUpPassword>().state
                          ? Icon(
                              Icons.visibility_off,
                              color: ConstColor.grey,
                            )
                          : Icon(
                              Icons.visibility,
                              color: ConstColor.primary2,
                            ),
                    ),
                    labelText: FxText(
                      text: ConstString.password,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.passwordError1;
                      } else if (!passwordValidation(
                          password: _passwordController.text)) {
                        return ConstString.passwordError2;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.02,
                  ),
                  FxTextFormField(
                    controller: _conformPasswordController,
                    textInputType: TextInputType.text,
                    obscureText: context.watch<ConformPassword>().state,
                    maxLine: 1,
                    suffix: IconButton(
                      focusColor: Colors.transparent,
                      disabledColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        context.read<ConformPassword>().upDateObscureText();
                      },
                      icon: context.watch<ConformPassword>().state
                          ? Icon(
                              Icons.visibility_off,
                              color: ConstColor.grey,
                            )
                          : Icon(
                              Icons.visibility,
                              color: ConstColor.primary2,
                            ),
                    ),
                    labelText: FxText(
                      text: ConstString.conformPassword,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.passwordError1;
                      } else if (value != _passwordController.text) {
                        return ConstString.passwordError3;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  SizedBox(
                    width: width(context: context),
                    height: height(context: context) * 0.068,
                    child: FxButton(
                      onPressed: () async {
                        _valueNotifier.value =
                            AutovalidateMode.onUserInteraction;
                        if (_singUpKey.currentState!.validate()) {
                          context.read<SignUpBloc>().add(
                                SignUpEvent.signUpData(
                                  _emailController.text,
                                  _passwordController.text,
                                ),
                              );
                        }
                      },
                      buttonText: ConstString.signUp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              )
              .then(
                (value) => _clearController(),
              );
        },
        buttonText: ConstString.haveAccount,
        buttonPage: ConstString.login,
      ),
    );
  }

  void _clearController() {
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _conformPasswordController.clear();
  }

  void _cancelController() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();
  }
}
