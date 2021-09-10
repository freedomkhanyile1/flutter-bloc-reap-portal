import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/theme_constants.dart';
import 'package:mobile/locale/enums/menu_state_enum.dart';
import 'package:mobile/shared/shared.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // TODO add Navigator tiles.
      bottomNavigationBar: CustomBottomBar(
        selectedMenu: MenuState.home,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("Home"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_outlined),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined),
          color: Colors.black,
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
      ],
    );
  }
}
