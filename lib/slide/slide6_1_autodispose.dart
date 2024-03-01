import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'slide3_reactive.dart';

final _counterAutoDisposeProvider = StreamProvider.autoDispose((ref) {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
});

class AutoDisposeSlide extends FlutterDeckSlideWidget {
  const AutoDisposeSlide()
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/autodispose'),
        );

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
              Flexible(
                flex: 3,
                child: AutoSizeText(
                  'AutoDispose',
                  wrapWords: true,
                  style: textTheme.title,
                ),
              ),
              Flexible(
                flex: 2,
                child: AutoSizeText(
                  'When provider not in use, internal state will be drop automatically',
                  style: textTheme.subtitle.apply(fontSizeFactor: 0.6),
                ),
              ),
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

class _Demo extends StatelessWidget {
  const _Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const _DemoCounter()));
              },
              child: const Text('Without AutoDispose'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const _DemoAutoDisposeCounter()));
                },
                child: const Text('With AutoDispose'))
          ],
        ),
      ),
    );
  }
}

class _DemoCounter extends ConsumerWidget {
  const _DemoCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('counter: ${counter.value}'),
          ],
        ),
      ),
    );
  }
}

class _DemoAutoDisposeCounter extends ConsumerWidget {
  const _DemoAutoDisposeCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterAutoDisposeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Auto Dispose')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('counter: ${counter.value}'),
          ],
        ),
      ),
    );
  }
}
