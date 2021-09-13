import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/theme_constants.dart';
import 'package:mobile/locale/enums/menu_state_enum.dart';
import 'package:mobile/pages/index.dart';

class CustomBottomBar extends StatelessWidget {
  final MenuState selectedMenu;
  const CustomBottomBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color inActiveColor = Colors.grey;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.05),
            ),
          ]),
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, HomePage.routeName),
            icon: Icon(
              Icons.store_outlined,
              size: 30,
              color: MenuState.home == selectedMenu
                  ? kPrimaryColor
                  : inActiveColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.workspaces_outline,
              size: 30,
              color: MenuState.workspace == selectedMenu
                  ? kPrimaryColor
                  : inActiveColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.document_scanner_outlined,
              size: 30,
              color: MenuState.applications == selectedMenu
                  ? kPrimaryColor
                  : inActiveColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.person_outline,
              size: 30,
              color: MenuState.profile == selectedMenu
                  ? kPrimaryColor
                  : inActiveColor,
            ),
          ),
        ],
      )),
    );
  }
}
