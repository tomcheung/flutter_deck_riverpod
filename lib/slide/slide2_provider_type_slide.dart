import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProviderTypeSlide extends FlutterDeckSlideWidget {
  const ProviderTypeSlide()
      : super(
            configuration: const FlutterDeckSlideConfiguration(route: '/type'));

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = FlutterDeckTitleSlideTheme.of(context);
    final subtitleTheme = theme.titleTextStyle?.apply(color: Colors.black54, fontSizeFactor: 0.5);

    return FlutterDeckSlide.template(
      contentBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText('Provider type', style: theme.titleTextStyle),
              AutoSizeText('Dependence what return type you want to return, there is three provider', style: theme.titleTextStyle?.apply(color: Colors.black54, fontSizeFactor: 0.5)),
              AutoSizeText('\u2022 Provider', style: theme.subtitleTextStyle),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: AutoSizeText('The default one if return a general value', style: subtitleTheme),
              ),
              AutoSizeText('\u2022 FutureProvider', style: theme.subtitleTextStyle),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: AutoSizeText('Mainly use for API call, or other async event', style: subtitleTheme),
              ),
              AutoSizeText('\u2022 StreamProvider', style: theme.subtitleTextStyle),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: AutoSizeText('Mainly long term connection, like chat room, or webscoket', style: subtitleTheme),
              ),
            ],
          ),
        );
      },
    );
  }
}
