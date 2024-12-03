import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class BppNavbar extends StatefulWidget {
  const BppNavbar({Key? key}) : super(key: key);

  @override
  _BppNavbarState createState() => _BppNavbarState();
}

class _BppNavbarState extends State<BppNavbar> {
  final List<RouteItem> routeList = [
    RouteItem(href: '/', label: 'Home'),
    RouteItem(href: '/vision', label: 'Vision'),
    RouteItem(href: '/mission', label: 'Our Mission'),
    RouteItem(href: '/mapping', label: 'Mapping'),
    RouteItem(href: '/why-bpp', label: 'Why BPP'),
  ];

  final List<MenuItem> membershipItems = [
    MenuItem(
      title: 'Join Now',
      href: '/membership/join-now',
      description: 'Become a member and enjoy exclusive benefits.',
    ),
    MenuItem(
      title: 'Membership Privilege',
      href: '/membership/membership-privilege',
      description: 'Learn more about the privileges of being a member.',
    ),
    MenuItem(
      title: 'Active Membership Term',
      href: '/membership/membership-term',
      description: 'View details of your active membership term.',
    ),
    MenuItem(
      title: 'Sign in & Register',
      href: '/auth/login',
      description: 'Sign in or register for membership.',
    ),
    MenuItem(
      title: 'Membership Renewals',
      href: '/membership/renewals',
      description: 'Renew your membership easily.',
    ),
    MenuItem(
      title: 'Forget Pin',
      href: '/auth/forgot-pin',
      description: 'Recover your membership pin.',
    ),
  ];

  final List<MenuItem> communityContributionItems = [
    MenuItem(
      title: 'Introduction',
      href: '/community-contribution/introduction',
      description: 'Community contribution',
    ),
    MenuItem(
      title: 'How it works',
      href: '/community-contribution/how-it-works',
      description: 'Join the business community and grow your network.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/logo/bppLogo.svg',
            height: 65,
            width: 65,
          ),
          SizedBox(width: 8),
          Text(
            'Bharatiya Popular Party',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.person_add),
          onSelected: (String value) {
            context.go(value);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: '/membership/join-now',
              child: Text('Join BPP'),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.language),
          onPressed: _showLanguageDialog,
        ),
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: _toggleThemeMode,
        ),
      ],
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  // Implement language change logic
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Hindi'),
                onTap: () {
                  // Implement language change logic
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleThemeMode() {
    // Implement theme toggle logic
  }
}

class BppDrawer extends StatelessWidget {
  final List<RouteItem> routeList;
  final List<MenuItem> membershipItems;
  final List<MenuItem> communityContributionItems;

  const BppDrawer({
    Key? key,
    required this.routeList,
    required this.membershipItems,
    required this.communityContributionItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Bharatiya Popular Party',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...routeList.map((route) => ListTile(
            title: Text(route.label),
            onTap: () {
              context.go(route.href);
              Navigator.pop(context);
            },
          )),
          ExpansionTile(
            title: Text('About Us'),
            children: [
              // Add About Us submenu items
            ],
          ),
          ExpansionTile(
            title: Text('Membership'),
            children: membershipItems.map((item) => ListTile(
              title: Text(item.title),
              subtitle: Text(item.description),
              onTap: () {
                context.go(item.href);
                Navigator.pop(context);
              },
            )).toList(),
          ),
          ExpansionTile(
            title: Text('Community Contributions'),
            children: communityContributionItems.map((item) => ListTile(
              title: Text(item.title),
              subtitle: Text(item.description),
              onTap: () {
                context.go(item.href);
                Navigator.pop(context);
              },
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class RouteItem {
  final String href;
  final String label;

  RouteItem({required this.href, required this.label});
}

class MenuItem {
  final String title;
  final String href;
  final String description;

  MenuItem({
    required this.title,
    required this.href,
    required this.description,
  });
}