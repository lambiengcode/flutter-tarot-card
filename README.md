## Flutter Getx Template

### Description:
- This is source flutter template use getx for statemanagement ☕

👀 Overview ******main.dart******, After you can customize languages package, themes, pages and routes
```dart
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/src/lang/translation_service.dart';
import 'package:flutter_getx_template/src/routes/app_pages.dart';
import 'package:flutter_getx_template/src/shared/logger/logger_utils.dart';
import 'package:flutter_getx_template/src/theme/theme_service.dart';
import 'package:flutter_getx_template/src/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    enableLog: true,
    logWriterCallback: Logger.write,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
    translations: TranslationService(),
    theme: Themes().lightTheme,
    darkTheme: Themes().darkTheme,
    themeMode: ThemeService().getThemeMode(),
  ));
}
```

#### 🏴󠁧󠁢󠁥󠁮󠁧󠁿 Customize languages package
- ******translation_service.dart******
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'vi_VN.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
      };
}
```
- ******en_US.dart******
```dart
const Map<String, String> en_US = {
  'helloWord': 'Hello World',
};
```

- 🔥 similar to other language files

#### 🌓 Customize theme package
- ******themes.dart******
```dart
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/src/public/styles.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: colorPrimary,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline2: TextStyle(color: colorTitle),
      ),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: colorPrimary,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline2: TextStyle(color: mC),
      ),
    ),
  );
}
```

#### 🌞 save theme mode in device storage
- ******theme_service.dart******
```dart
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = 'isDarkMode';

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}

```

#### </> Log error for dev
- ******logger_utils.dart******
```dart
class Logger {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => print('** $text. isError: [$isError]'));
  }
}
```

#### 🔗 Management routes
- ******app_routes.dart******
```dart
part of 'app_pages.dart';

abstract class Routes {
  static const ROOT = '/root';
  static const HOME = '/home';
}
```

#### 📂 Management pages
- ******app_pages.dart******
```dart
import 'package:flutter_getx_template/src/app.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => App(),
      children: [],
    ),
  ];
}
```


### How I can run it?
- :rocket: flutter version < 2.0 (1.x.x), not support null safety
- :rocket: clone this repository
- :rocket: run below code in terminal
```terminal
flutter pub get
flutter run
```

### Lib use in project:
```dart
get_test: ^3.13.3
get_storage: ^1.4.0
```

### Author:
```dart
lambiengcode
```
