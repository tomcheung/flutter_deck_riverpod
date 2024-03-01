import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
            configuration:
                const FlutterDeckSlideConfiguration(title: 'Introduction', route: '/intro'));

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'Introduction to Riverpod',
      subtitle: 'A Reactive Caching and Data-binding Framework',
    );
  }
}
