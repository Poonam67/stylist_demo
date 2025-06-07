import 'package:get_it/get_it.dart';
import '../services/api_service.dart';
import '../viewmodels/home_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => HomeViewModel());
}