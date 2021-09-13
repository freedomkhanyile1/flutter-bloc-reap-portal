import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/locale/constants/icon_constants.dart';
import 'package:mobile/locale/constants/theme_constants.dart';
import 'package:mobile/locale/enums/menu_state_enum.dart';
import 'package:mobile/shared/shared.dart';

List _menuItems = [
  {"id": 1, "name": "My Workspace", Icon: Icon(Icons.workspaces_outline)},
  {"id": 2, "name": "Credit Manager", Icon: Icon(Icons.money_outlined)},
  {"id": 3, "name": "Settings", Icon: Icon(Icons.settings_outlined)},
];

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome \n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
      // TODO add Navigator tiles.
      bottomNavigationBar: CustomBottomBar(
        selectedMenu: MenuState.home,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 80,
      title: Container(
        alignment: Alignment.topLeft,
        child: Image.asset(
          LogoConstants.signinLogo,
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
          height: 60,
        ),
      ),
      centerTitle: false,
    );
  }
}
