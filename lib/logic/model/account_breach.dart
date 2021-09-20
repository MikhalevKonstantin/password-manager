import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_breach.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class AccountBreach {
  AccountBreach({
    required this.name,
    required this.title,
    required this.domain,
    required this.breachDate,
    required this.addedDate,
    required this.pwnCount,
    required this.description,
    required this.logoPath,
    required this.dataClasses,
    required this.isVerified,
    required this.isFabricated,
    required this.isRetired,
    required this.isSensitive,
    required this.isSpamList,
  });

  @HiveField(0)
  @JsonKey(name: 'Name')
  String name;

  @HiveField(1)
  @JsonKey(name: 'Title')
  String title;

  @HiveField(2)
  @JsonKey(name: 'Domain')
  String domain;

  @HiveField(3)
  @JsonKey(name: 'BreachDate')
  String breachDate;

  @HiveField(4)
  @JsonKey(name: 'AddedDate')
  String addedDate;

  @HiveField(5)
  @JsonKey(name: 'PwnCount')
  int pwnCount;

  @HiveField(6)
  @JsonKey(name: 'Description')
  String description;

  @HiveField(7)
  @JsonKey(name: 'LogoPath')
  String logoPath;

  @HiveField(8)
  @JsonKey(name: 'DataClasses')
  List<String> dataClasses;

  @HiveField(9)
  @JsonKey(name: 'IsVerified')
  bool isVerified;

  @HiveField(10)
  @JsonKey(name: 'IsFabricated')
  bool isFabricated;

  @HiveField(11)
  @JsonKey(name: 'IsSensitive')
  bool isSensitive;

  @HiveField(12)
  @JsonKey(name: 'IsRetired')
  bool isRetired;

  @HiveField(13)
  @JsonKey(name: 'IsSpamList')
  bool isSpamList;

  @override
  String toString() {
    return '$name:$title:$domain:$breachDate:$addedDate';
  }

  AccountBreach.empty()
      : this.name = '',
        this.title = '',
        this.domain = '',
        this.breachDate = '',
        this.addedDate = '',
        this.pwnCount = 0,
        this.description = '',
        this.logoPath = '',
        this.dataClasses = [''],
        this.isVerified = false,
        this.isFabricated = false,
        this.isRetired = false,
        this.isSensitive = false,
        this.isSpamList = false;

  AccountBreach.of(
      {this.name: "",
      this.title = '',
      this.domain = '',
      this.breachDate = '',
      this.addedDate = '',
      this.pwnCount = 0,
      this.description = '',
      this.logoPath = '',
      this.dataClasses = const [''],
      this.isVerified = false,
      this.isFabricated = false,
      this.isRetired = false,
      this.isSensitive = false,
      this.isSpamList = false});

  factory AccountBreach.fromJson(Map<String, dynamic> json) =>
      _$AccountBreachFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBreachToJson(this);
}
