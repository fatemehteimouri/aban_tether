import 'package:aban_tether/src/core/network/dio_client.dart';
import 'package:aban_tether/src/core/service_locators/app_storage_container.dart';
import 'package:aban_tether/src/core/service_locators/data_source_container.dart';
import 'package:aban_tether/src/core/service_locators/dio_container.dart';
import 'package:aban_tether/src/core/service_locators/repository_container.dart';
import 'package:aban_tether/src/core/service_locators/usecase_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

Future<void> main() async {

  //SET ENV

  await dotenv.load(fileName: ".env");
  switch (dotenv.env['FLUTTER_ENV']) {
    case 'production':
      await dotenv.load(fileName: '.env.production');
      break;
  }

  AppStorageContainer.register();
  DioContainer.register();
  DataSourceContainer.register();
  RepositoryContainer.register();
  UseCaseContainer.register();


  runApp(const App());
}

