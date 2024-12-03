class Taluka {
  final String value;
  final bool isPure;

  const Taluka.pure()
      : value = '',
        isPure = true;

  const Taluka.dirty(this.value)
      : isPure = false;

  /// Validation logic to check if the value is valid (e.g., non-empty)
  bool get isValid => value.isNotEmpty;

  /// Allows creating a new instance with modified properties
  Taluka copyWith({
    String? value,
  }) {
    return Taluka.dirty(
      value ?? this.value,
    );
  }

  @override
  String toString() => 'Taluka(value: $value, isPure: $isPure, isValid: $isValid)';
}
