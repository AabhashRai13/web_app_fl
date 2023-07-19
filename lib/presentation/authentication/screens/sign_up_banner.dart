import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';
import '../authentication cubit/authentication_cubit.dart';


class SignUpBanner extends StatelessWidget {
  final bool isDesktop;

  const SignUpBanner(
      {super.key, required this.authenticationCubit, required this.isDesktop});

  final AuthenticationCubit authenticationCubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 2,
      child: size.height < 427
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(isDesktop ? 40 : 10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register to view, \nsave, and edit your OKRs',
                    style: TextStyle(
                      fontSize: isDesktop ? 45 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: isDesktop ? 30 : 15,
                  ),
                  const Text(
                    "Already have an account",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        "You can",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          authenticationCubit.toogle(true);
                        },
                        child: Text(
                          "SignIn here!",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}