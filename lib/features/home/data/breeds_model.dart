import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds_model.freezed.dart';
part 'breeds_model.g.dart';

@freezed
abstract class BreedsModel with _$BreedsModel {
  const factory BreedsModel({required String id, required String name}) =
      _BreedsModel;

  factory BreedsModel.fromJson(Map<String, dynamic> json) =>
      _$BreedsModelFromJson(json);
}
