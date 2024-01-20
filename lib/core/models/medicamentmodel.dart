class Medication {
  final int id;
  final String name;
  final String briefDescription;
  final String imageUrl;
  final String fullDescription;
  final int dosagePerDay;

  Medication({
    required this.id,
    required this.name,
    required this.briefDescription,
    required this.imageUrl,
    required this.fullDescription,
    required this.dosagePerDay,
  });
}
