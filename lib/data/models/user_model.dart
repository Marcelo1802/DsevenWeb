import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final AddressModel address;
  final CompanyModel company;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // Converter para entidade de domínio
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      website: website,
      address: address.toEntity(),
      company: company.toEntity(),
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      website: user.website,
      address: AddressModel.fromEntity(user.address),
      company: CompanyModel.fromEntity(user.company),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  const AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  Address toEntity() {
    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo.toEntity(),
    );
  }

  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      street: address.street,
      suite: address.suite,
      city: address.city,
      zipcode: address.zipcode,
      geo: GeoModel.fromEntity(address.geo),
    );
  }
}

@JsonSerializable()
class GeoModel {
  final String lat;
  final String lng;

  const GeoModel({
    required this.lat,
    required this.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

  Geo toEntity() {
    return Geo(lat: lat, lng: lng);
  }

  factory GeoModel.fromEntity(Geo geo) {
    return GeoModel(
      lat: geo.lat,
      lng: geo.lng,
    );
  }
}

@JsonSerializable()
class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  Company toEntity() {
    return Company(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs,
    );
  }

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
      name: company.name,
      catchPhrase: company.catchPhrase,
      bs: company.bs,
    );
  }
}
