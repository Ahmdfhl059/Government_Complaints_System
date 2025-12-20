class ComplaintStatus {
  final String value;
  final String label;

  ComplaintStatus({
    required this.value,
    required this.label,
  });

  factory ComplaintStatus.fromMap(Map<String, dynamic> map) {
    return ComplaintStatus(
      value: map['value'] ?? '',
      label: map['label'] ?? '',
    );
  }

  factory ComplaintStatus.initial() =>
      ComplaintStatus(value: '', label: '');
}
