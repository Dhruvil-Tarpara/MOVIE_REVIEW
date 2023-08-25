import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/auth/login_bloc.dart';
import 'package:movie_review/src/provider/bloc/obscure_cubit.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';

import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/utils/validetion.dart';
import 'package:movie_review/src/views/sign_up.dart';

import 'home.dart';
import 'login/bottom_button.dart';
import 'login/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<AutovalidateMode> _valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstColor.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (loginSuccess) {
              if (loginSuccess.user != null) {
                HiveHelper.hiveHelper.set(HiveKeys.login, true);
                HiveHelper.hiveHelper
                    .set(HiveKeys.user, loginSuccess.user!.toJson());
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                _clearController();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: FxText(
                      text: loginSuccess.error ?? "",
                      color: Colors.red,
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.white,
                  ),
                );
              }
            },
          );
        },
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, value, child) => Form(
            key: _loginKey,
            autovalidateMode: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FxText(
                    text: ConstString.loginTitle,
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height(context: context) * 0.01,
                  ),
                  FxText(
                    text: ConstString.loginSubtitle,
                    size: 14,
                    color: ConstColor.grey,
                  ),
                  SizedBox(
                    height: height(context: context) * 0.06,
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
                    textInputType: TextInputType.emailAddress,
                    labelText: FxText(
                      text: ConstString.password,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    obscureText: context.watch<ObscureText>().state,
                    maxLine: 1,
                    suffix: IconButton(
                      focusColor: Colors.transparent,
                      disabledColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        context.read<ObscureText>().upDateObscureText();
                      },
                      icon: context.watch<ObscureText>().state
                          ? Icon(
                              Icons.visibility_off,
                              color: ConstColor.grey,
                            )
                          : Icon(
                              Icons.visibility,
                              color: ConstColor.primary2,
                            ),
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
                    height: height(context: context) * 0.04,
                  ),
                  SizedBox(
                    width: width(context: context),
                    height: height(context: context) * 0.068,
                    child: FxButton(
                      onPressed: () async {
                        _valueNotifier.value =
                            AutovalidateMode.onUserInteraction;
                        if (_loginKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                                LoginEvent.loginData(
                                  _emailController.text,
                                  _passwordController.text,
                                ),
                              );
                        }
                      },
                      buttonText: ConstString.login,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: FxText(
                      text: ConstString.forgotPassword,
                      size: 12,
                      color: ConstColor.primary2,
                    ),
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  SizedBox(
                    width: width(context: context),
                    height: height(context: context) * 0.068,
                    child: ElevatedButton(
                      onPressed: () async {
                        context.read<LoginBloc>().add(
                              const LoginEvent.googleLogin(),
                            );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ConstColor.white),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: ConstColor.black,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Image(
                              image: AssetImage(Global.googleLogo),
                            ),
                          ),
                          SizedBox(
                            width: width(context: context) * 0.04,
                          ),
                          FxText(
                            text: ConstString.googleLogin,
                            size: 16,
                            color: ConstColor.black,
                          ),
                        ],
                      ),
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
                  builder: (context) => const SignUpScreen(),
                ),
              )
              .then(
                (value) => _clearController(),
              );
        },
        buttonText: ConstString.noAccount,
        buttonPage: ConstString.register,
      ),
    );
  }

  void _clearController() {
    _emailController.clear();
    _passwordController.clear();
  }

  void _cancelController() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
