import 'package:finalproject/app/app.dart';
import 'package:finalproject/core/networking/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  // await Hive.initFlutter();
  // Box box = await Hive.openBox('Box');
  // Hive.registerAdapter(MyObjectAdaptor());
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveService().init();
  runApp(
    const ProviderScope(child: App()),
  );
}
