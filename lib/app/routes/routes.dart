import 'package:flutter/widgets.dart';
import 'package:daily_globe/app/app.dart';
import 'package:daily_globe/home/home.dart';
import 'package:daily_globe/onboarding/onboarding.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.onboardingRequired:
      return [OnboardingPage.page()];
    case AppStatus.unauthenticated:
    case AppStatus.authenticated:
      return [HomePage.page()];
  }
}
