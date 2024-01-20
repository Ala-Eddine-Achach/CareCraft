class Medication {
  final int id;
  final String name;
  final String briefDescription;
  final String imageUrl;
  final String howWork;
  final String whatUseFor;
  final String howUse;
  final String sideEffects;
  final int dosagePerDay;

  Medication({
    required this.id,
    required this.name,
    required this.briefDescription,
    required this.imageUrl,
    required this.howWork,
    required this.whatUseFor,
    required this.howUse,
    required this.sideEffects,
    required this.dosagePerDay,
  });
}
