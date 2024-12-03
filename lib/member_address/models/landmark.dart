class Landmark {
  final String value;
  final bool isPure;

  const Landmark.pure()
      : value = '',
        isPure = true;

  const Landmark.dirty(this.value)
      : isPure = false;


  /// Validation logic to check if the value is valid (e.g., non-empty)
  bool get isValid => value.isNotEmpty;

  /// Allows creating a new instance with modified properties
  Landmark copyWith({
    String? value,
  }) {
    return Landmark.dirty(
      value ?? this.value,
    );
  }

  @override
  String toString() => 'Landmark(value: $value, isPure: $isPure, isValid: $isValid)';
}
