class City {
  final String name;
  final int? id;
  final double? lat;
  final double? lon;

  City(this.name, {this.id, this.lat, this.lon});

  City copyWith({String? name, int? id, double? lat, double? lon}) {
    return City(
      name ?? this.name,
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }
}
