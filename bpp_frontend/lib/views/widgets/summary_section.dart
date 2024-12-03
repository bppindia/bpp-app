import 'package:flutter/material.dart';

class SummarySection extends StatefulWidget {
  @override
  _SummarySectionState createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  bool isVisible = false; // Control visibility for Wallet value

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Center-align items vertically
            children: [
              Expanded(
                child: _buildSection(
                  title: "Wallet (IND)",
                  value: "1234",
                  isVisible: isVisible,
                  isWideScreen: isWideScreen,
                  icon: Icons.account_balance_wallet,
                  iconColor: Colors.blueAccent,
                  onToggleVisibility: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  showVisibilityIcon: true, // Show visibility icon for Wallet only
                ),
              ),
              SizedBox(width: 20), // Increased spacing between Wallet and Member sections
              Expanded(
                child: _buildSection(
                  title: "Member",
                  value: "24",
                  isVisible: isVisible,
                  isWideScreen: isWideScreen,
                  icon: Icons.people,
                  iconColor: Colors.green,
                  onToggleVisibility: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  showVisibilityIcon: false, // Hide visibility icon for Member
                ),
              ),
            ],
          ),
          // SizedBox(height: 24), // Increased spacing between summary sections and action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers buttons horizontally
            children: [
              _buildCustomButton(
                label: "Donate",
                backgroundColor: Colors.grey[300]!,
                textColor: Colors.black,
                onPressed: () {
                  // Add functionality here
                },
                isWideScreen: isWideScreen,
              ),
              SizedBox(width: screenWidth > 600 ? 20 : 16), // Spacing between buttons
              _buildCustomButton(
                label: "Deposit",
                backgroundColor: Colors.indigo[700]!,
                textColor: Colors.white,
                onPressed: () {
                  // Add functionality here
                },
                isWideScreen: isWideScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String value,
    required bool isVisible,
    required bool isWideScreen,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onToggleVisibility,
    required bool showVisibilityIcon, // Add parameter to control visibility icon
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center-aligns the text and icon
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center-align icon and title horizontally
          children: [
            Icon(icon, color: iconColor, size: isWideScreen ? 28 : 24),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: isWideScreen ? 20 : 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        // SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center-align value and visibility icon
          children: [
            AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              crossFadeState: isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Text(
                value,
                style: TextStyle(
                  fontSize: isWideScreen ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              secondChild: Text(
                "******",
                style: TextStyle(
                  fontSize: isWideScreen ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (showVisibilityIcon) // Conditionally show the visibility icon
              Padding(
                padding: const EdgeInsets.only(top: 1), // Add top padding
                child: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: isVisible ? Colors.blue : Colors.grey[600],
                    size: 20,
                  ),
                  onPressed: onToggleVisibility,
                ),
              )

          ],
        ),
      ],
    );
  }

  Widget _buildCustomButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
    required bool isWideScreen,
  }) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isWideScreen ? 12 : 10,
              horizontal: isWideScreen ? 20 : 8,
            ),
            elevation: 2,
          ).copyWith(
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor.withOpacity(0.7);
              }
              if (states.contains(MaterialState.hovered)) {
                return backgroundColor.withOpacity(0.85);
              }
              return null;
            }),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isWideScreen ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
