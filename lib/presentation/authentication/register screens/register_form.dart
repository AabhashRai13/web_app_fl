import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/presentation/authentication/register%20screens/register_bloc/sign_up_bloc.dart';
import 'package:find_scan_return_web/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/widgets/buttons/default_button.dart';
import 'package:find_scan_return_web/presentation/widgets/inputFields/email_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/inputFields/input_widgets.dart';
import '../../widgets/widget/password_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();
  bool googleLoading = false;
  bool microsoftLoading = false;
  @override
  void dispose() {
    _emailEditingController.clear();
    _passwordEditingController.clear();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final SignUpBloc signUpBloc = sl<SignUpBloc>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: signUpBloc,
        listener: (context, state) {
          if (state is Loading) {
            loading = true;
          } else if (state is Loaded) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.loginSuccess)),
            );
            context.pushReplacementNamed(Routes.home);
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
              EmailFormField(
                emailController: _emailEditingController,
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              PasswordFormField(
                passwordController: _passwordEditingController,
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              InputFields(
                inputController: nameController,
                isRequired: true,
                hintText: AppStrings.enterName,
                labelText: AppStrings.nameLabel,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
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
                      signUpBloc.add(SignUp(
                          email: _emailEditingController.text.trim(),
                          password: _passwordEditingController.text.trim(),
                          name: nameController.text.trim()));
                    }
                  },
                  loading: loading,
                  text: AppStrings.signUp,
                ),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
