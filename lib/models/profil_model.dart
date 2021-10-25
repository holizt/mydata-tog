import 'package:hive/hive.dart';
part 'profil_model.g.dart';

@HiveType(typeId: 1)
class ProfilModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final double height;
  @HiveField(4)
  final double weight;
  @HiveField(5)
  final String imgPath;

  ProfilModel({
    required this.name,
    required this.address,
    required this.date,
    required this.height,
    required this.weight,
    required this.imgPath,
  });

  @override
  String toString() {
    return '$name | $address | $imgPath';
  }
}
