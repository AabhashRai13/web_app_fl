import 'package:find_scan_return_web/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_web/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/size_config.dart';
import '../authentication cubit/authentication_cubit.dart';

class SignInBanner extends StatelessWidget {
  final bool isDesktop;
  const SignInBanner(
      {super.key, required this.authenticationCubit, required this.isDesktop});

  final AuthenticationCubit authenticationCubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: isDesktop ? 2 : 1,
      child: size.height < 427
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(isDesktop ? 40 : 10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: getProportionateScreenHeight(300),
                      child: Image.asset(ImageAssets.logo)),
                  Text(
                    'Sign In to \nCreate QR and Print',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: isDesktop ? 45 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: isDesktop ? 20 : 12,
                  ),
                  const Text(
                    "If you don't have an account",
                    textAlign: TextAlign.start,
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
                          authenticationCubit.toogle(false);
                        },
                        child: Text(
                          "Register here!",
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
