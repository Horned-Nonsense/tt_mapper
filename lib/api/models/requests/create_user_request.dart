
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest extends Equatable {
  final String emailAddress;
  final String firstName;
  final String lastName;
  final String? avatarUrl;

  const CreateUserRequest( {
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);

  @override
  List<Object?> get props => [
        emailAddress,
        firstName,
        lastName,
        avatarUrl,
      ];
}
