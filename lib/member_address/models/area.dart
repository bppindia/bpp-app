class Area {
  final String value;
  final bool isPure;

  const Area.pure()
      : value = '',
        isPure = true;

  const Area.dirty(this.value)
      : isPure = false;

  /// Validation logic to check if the value is valid (e.g., non-empty)
  bool get isValid => value.isNotEmpty;

  /// Allows creating a new instance with modified properties
  Area copyWith({
    String? value,
  }) {
    return Area.dirty(
      value ?? this.value,
    );
  }

  @override
  String toString() => 'Area(value: $value, isPure: $isPure, isValid: $isValid)';
}


