import 'package:find_scan_return_web/app/di.dart';
import 'package:find_scan_return_web/domain/usecases/sign_out_usecase.dart';
import 'package:find_scan_return_web/presentation/home/screens/home_mobile.dart';
import 'package:find_scan_return_web/presentation/home/screens/home_web.dart';
import 'package:find_scan_return_web/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  final SignOutUsecase signOutUsecase = sl<SignOutUsecase>();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        actions: [
          IconButton(
              onPressed: () {
                signOutUsecase.call();
                context.goNamed(Routes.initialScreenRoute);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Responsive(
          mobile: HomeMobile(), tablet: HomeWeb(), desktop: HomeWeb()),
    );
  }
}