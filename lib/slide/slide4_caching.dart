import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'slide3_reactive.dart';

class CacheConcept extends FlutterDeckSlideWidget {
  const CacheConcept()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/cache'),
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
                  'Caching',
                  wrapWords: true,
                  style: textTheme.title,
                ),
              ),
              Flexible(
                flex: 2,
                child: AutoSizeText(
                  'Provider state is shared, initializing on first call, to achieve cache behaviour',
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

class _Demo extends ConsumerWidget {
  const _Demo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Caching')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('counter: ${counter.value}'),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => const _DemoChildPage()));
                },
                child: const Text('To other page'))
          ],
        ),
      ),
    );
  }
}

class _DemoChildPage extends ConsumerWidget {
  const _DemoChildPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Another page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('another page counter: ${counter.value}'),
          ],
        ),
      ),
    );
  }
}
