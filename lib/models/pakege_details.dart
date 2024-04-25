
class PackageDetailList {
  final int id;
  final String? name;
  final int? price_start;
  final int? price_upto;

  PackageDetailList({
    required this.id,
    this.name,
    this.price_start,
    this.price_upto,
  });

  factory PackageDetailList.fromJson(Map<String, dynamic> json) {
    return PackageDetailList(
      id: json['id'],
      name: json["name"],
      price_start: json["price_start"],
      price_upto: json["price_upto"],
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, price_start: $price_start, price_upto: $price_upto}';
  }
}