class Country{
  final String code;
  final String countryName;
  final String appreviation;

  const Country({
    required this.code,
    required this.countryName,
    required this.appreviation
  });

  factory Country.fromJson(Map<String,dynamic> json) {
    return  Country(
      code: json['code'],
      countryName: json['name'],
      appreviation: json['abbreviation'],
    );
  }



}