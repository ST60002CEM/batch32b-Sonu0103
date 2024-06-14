import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryId;
  final String CategoryName;

  const CategoryEntity({this.categoryId,required this.CategoryName});

  @override
  List<Object?> get props => [categoryId,CategoryName];
}