import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'password_page.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    final horizontalPadding = size.width * (isDesktop ? 0.2 : isTablet ? 0.1 : 0.05);
    final containerWidth = isDesktop ? 1000.0 : size.width;
    final logoSize = size.width * (isDesktop ? 0.15 : isTablet ? 0.2 : 0.25);
    final titleFontSize = size.width * (isDesktop ? 0.06 : isTablet ? 0.06 : 0.06);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: size.height * 0.02,
            ),
            child: Container(
              width: containerWidth,
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  children: [
                    // Logo and Title Section
                    Container(
                      width: logoSize,
                      height: logoSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/bpp_logo2.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Bharatiya Popular Party',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),

                    // Address Form Fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('Address Line 1', 'House/Flat No., Building Name, Street'),
                        const SizedBox(height: 16),
                        _buildTextField('Address Line 2', 'Area, Landmark'),
                        const SizedBox(height: 16),

                        // City, Taluka, District Row
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField('City/Village', 'Enter city/village'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField('Taluka', 'Enter taluka'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField('District', 'Enter district'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // State and Pincode Row
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildTextField('State', 'Enter state'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField('Pincode', 'Enter pincode',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.04),

                    // Next Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the LoginPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PasswordPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      String hint, {
        TextInputType? keyboardType,
        List<TextInputFormatter>? inputFormatters,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
