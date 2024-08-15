// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:uuid/uuid.dart';

// part 'batch_hive_model.g.dart';

// Define the provider
// final categoryHiveProvider = Provider((ref) => CategoryHiveModel.empty());

// Define a constant for Hive type ID
// class HiveTableConstant {
//   static const int categoryTableId = 0; // Ensure this is the correct ID
// }

// // Creating a Hive adapter
// @HiveType(typeId: HiveTableConstant.categoryTableId)
// class CategoryHiveModel {
//   @HiveField(0)
//   final String? categoryId;
//   @HiveField(1)
//   final String categoryName;

//   CategoryHiveModel({String? categoryId, required this.categoryName})
//       : categoryId = categoryId ?? const Uuid().v4();

//   CategoryHiveModel.empty()
//       : categoryId = '',
//         categoryName = '';

//   CategoryEntity toEntity() => CategoryEntity(categoryId: categoryId, categoryName: categoryName);

//   static CategoryHiveModel fromEntity(CategoryEntity entity) =>
//       CategoryHiveModel(categoryId: entity.categoryId, categoryName: entity.categoryName);

//   static List<CategoryEntity> toEntityList(List<CategoryHiveModel> model) =>
//       model.map((mod) => mod.toEntity()).toList();
// }

// Ensure CategoryEntity is defined properly
// class CategoryEntity {
//   final String? categoryId;
//   final String categoryName;

//   CategoryEntity({required this.categoryId, required this.categoryName});
// }
