import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProviderModifierSlide extends FlutterDeckSlideWidget {
  const ProviderModifierSlide()
      : super(
            configuration:
                const FlutterDeckSlideConfiguration(route: '/modifier'));

  static const _familySampleCode = """
final stringLengthProvider = Provider.family<int, String>((ref, input) {
  return input.length;
});
 """;

  static const _autoDisposeSampleCode = """
final randomNumberProvider = Provider.autoDispose((ref) {
  return Random().nextInt(999);
});
""";

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = FlutterDeckTheme.of(context).textTheme;
    final subtitleTheme = theme.bodyLarge.apply(fontSizeDelta: 10);

    return FlutterDeckSlide.template(
      contentBuilder: (context) {
        return FlutterDeckCodeHighlightTheme(
          data: const FlutterDeckCodeHighlightThemeData(
            textStyle: TextStyle(fontSize: 14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: AutoSizeText(
                    'Modifier',
                    style: theme.header,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    '\u2022 Family',
                    style: theme.title,
                    textScaleFactor: 0.8,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: AutoSizeText(
                      'Family accept an input, it will return different instance by given parameter',
                      style: subtitleTheme,
                      textScaleFactor: 0.5,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: FlutterDeckCodeHighlight(code: _familySampleCode),
                ),
                Flexible(
                  child: AutoSizeText(
                    '\u2022 AutoDispose',
                    style: theme.title,
                    textScaleFactor: 0.8,
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 32.0, bottom: 16),
                      child: AutoSizeText(
                        'It will automatically clear the cache when the provider stops being used',
                        style: subtitleTheme,
                        textScaleFactor: 0.5,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: FlutterDeckCodeHighlight(
                    code: _autoDisposeSampleCode,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: AutoSizeText(
                      'Non autoDispose provider CANNOT watch autoDispose provider',
                      style: subtitleTheme,
                      textScaleFactor: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: AutoSizeText(
                    'AutoDispose and family can be use together',
                    style: subtitleTheme,
                    textScaleFactor: 0.7,
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
