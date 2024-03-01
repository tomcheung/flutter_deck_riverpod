import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:riverpod_flutter_deck/slide/all_slide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(slides: [
      const IntroSlide(),
      const InstallationSlide(),
      const ProviderTypeSlide(),
      const ReactiveConcept(),
      const CacheConcept(),
      const ProviderModifierSlide(),
      const AutoDisposeSlide(),
      const ProviderFamilySlide(),
      const ProviderNotifierSlider(),
    ]);
  }
}
