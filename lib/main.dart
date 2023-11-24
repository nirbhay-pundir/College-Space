import 'package:college_space/src/screens/sign_in.dart';
import 'package:college_space/src/screens/sign_up_course.dart';
import 'package:college_space/src/screens/sign_up_personal.dart';
import 'package:college_space/src/utils/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'src/utils/theme.dart';
import 'src/screens/check_update.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MainApp(), // Wrap your app
//       ),
//     );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: "College Space",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: CheckUpdate.route,
      routes: {
        CheckUpdate.route: (context) => CheckUpdate(),
        SignIn.route: (context) => SignIn(),
        SignUpPersonal.route: (context) => SignUpPersonal(),
        SignUpCourse.route: (context) => SignUpCourse(),
      },
    );
  }
}
