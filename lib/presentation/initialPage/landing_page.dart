import 'package:find_scan_return_web/presentation/authentication/screens/authentication_mobile.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../authentication/screens/authentication_tab.dart';
import '../authentication/screens/authentication_web.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Responsive(
        mobile: LoginPageMobile(),
        tablet: LoginPageTab(),
        desktop: LoginPageWeb(),
      ),
    );
  }
}
