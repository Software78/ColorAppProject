class ColorItem {
  String name;
  String hexCode;

  ColorItem({required this.name, required this.hexCode});

  factory ColorItem.fromJson(dynamic json) {
    return ColorItem(
      name: json['results']['name'],
      hexCode: json['results']['hexCode'],
    );
  }
}
