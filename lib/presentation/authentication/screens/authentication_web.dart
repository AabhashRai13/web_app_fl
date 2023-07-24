import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/presentation/authentication/register%20screens/register_body.dart';
import 'package:find_scan_return_web/presentation/authentication/screens/sign_in_banner.dart';
import 'package:find_scan_return_web/presentation/authentication/screens/sign_up_banner.dart';
import 'package:find_scan_return_web/presentation/widgets/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login screens/login_body.dart';
import '../authentication cubit/authentication_cubit.dart';

class LoginPageWeb extends StatefulWidget {
  final String? from;
  const LoginPageWeb({super.key, this.from});

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.isSignIn
                  ? SignInBanner(
                      authenticationCubit: authenticationCubit,
                      isDesktop: true,
                    )
                  : SignUpBanner(
                      authenticationCubit: authenticationCubit,
                      isDesktop: true,
                    ),
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
