// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      emailAddress: json['emailAddress'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatarUrl': instance.avatarUrl,
    };
