import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/widgets/buttons/default_button.dart';
import 'package:find_scan_return_web/presentation/widgets/inputFields/password_form_field.dart';
import 'package:find_scan_return_web/presentation/widgets/widget/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di.dart';
import '../../resources/size_config.dart';
import 'login_bloc/sign_in_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  final SignInBloc signInBloc = sl<SignInBloc>();
  bool loading = false;
  bool googleLoading = false;
  bool microsoftLoading = false;
  @override
  void dispose() {
    _username.clear();
    _passwordEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocConsumer<SignInBloc, SignInState>(
        bloc: signInBloc,
        listener: (context, state) {
          if (state is Loading) {
            loading = true;
          } else if (state is Loaded) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.loginSuccess)),
            );
          } else if (state is Error) {
            loading = false;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else {
            loading = false;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              InputFields(
                inputController: _username,
                isRequired: true,
              ),
              const SizedBox(height: 30),
              PasswordFormField(
                passwordController: _passwordEditingController,
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple[100]!,
                      spreadRadius: 10,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: DefaultButton(
                  fontSize: getProportionateScreenHeight(14),
                  press: () {
                    if (formKey.currentState!.validate()) {
                      signInBloc.add(SignIn(
                          email: _username.text.trim(),
                          password: _passwordEditingController.text.trim()));
                    }
                  },
                  loading: loading,
                  text: AppStrings.signIn,
                ),
              ),
              const SizedBox(height: 40),
              Row(children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    height: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Or continue with"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    height: 50,
                  ),
                ),
              ]),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}