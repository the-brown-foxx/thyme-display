import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';

import 'corner.dart';

class CarCard extends StatelessWidget {
  final DisplayState displayState;
  final Set<Corner> roundedCorners;

  const CarCard({
    super.key,
    required this.displayState,
    this.roundedCorners = Corner.all,
  });

  @override
  Widget build(final BuildContext context) {
    final content = switch (displayState) {
      ShowingInstructionsState _ => [
          Text(
            'Please pull up in front of the gate',
            style: context.theme.textTheme.displayMedium,
          ),
        ],
      final ShowingCarInfoState displayState => [
          Text(
            'Welcome, ${displayState.car.owner}!',
            style: context.theme.textTheme.displayMedium,
          ),
          Text(
            displayState.car.modelInfo,
            style: context.theme.textTheme.displayLarge,
          ),
        ],
      ShowingParkingFullState _ => [
          Text(
            'There are no more free parking spaces',
            style: context.theme.textTheme.displayMedium,
          ),
        ],
      ShowingUnauthorizedMessageState _ => [
          Text(
            'Unauthorized',
            style: context.theme.textTheme.displayMedium,
          ),
        ],
    };

    return HerbHubCard(
      roundedCorners: roundedCorners,
      child: AnimatedSize(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 150),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
