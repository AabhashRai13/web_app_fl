import 'package:find_scan_return_web/presentation/qrcode/screens/qrcode_view.dart';
import 'package:find_scan_return_web/presentation/resources/color_manager.dart';
import 'package:find_scan_return_web/presentation/resources/size_config.dart';
import 'package:find_scan_return_web/presentation/widgets/alertMessages/create_qr_alert.dart';
import 'package:flutter/material.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  HomeMobileState createState() => HomeMobileState();
}

class HomeMobileState extends State<HomeMobile> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogToGenerateQr(context);
        },
        backgroundColor: ColorManager.floatingActionButtonColor,
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      bottomNavigationBar: BottomAppBar(
          height: getProportionateScreenHeight(65),
          color: ColorManager.primary,
          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin:
              5, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.feed,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          )),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Expanded(child: _screens[_selectedIndex])],
      ),
    );
  }
}
