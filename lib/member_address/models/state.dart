import 'package:formz/formz.dart';

// enum StreetValidationError {
//   required('This field can\'t be empty. Please provide a street name.');
//   invalid('Invalid house or flat number.');
//
//   final String message;
//   const StreetValidationError(this.message);
// }

enum StreetValidationError {
  required('This field can\'t be empty. Please provide a street name.'),
  invalid('Invalid street or flat number.');

  final String message;
  const StreetValidationError(this.message);
}

class Street extends FormzInput<String, StreetValidationError> {
  // Constructor for pure (empty value)
  const Street.pure() : super.pure('');
  // Constructor for dirty (initialized with a value)
  const Street.dirty([String value = '']) : super.dirty(value);

  static final _houseOrFlatNoRegex = RegExp(r'^[a-zA-Z0-9\s,.-]+$');

  @override
  StreetValidationError? validator(String value) {
    if (value.isEmpty) {
      return StreetValidationError.required;
    }
    if (!_houseOrFlatNoRegex.hasMatch(value)) {
      return StreetValidationError.invalid;
    }
    return null;
  }
}



