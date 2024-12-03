class CityOrVillage {
  final String value;
  final bool isPure;

  const CityOrVillage.pure()
      : value = '',
        isPure = true;

  const CityOrVillage.dirty(this.value)
      : isPure = false;

  /// Validation logic to check if the value is valid (e.g., non-empty)
  bool get isValid => value.isNotEmpty;

  /// Allows creating a new instance with modified properties
  CityOrVillage copyWith({
    String? value,
  }) {
    return CityOrVillage.dirty(
      value ?? this.value,
    );
  }

  @override
  String toString() => 'CityOrVillage(value: $value, isPure: $isPure, isValid: $isValid)';
}
