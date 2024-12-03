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
        appBar: TopNavigationBar(),
        body: Center(child: Text('Main Content Area')),
      ),
    );
  }
}

class TopNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  bool isExchangeSelected = true;
  Brightness _currentBrightness = Brightness.light;

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
      title: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTabButton("National", isExchangeSelected),
                SizedBox(width: 8),
                _buildTabButton("State", !isExchangeSelected),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            _showPopupIcon(context);
          },
          icon: Icon(
            _currentBrightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Colors.grey[800],
          ),
        ),
        IconButton(
          icon: Icon(Icons.menu, color: Colors.grey[800]),
          onPressed: () {
            _showPopupHymber(context);
          },
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExchangeSelected = title == "National";
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
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
        PopupMenuItem<int>(value: 4, child: Text("Profile", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 5, child: Text("Account", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 6, child: Text("Wallet", style: _popupMenuTextStyle())),
        PopupMenuDivider(),
        PopupMenuItem<int>(value: 7, child: Text("Log out", style: _popupMenuTextStyle())),
      ],
    ).then((value) {
      if (value != null) {
        print("Selected menu item: $value");
      }
    });
  }

  void _showPopupHymber(BuildContext context) {
    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 80.0, 0.0, 0.0),
      items: [
        PopupMenuItem<int>(value: 4, child: Text("Profile", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 5, child: Text("Account", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 6, child: Text("Wallet", style: _popupMenuTextStyle())),
        PopupMenuDivider(),
        PopupMenuItem<int>(value: 7, child: Text("Log out", style: _popupMenuTextStyle())),
      ],
    ).then((value) {
      if (value != null) {
        print("Selected menu item: $value");
      }
    });
  }

  void _showPopupIcon(BuildContext context) {
    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 80.0, 0.0, 0.0),
      items: [
        PopupMenuItem<int>(value: 1, child: Text("Light Mode", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 2, child: Text("Dark Mode", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 3, child: Text("System Mode", style: _popupMenuTextStyle())),
      ],
    ).then((value) {
      if (value != null) {
        switch (value) {
          case 1:
            _toggleBrightness(Brightness.light);
            break;
          case 2:
            _toggleBrightness(Brightness.dark);
            break;
          case 3:
            _toggleBrightness(null);
            break;
        }
      }
    });
  }

  void _toggleBrightness([Brightness? brightness]) {
    setState(() {
      _currentBrightness =
          brightness ?? (_currentBrightness == Brightness.light ? Brightness.dark : Brightness.light);

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: _currentBrightness,
          statusBarIconBrightness: _currentBrightness,
        ),
      );
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
