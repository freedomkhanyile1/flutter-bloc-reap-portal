import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/theme_constants.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
