import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentGoalIndex = 0;
  bool showAnimatedText = false;
  bool showGoalBox = false;
  bool showGoalTitle = false;
  bool showGoalDescription = false;

  final List<Map<String, dynamic>> goalData = [
    {
      'title': 'Goal1',
      'color': Colors.red,
      'icon': Icons.public,
      'description': 'NATIONAL\nINTEGRITY.',
    },
    {
      'title': 'Goal2',
      'color': Colors.orange,
      'icon': Icons.people,
      'description': 'EQUAL OPPORTUNITY\nGENDER EQUALITY',
    },
    {
      'title': 'Goal3',
      'color': Colors.green,
      'icon': Icons.healing,
      'description': 'GOOD HEALTH\nWELL-BEING',
    },
    {
      'title': 'Goal4',
      'color': Colors.blue,
      'icon': Icons.balance,
      'description': 'JUSTICE, PEACE,CLAM\nPROSPERITY',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startGoalSequence();
  }

  void _startGoalSequence() async {
    while (mounted) {
      setState(() => showAnimatedText = true);

      await Future.delayed(Duration(seconds: 3));
      setState(() => showGoalDescription = true);  // Show description first

      await Future.delayed(Duration(seconds: 2));
      setState(() => showGoalBox = true);

      await Future.delayed(Duration(seconds: 2));
      setState(() => showGoalTitle = true);

      await Future.delayed(Duration(seconds: 3));
      setState(() {
        showGoalDescription = false;
        showGoalTitle = false;
        showGoalBox = false;
      });

      await Future.delayed(Duration(seconds: 1));
      setState(() {
        showAnimatedText = false;
        currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentGoal = goalData[currentGoalIndex];

    return Scaffold(
      backgroundColor: currentGoal['color'],
      body: Stack(
        children: [
          if (showAnimatedText && showGoalDescription)
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animated Text "USE THIS APP TO"
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'USE THIS APP TO',
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'BebasNeue',
                            color: Color.fromRGBO(214, 214, 214, 0.8),
                            letterSpacing: 0.5,
                            height: 1.2,
                          ),
                          speed: Duration(milliseconds: 140),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                    SizedBox(height: 20.0),
                    // Goal Description Text
                    Text(
                      currentGoal['description'] ?? '',
                      key: ValueKey<int>(currentGoalIndex),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BebasNeue',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // Main Content Centered, with Goal Box and Title after Description
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Animated rotation for the box
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      if (child is GoalTile) {
                        return AnimatedBuilder(
                          animation: animation,
                          child: child,
                          builder: (BuildContext context, Widget? child) {
                            final flipAngle = Tween<double>(begin: 3.14, end: 0.0).animate(animation).value;
                            return Transform(
                              alignment: Alignment.centerLeft,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(flipAngle),
                              child: animation.value < 0.5
                                  ? Opacity(opacity: 0.0)
                                  : child,
                            );
                          },
                        );
                      }
                      return child;
                    },
                    child: showGoalBox
                        ? Padding(
                      padding: const EdgeInsets.only(right: 80.0),
                      child: GoalTile(
                        key: ValueKey<int>(currentGoalIndex),
                        number: "${currentGoalIndex + 1}",
                        color: currentGoal['color'],
                        icon: currentGoal['icon'],
                        title: currentGoal['title'],
                      ),
                    )
                        : SizedBox.shrink(),
                  ),

                  // Spacer and animated sliding text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          final slideIn = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);
                          return SlideTransition(position: slideIn, child: child);
                        },
                        child: showGoalTitle
                            ? Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text(
                            currentGoal['title'],
                            key: ValueKey<int>(currentGoalIndex),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BebasNeue',
                              color: Color.fromRGBO(214, 214, 214, 0.8),
                            ),
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalTile extends StatelessWidget {
  final String number;
  final Color color;
  final IconData icon;
  final String title;

  GoalTile({
    required Key key,
    required this.number,
    required this.color,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SizedBox(
            height: 140,
            width: 140,
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide(color: Colors.white, width: 3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
