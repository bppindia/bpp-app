import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: ProfileInfo(),
        body: Center(child: Text('Main Content Area')),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget implements PreferredSizeWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}

class _TopNavigationBarState extends State<ProfileInfo> {
  bool isExchangeSelected = true;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          _showPopupMenu(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(
              "CN",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }


  void _showPopupMenu(BuildContext context) {
    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 80.0, 0.0, 0.0),
      items: [
        PopupMenuItem<int>(value: 4, child: Text("Dashbaord", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 5, child: Text("Account", style: _popupMenuTextStyle())),
        PopupMenuDivider(),
        PopupMenuItem<int>(value: 7, child: Text("Sign out", style: _popupMenuTextStyle())),
      ],
    ).then((value) {
      if (value != null) {
        print("Selected menu item: $value");
      }
    });
  }

  TextStyle _popupMenuTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey[800],
    );
  }
}
