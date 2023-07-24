import 'package:find_scan_return_web/presentation/qrcode/screens/qrcode_view.dart';
import 'package:find_scan_return_web/presentation/resources/color_manager.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_web/presentation/widgets/alertMessages/create_qr_alert.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/hover_button.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  HomeWebState createState() => HomeWebState();
}

class HomeWebState extends State<HomeWeb> {
  final List<Widget> _screens = [
    // Content for Home tab
    const QrCodeView(),
    // Content for Feed tab
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationRail(
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                selectedIndex: _selectedIndex,
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.feed), label: Text('Feed')),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text('Favorites')),
                  NavigationRailDestination(
                      icon: Icon(Icons.settings), label: Text('Settings')),
                ],
                labelType: NavigationRailLabelType.all,
                selectedLabelTextStyle: const TextStyle(
                  color: Colors.teal,
                ),
                unselectedLabelTextStyle: const TextStyle(),
                // Called when one tab is selected
                leading: Container(
                  margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(10),
                      left: getProportionateScreenWidth(2),
                      right: getProportionateScreenWidth(2)),
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(20),
                  decoration: ShapeDecoration(
                    color: ColorManager.primary,
                    shape: const StadiumBorder(),
                  ),
                  // ignore: prefer_const_constructors
                  child: HoverButton(
                    hoverText: AppStrings.createQr,
                    color: Colors.white,
                    icon: Icons.create,
                    function: () {
                      showDialogToGenerateQr(context);
                    },
                  ),
                ),
              ),
              Expanded(child: _screens[_selectedIndex]),
            ],
          ),
        ],
      ),
    );
  }
}
