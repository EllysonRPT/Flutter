class City {
  final String cityName;
  final int favoriteCities;

  City({required this.cityName, required this.favoriteCities});

  Map<String, dynamic> toMap() {
    return {
      "cityName": cityName,
      "favoritecities": favoriteCities,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityName'],
      favoriteCities: map['favoritecities'],
    );
  }
}
