import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/goals': (context) => GoalsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Home Screen')),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.pushNamed(context, '/goals'); // Navigate to GoalsScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      elevation: 8,
      items: [
        _buildNavItem(
          icon: Icons.home,
          label: 'Home',
          isSelected: _selectedIndex == 0,
          isWideScreen: isWideScreen,
        ),
        _buildNavItem(
          icon: Icons.flash_on,
          label: 'Contrib',
          isSelected: _selectedIndex == 1,
          isWideScreen: isWideScreen,
        ),
        _buildCenterItem(),
        _buildNavItem(
          icon: Icons.chat_bubble_outline,
          label: 'Goals',
          isSelected: _selectedIndex == 3,
          isWideScreen: isWideScreen,
        ),
        _buildNavItem(
          icon: Icons.account_balance_wallet,
          label: 'Wallet',
          isSelected: _selectedIndex == 4,
          isWideScreen: isWideScreen,
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedFontSize: isWideScreen ? 14 : 12,
      unselectedFontSize: isWideScreen ? 12 : 10,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required bool isWideScreen,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: isWideScreen ? 30 : 24),
      label: label,
    );
  }

  BottomNavigationBarItem _buildCenterItem() {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedIndex == 2 ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: _selectedIndex == 2
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]
              : [],
        ),
        child: Icon(
          Icons.pie_chart,
          color: _selectedIndex == 2 ? Colors.white : Colors.blue,
          size: 28,
        ),
      ),
      label: 'Vote',
    );
  }
}

class GoalsScreen extends StatelessWidget {
  final List<Map<String, String>> goals = [
    {'title': '13', 'subtitle': 'National Integrity', 'icon': '🌍', 'color': 'red'},
    {'title': '14', 'subtitle': 'Equal Opportunity And Gender Equality', 'icon': '⚖️', 'color': 'amber'},
    {'title': '15', 'subtitle': 'Good Health And Well-Being', 'icon': '❤️', 'color': 'green'},
    {'title': '16', 'subtitle': 'Against Muscle And Money Power', 'icon': '🕊️', 'color': 'blue'},
    {'title': '17', 'subtitle': 'Uphold Secularism', 'icon': '🔗', 'color': 'red'},
    {'title': '22', 'subtitle': 'Industrial Development & Infrastructure', 'icon': '🏗️', 'color': 'amber'},
    {'title': '13', 'subtitle': 'Employment & Economic Growth', 'icon': '📈', 'color': 'green'},
    {'title': '13', 'subtitle': 'Justice, Peace, Calm & Prosperity', 'icon': '⚖️', 'color': 'blue'},
    {'title': '13', 'subtitle': 'Upliftment of Farmers', 'icon': '🌾', 'color': 'green'},
    {'title': '13', 'subtitle': 'Quality Education', 'icon': '📚', 'color': 'red'},
  ];

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'amber':
        return Colors.amber;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: goals.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            String subtitle = goals[index]['subtitle']!;
            String icon = goals[index]['icon']!;
            String colorName = goals[index]['color']!;
            return GoalCard(
              title: goals[index]['title']!,
              subtitle: subtitle,
              icon: icon,
              color: _getColorFromName(colorName),
            );
          },
        ),
      ),
    );
  }
}

class GoalCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  const GoalCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 1.1; // Increase the scale slightly for a "pop" effect
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Reset the scale
    });
    _showPopUp(context); // Show pop-up dialog
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () {
        setState(() {
          _scale = 1.0; // Reset if the tap is canceled
        });
      },
      child: Card(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: _scale,
                duration: Duration(milliseconds: 150),
                child: Text(
                  widget.icon,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.subtitle),
        content: Text('Additional details about the goal "${widget.title}".'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
