class Car {
  final String registrationId;
  final String make;
  final String model;
  final int year;
  final String color;
  final String owner;

  String get modelInfo => '$color $year $make $model';

  const Car({
    required this.registrationId,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.owner,
  });

  factory Car.fromJson(final Map<String, dynamic> json) {
    return Car(
      registrationId: json['registration_id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      color: json['color'],
      owner: json['owner'],
    );
  }
}