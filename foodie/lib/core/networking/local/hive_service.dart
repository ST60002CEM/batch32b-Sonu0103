// import 'package:finalproject/app/constants/hive_table_constant.dart';
// import 'package:finalproject/features/auth/data/model/auth_hive_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
//
// final hiveServiceProvider = Provider((ref) => HiveService());
//
// class HiveService {
//   Future<void> init() async {
//     var directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);
//
//     // Register Adapters
//     Hive.registerAdapter(AuthHiveModelAdapter());
//   }
//
//   // Login
//   Future<AuthHiveModel?> login(String email, String password) async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//     var user = box.values.firstWhere(
//           (element) => element.email == email && element.password == password,
//       orElse: () => null,
//     );
//     box.close();
//     return user;
//   }
//
//   // Register user
//   Future<void> registerUser(AuthHiveModel user) async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//     await box.put(user.userId, user);
//     box.close();
//   }
// }
