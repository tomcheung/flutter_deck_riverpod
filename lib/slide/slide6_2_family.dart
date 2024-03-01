import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ProviderFamilySlide extends FlutterDeckSlideWidget {
  const ProviderFamilySlide()
      : super(
            configuration:
                const FlutterDeckSlideConfiguration(route: '/family'));

  static const _familySampleCode = """
final stringLengthProvider = Provider.family<int /*Output*/, String /*Input*/>((ref, input) {
  return input.length;
});
 """;

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = FlutterDeckTheme.of(context).textTheme;
    return FlutterDeckSlide.template(
      contentBuilder: (context) {
        return FlutterDeckCodeHighlightTheme(
          data: const FlutterDeckCodeHighlightThemeData(
            textStyle: TextStyle(fontSize: 14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: AutoSizeText(
                    'Family',
                    style: theme.header,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    'Basic usage',
                    style: theme.subtitle,
                    textScaleFactor: 0.8,
                  ),
                ),
                FlutterDeckCodeHighlight(code: _familySampleCode),
                Flexible(
                  child: AutoSizeText(
                    'It can only take 1 input, you need wrap it in custom class if you want to have multiple input',
                    style: theme.bodyMedium,
                  ),
                ),
                SizedBox(height: 16),
                Flexible(
                  child: AutoSizeText(
                    'If your use custom class as input, make sure it implement == operator, otherwise it won\'t able to get the last value',
                    style: theme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
