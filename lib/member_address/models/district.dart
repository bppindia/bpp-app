class District {
  final String value;
  final bool isPure;

  const District.pure()
      : value = '',
        isPure = true;

  const District.dirty(this.value)
      : isPure = false;


  /// Validation logic to check if the value is valid (e.g., non-empty)
  bool get isValid => value.isNotEmpty;

  /// Allows creating a new instance with modified properties
  District copyWith({
    String? value,
  }) {
    return District.dirty(
      value ?? this.value,
    );
  }

  @override
  String toString() => 'District(value: $value, isPure: $isPure, isValid: $isValid)';
}
