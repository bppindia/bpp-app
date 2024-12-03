import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we're in a mobile or wider layout
        bool isMobile = constraints.maxWidth < 600;

        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                _buildHeaderSection(context, isMobile),
                const SizedBox(height: 16),

                // User Info and Actions
                _buildUserInfoSection(context, isMobile),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection(BuildContext context, bool isMobile) {
    return isMobile
        ? _buildMobileHeaderSection(context)
        : _buildWideHeaderSection(context);
  }

  Widget _buildWideHeaderSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Dashboard Title and Welcome
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Colors.black87, Colors.black54],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome back, Swapnil!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),

        // Balance and Logout
        Row(
          children: [
            _buildBalanceCard(),
            const SizedBox(width: 16),
            _buildLogoutButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Colors.black87, Colors.black54],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome back, Swapnil!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBalanceCard(),
            _buildLogoutButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade100, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.account_balance_wallet_outlined, size: 20, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 8),
            Chip(
              label: const Text('₹-229'),
              backgroundColor: Colors.green.shade50,
              labelStyle: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return IconButton(
      icon: const Icon(Icons.logout_outlined, color: Colors.grey),
      iconSize: 24,
      onPressed: () {
        // Add logout logic here
      },
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  Widget _buildUserInfoSection(BuildContext context, bool isMobile) {
    return isMobile
        ? _buildMobileUserInfoSection(context)
        : _buildWideUserInfoSection(context);
  }

  Widget _buildWideUserInfoSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Section - User Details
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Swapnil Kishor Mahadik',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
                    onPressed: () {
                      // Add edit profile logic
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Primary Member',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_up_outlined, size: 20, color: Colors.grey),
                    onPressed: () {
                      // Add membership upgrade logic
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        // Center Section - Donate Button
        Expanded(
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Add donate logic
              },
              icon: const FaIcon(FontAwesomeIcons.donate, size: 20),
              label: const Text('Donate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),

        // Right Section - Membership Info
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildInfoRow(Icons.group_outlined, 'Membership No: 001'),
              _buildInfoRow(Icons.calendar_today_outlined, 'Valid until: Mar 26, 2028'),
              const SizedBox(height: 8),
              Chip(
                label: const Text('0 Referrals'),
                side: BorderSide(color: Colors.grey.shade300),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileUserInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Details
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Swapnil Kishor Mahadik',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
                overflow: TextOverflow.ellipsis,
              ),

            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
              onPressed: () {
                // Add edit profile logic
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Primary Member',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_circle_up_outlined, size: 20, color: Colors.grey),
              onPressed: () {
                // Add membership upgrade logic
              },
            ),
          ],
        ),

        // Donate Button
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton.icon(
              onPressed: () {
                // Add donate logic
              },
              icon: const FaIcon(FontAwesomeIcons.donate, size: 20),
              label: const Text('Donate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),

        // Membership Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.group_outlined, 'Membership No: 001'),
            _buildInfoRow(Icons.calendar_today_outlined, 'Valid until: Mar 26, 2028'),
            const SizedBox(height: 8),
            Chip(
              label: const Text('0 Referrals'),
              side: BorderSide(color: Colors.grey.shade300),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}