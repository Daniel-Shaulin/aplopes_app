import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_result.freezed.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs
@freezed
class GenericResult with _$GenericResult{
  factory GenericResult.sucess(dynamic object) = Success;

  factory GenericResult.error(String message) = Error;
}