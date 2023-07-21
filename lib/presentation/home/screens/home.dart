import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/resources/style_constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
      ),
      body: Text(
        AppStrings.appTitle,
        style: headingStyle,
      ),
    );
  }
}
