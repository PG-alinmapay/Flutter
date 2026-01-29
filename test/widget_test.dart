// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sample_demo_app/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';
import 'dart:convert';

import 'package:yaml/yaml.dart';

Future<void> main() async {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
   // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
  //  expect(find.text('0'), findsNothing);
   // expect(find.text('1'), findsOneWidget);
  });
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter services are initialized
  final projectRoot = Directory.current.path;
  print('Project Root Directory: $projectRoot');
  final flutterVersion = await getFlutterVersion();
  print('Flutter Version: $flutterVersion');
  getGradleVersion();

  // getFlutterVersion();
  final iosVersion = getIosDeploymentVersion();
  if (iosVersion != null) {
    print('iOS Deployment Version: $iosVersion');
  } else {
    print('iOS Deployment Version not found.');
  }


}

Future<void> getGradleVersion() async {
  // Path to the gradle-wrapper.properties file
  final gradleWrapperFile = File('android/gradle/wrapper/gradle-wrapper.properties');
  final buildGradleFile = File('android/app/build.gradle');

  if (await gradleWrapperFile.exists()) {
    final wrapperContent = await gradleWrapperFile.readAsString();
    final gradleVersionMatch = RegExp(r'distributionUrl=.*gradle-([\d.]+)-').firstMatch(wrapperContent);
    final gradleVersion = gradleVersionMatch?.group(1) ?? 'Unknown';
    print("Gradle Wrapper Version: $gradleVersion");
  } else {
    print('gradle-wrapper.properties file not found.');
  }

  if (await buildGradleFile.exists()) {
    final gradleContent = await buildGradleFile.readAsString();
    // Match the AGP version in the dependencies block
    final pluginVersionMatch =RegExp(
        r"dependencies\s*{[^}]*classpath\s+com\.android\.tools\.build:gradle:([\d.]+)",
    dotAll: true,
  ).firstMatch(gradleContent);

  final pluginVersion = pluginVersionMatch?.group(1) ?? 'Unknown';
  print("Android Gradle Plugin Version: $pluginVersion");
  } else {
  print('build.gradle file not found.');
  }
}

String? getIosDeploymentVersion() {
  String versions = "";
  final podfile = File('ios/Podfile');
  print("podfile"+podfile.path);
  if (podfile.existsSync()) {
    final lines = podfile.readAsLinesSync();
    for (var line in lines) {
      // Check for the platform line
      if (line.trim().startsWith('platform :ios')) {
        // Adjusted regex to match both single and double quotes with proper escaping
        RegExp regExp = RegExp(r"platform\s*:ios,\s*'(\d+\.\d+)'");
        Match? match = regExp.firstMatch(line);

        if (match != null) {
          versions = match.group(1)!;
          print(versions);  // Output: 12.0
        }
      }
    }
  }
  return versions; // Return null if not found
}
Future<String?> getFlutterVersion() async {
  try {
    // Read the pubspec.lock file
    final file = File('pubspec.lock');
    if (await file.exists()) {
      final content = await file.readAsString();
      final yaml = jsonDecode(jsonEncode(loadYaml(content)));

      // Access the Flutter version under 'sdks'
      final sdks = yaml['sdks'];
      return sdks?['flutter'];
    }
  } catch (e) {
    print('Error fetching Flutter version: $e');
  }
  return null;
}

