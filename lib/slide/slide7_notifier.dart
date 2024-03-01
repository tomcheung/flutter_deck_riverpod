
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ProviderNotifierSlider extends FlutterDeckSlideWidget {
  const ProviderNotifierSlider()
  : super(configuration: const FlutterDeckSlideConfiguration(route: '/notifier'));

  static const _notifierCreateSampleCode = """
class MyNotifier extends Notifier<MyState> {
  @override
  MyState build() {
    return []; // Default state
  }
  void methodToModifyState() { 
    state = state.copyWith({newValue: newValue})
  }
}

final myProvider = NotifierProvider<MyNotifier, MyState>(MyNotifier.new);
 """;

  static const _notifierReadSampleCode = 'MyState myState = ref.watch(myProvider);';
  static const _notifierUpdateSampleCode = 'ref.read(myProvider.notifer).methodToModifyState();';

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
                    'Notifier',
                    style: theme.header,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    'Notifier can allow perform side effect to modify the state, like add a item in todo list',
                    style: theme.bodyMedium,
                  ),
                ),
                const FlutterDeckCodeHighlight(code: _notifierCreateSampleCode),
                const SizedBox(height: 16),
                Flexible(
                  child: AutoSizeText(
                    'Read provider in notifier',
                    style: theme.bodyMedium,
                  ),
                ),
                const FlutterDeckCodeHighlight(code: _notifierReadSampleCode),
                Flexible(
                  child: AutoSizeText(
                    'Trigger side effect in notifier',
                    style: theme.bodyMedium,
                  ),
                ),
                const FlutterDeckCodeHighlight(code: _notifierUpdateSampleCode),
              ],
            ),
          ),
        );
      },
    );
  }
}