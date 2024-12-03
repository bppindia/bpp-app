import 'package:formz/formz.dart';

/// Enum for Pincode validation errors
enum PincodeValidationError {
  required('Please provide ZIP / postcode.'),
  invalid('Invalid pincode. Try again!');

  final String message;
  const PincodeValidationError(this.message);
}

/// Pincode input validation class
class Pincode extends FormzInput<String, PincodeValidationError> {
  const Pincode.pure() : super.pure('');
  const Pincode.dirty([String value = '']) : super.dirty(value);

  /// Regex pattern to validate 6-digit pincode
  static final _pincodeRegex = RegExp(r'^[0-9]{6}$');

  @override
  PincodeValidationError? validator(String value) {
    if (value.isEmpty) {
      return PincodeValidationError.required;
    }
    if (!_pincodeRegex.hasMatch(value)) {
      return PincodeValidationError.invalid;
    }
    return null;
  }
}
