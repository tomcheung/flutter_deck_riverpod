import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StreamProvider((ref) {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
});

final doubleCounterProvider = Provider((ref) {
  final c = ref.watch(counterProvider).value ?? 0;
  return c * 2;
});

class ReactiveConcept extends FlutterDeckSlideWidget {
  const ReactiveConcept()
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/reactive'),
        );

  static const code = """
final counterProvider = StreamProvider((ref) {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
});

final doubleCounterProvider = Provider((ref) {
  final c = ref.watch(counterProvider).value ?? 0; // Listen counterProvider
  return c * 2;
});
""";

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = FlutterDeckTheme.of(context);
    final textTheme = theme.textTheme;
    return FlutterDeckSlide.split(
      splitRatio: const SplitSlideRatio(left: 3, right: 2),
      leftBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'How reactive works in flutter',
                wrapWords: true,
                style: textTheme.title.apply(fontSizeFactor: 0.6),
              ),
              AutoSizeText(
                'Provider can listen another listener easily using ',
                style: textTheme.subtitle.apply(fontSizeFactor: 0.6),
              ),
              const FlutterDeckCodeHighlightTheme(
                data: FlutterDeckCodeHighlightThemeData(
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: FlutterDeckCodeHighlight(code: code),
              )
            ],
          ),
        );
      },
      rightBuilder: (context) {
        return const Card(
          clipBehavior: Clip.antiAlias,
          child: ProviderScope(
            child: MaterialApp(
              home: _Demo(),
            ),
          ),
        );
      },
    );
  }
}

class _Demo extends ConsumerWidget {
  const _Demo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Reactive')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('counter: ${counter.value}'),
            Consumer(builder: (context, ref, child) {
              final doubleValue = ref.watch(doubleCounterProvider);
              return Text('double: $doubleValue');
            }),
          ],
        ),
      ),
    );
  }
}
