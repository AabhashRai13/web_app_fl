import 'package:find_scan_return_web/presentation/authentication/screens/sign_in_banner.dart';
import 'package:find_scan_return_web/presentation/authentication/screens/sign_up_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di.dart';
import '../../widgets/widget/menu_item.dart';
import '../Login screens/login_body.dart';
import '../authentication cubit/authentication_cubit.dart';
import '../register screens/register_body.dart';

class LoginPageTab extends StatefulWidget {
    final String? from;
  const LoginPageTab({super.key, this.from});

  @override
  State<LoginPageTab> createState() => _LoginPageTabState();
}

class _LoginPageTabState extends State<LoginPageTab> {
  final AuthenticationCubit authenticationCubit = sl<AuthenticationCubit>();

  @override
  void initState() {
    super.initState();
    if (widget.from == "GenerateOkrButton") {
      authenticationCubit.toogle(false);
    } else if (widget.from == "SignInButton") {
      authenticationCubit.toogle(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        bloc: authenticationCubit,
        builder: (context, state) {
          return Row(
            children: [
              state.isSignIn
                  ? SignInBanner(
                      authenticationCubit: authenticationCubit,
                      isDesktop: false,
                    )
                  : SignUpBanner(authenticationCubit: authenticationCubit, isDesktop: false,),
              Expanded(
                flex: 2,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8),
                  children: [
                    Menu(
                      authenticationCubit: authenticationCubit,
                      isSignIn: state.isSignIn,
                    ),
                    state.isSignIn
                        ? Body(
                            authenticationCubit: authenticationCubit,
                          )
                        : RegisterBody(
                            authenticationCubit: authenticationCubit,
                          )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final bool isSignIn;
  final AuthenticationCubit authenticationCubit;
  const Menu(
      {super.key, required this.authenticationCubit, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuItem(
            title: 'Sign In',
            isActive: isSignIn,
            press: () {
              authenticationCubit.toogle(true);
            },
          ),
          MenuItem(
              title: 'Register',
              isActive: !isSignIn,
              press: () {
                authenticationCubit.toogle(false);
              }),
        ],
      ),
    );
  }
}
