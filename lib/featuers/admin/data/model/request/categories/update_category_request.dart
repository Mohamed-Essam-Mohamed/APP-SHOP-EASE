import 'package:equatable/equatable.dart';

class UpdateCategoryRequest extends Equatable {
  final String? id;
  final String? name;
  final String? image;

  const UpdateCategoryRequest({
    required this.id,
    required this.name,
    required this.image,
  });

  //? toJson
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
  @override
  List<Object?> get props => [id, name, image];
}
