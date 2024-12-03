import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'address_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<PersonalPage> {
  final _formKey = GlobalKey<FormState>();  // Add this line at the top
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  // Validation Methods
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String? validateAadhar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Aadhar number is required';
    }
    if (value.length != 12) {
      return 'Aadhar number must be exactly 12 digits';
    }
    if (!RegExp(r'^[0-9]{12}$').hasMatch(value)) {
      return 'Please enter valid Aadhar number';
    }
    return null;
  }

  String? validateVoterId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Voter ID is required';
    }
    if (value.length != 10) {
      return 'Voter ID must be exactly 10 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    final horizontalPadding = size.width * (isDesktop ? 0.2 : isTablet ? 0.1 : 0.05);
    final containerWidth = isDesktop ? 1000.0 : size.width;
    final logoSize = size.width * (isDesktop ? 0.15 : isTablet ? 0.2 : 0.26);
    final titleFontSize = size.width * (isDesktop ? 0.02 : isTablet ? 0.06 : 0.06);
    final labelFontSize = size.width * (isDesktop ? 0.012 : isTablet ? 0.015 : 0.035);

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
                key: _formKey,  // Add this line
                autovalidateMode: AutovalidateMode.onUserInteraction,
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

                    // Form Fields
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            // Name Fields
                            _buildResponsiveRow(
                              constraints,
                              [
                                _buildFormField(
                                  'First Name',
                                  'First name',
                                  labelFontSize,
                                  constraints,
                                ),
                                _buildFormField(
                                  'Middle Name',
                                  'Middle name',
                                  labelFontSize,
                                  constraints,
                                ),
                              ],
                            ),
                            _buildFormField(
                              'Last Name',
                              'Last name',
                              labelFontSize,
                              constraints,
                              fullWidth: true,
                            ),

                            // Date of Birth and Age Fields
                            _buildDateAndAgeFields(constraints, labelFontSize),

                            // Phone Number and Gender Row
                            _buildResponsiveRow(
                              constraints,
                              [
                                _buildDropdownField(
                                  'Gender',
                                  'Select gender',
                                  labelFontSize,
                                  constraints,
                                  ['Male', 'Female', 'Other'],
                                ),
                                _buildValidatedFormField(
                                  'Phone Number',
                                  'Enter phone number',
                                  labelFontSize,
                                  constraints,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  validator: validatePhone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                ),
                              ],
                            ),

                            // Voter ID and Aadhar Number Row
                            _buildResponsiveRow(
                              constraints,
                              [
                                _buildValidatedFormField(
                                  'Voter ID',
                                  'Enter Voter ID',
                                  labelFontSize,
                                  constraints,
                                  maxLength: 10,
                                  validator: validateVoterId,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                                  ],
                                ),
                                _buildValidatedFormField(
                                  'Aadhar Number',
                                  'Enter Aadhar Number',
                                  labelFontSize,
                                  constraints,
                                  keyboardType: TextInputType.number,
                                  maxLength: 12,
                                  validator: validateAadhar,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(12),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: size.height * 0.04),

                    // Next Button
                    SizedBox(
                      width: isDesktop ? containerWidth * 0.3 : double.infinity,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {  // Update this line
                            Get.to(
                                  () => const AddressPage(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: labelFontSize * 1.2,
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

  Widget _buildDateAndAgeFields(BoxConstraints constraints, double labelFontSize) {
    return _buildResponsiveRow(
      constraints,
      [
        // Date of Birth field
        Container(
          width: constraints.maxWidth > 600 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'mm-dd-yyyy',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (picked != null) {
                        setState(() {
                          dateController.text = DateFormat('MM-dd-yyyy').format(picked);
                          // Calculate and update age
                          final age = DateTime.now().year - picked.year;
                          ageController.text = age.toString();
                        });
                      }
                    },
                  ),
                ),
                onChanged: (value) {
                  // Validate and parse the manually entered date
                  try {
                    final date = DateFormat('MM-dd-yyyy').parse(value);
                    final age = DateTime.now().year - date.year;
                    setState(() {
                      ageController.text = age.toString();
                    });
                  } catch (e) {
                    // Invalid date format
                  }
                },
              ),
            ],
          ),
        ),

        // Age field with increment/decrement buttons
        Container(
          width: constraints.maxWidth > 600 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Age',
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveRow(BoxConstraints constraints, List<Widget> children) {
    return Container(
      width: constraints.maxWidth,
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: children,
      ),
    );
  }

  Widget _buildFormField(
      String label,
      String hint,
      double fontSize,
      BoxConstraints constraints, {
        bool fullWidth = false,
        TextInputType? keyboardType,
        Widget? suffix,
      }) {
    final fieldWidth = fullWidth
        ? constraints.maxWidth
        : (constraints.maxWidth > 600 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth);

    return Container(
      width: fieldWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              suffixIcon: suffix,
            ),
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }

  Widget _buildValidatedFormField(
      String label,
      String hint,
      double fontSize,
      BoxConstraints constraints, {
        TextInputType? keyboardType,
        int? maxLength,
        String? Function(String?)? validator,
        List<TextInputFormatter>? inputFormatters,
      }) {
    final fieldWidth = constraints.maxWidth > 600
        ? (constraints.maxWidth - 20) / 2
        : constraints.maxWidth;

    return Container(
      width: fieldWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              counterText: '', // Hides the counter text
            ),
            keyboardType: keyboardType,
            maxLength: maxLength,
            validator: validator,
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
      String label,
      String hint,
      double fontSize,
      BoxConstraints constraints,
      List<String> items,
      ) {
    final fieldWidth = constraints.maxWidth > 600
        ? (constraints.maxWidth - 20) / 2
        : constraints.maxWidth;

    return Container(
      width: fieldWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle gender selection
            },
          ),
        ],
      ),
    );
  }
}


