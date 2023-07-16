class Country {
  final String name;
  final List<String> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String capital;
  final List<String> altSpellings;
  final String subregion;
  final String region;
  final int population;
  final List<double> latlng;
  final String demonym;
  final double area;
  final List<String> timezones;
  final String nativeName;
  final String numericCode;
  final Map<String, String> flags;
  final List<Map<String, dynamic>> currencies;
  final List<Map<String, dynamic>> languages;
  final Map<String, String> translations;
  final String flag;
  final String cioc;
  final bool independent;

  Country({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.altSpellings,
    required this.subregion,
    required this.region,
    required this.population,
    required this.latlng,
    required this.demonym,
    required this.area,
    required this.timezones,
    required this.nativeName,
    required this.numericCode,
    required this.flags,
    required this.currencies,
    required this.languages,
    required this.translations,
    required this.flag,
    required this.cioc,
    required this.independent,
  });
}
