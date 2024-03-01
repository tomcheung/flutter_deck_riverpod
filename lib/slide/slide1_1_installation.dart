import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class InstallationSlide extends FlutterDeckSlideWidget {
  const InstallationSlide()
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/installation'),
        );

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
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AutoSizeText(
                  'Installation',
                  style: theme.header,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: _buildLeftSide(context)),
                    Flexible(child: _buildRightSide(context)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeftSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterDeckCodeHighlight(
          fileName: 'pubspec.yaml',
          code: """
flutter pub add flutter_riverpod
// optional for linting support
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint""",
        ),
        FlutterDeckCodeHighlight(
          fileName: 'main.dart',
          code: """
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope( // <--- Add this
      child: MaterialApp(
        title: 'Riverpod app',
        home: const Your app page(),
      ),
    );
  }
}""",
        ),
      ],
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterDeckCodeHighlight(
          fileName: 'my_widget.dart',
          code: """
final helloWorldProvider = Provider((_) => 'Hello world');

class HelloWorldWidget extends ConsumerWidget {
  const HelloWorldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloWorldProvider);
    return Text(hello);
  }
}""",
        ),
      ],
    );
  }
}
