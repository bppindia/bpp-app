import 'package:formz/formz.dart';

enum HouseOrFlatNoValidationError {
  required('This field is required. Please fill up!'),
  invalid('Invalid house or flat number.');

  final String message;
  const HouseOrFlatNoValidationError(this.message);
}

class HouseOrFlatNo extends FormzInput<String, HouseOrFlatNoValidationError> {
  const HouseOrFlatNo.pure() : super.pure('');
  const HouseOrFlatNo.dirty([String value = '']) : super.dirty(value);

  static final _houseOrFlatNoRegex = RegExp(r'^[a-zA-Z0-9\s,.-]+$');

  @override
  HouseOrFlatNoValidationError? validator(String value) {
    if (value.isEmpty) {
      return HouseOrFlatNoValidationError.required;
    }
    if (!_houseOrFlatNoRegex.hasMatch(value)) {
      return HouseOrFlatNoValidationError.invalid;
    }
    return null;
  }
}
