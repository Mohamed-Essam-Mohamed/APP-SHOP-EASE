import 'package:equatable/equatable.dart';

class CreateCategoryRequest extends Equatable {
  final String name;
  final String image;

  const CreateCategoryRequest({required this.name, required this.image});

  //? to json
  Map<String, dynamic> toJson() => {'name': name, 'image': image};
  @override
  List<Object?> get props => [name, image];
}
