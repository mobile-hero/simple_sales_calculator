import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class User {
  User({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.image,
  });

  @Id()
  int? id;
  @Index()
  final String email;
  final String name;
  final String phone;
  final String password;
  String? image;

  @JsonKey(ignore: true)
  String? photoBase64;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
