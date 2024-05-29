import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';
import 'package:thyme_to_park_display/ui/theme/text_theme.dart';

class LicensePlate extends StatelessWidget {
  final DisplayState displayState;
  final Set<Corner> roundedCorners;

  const LicensePlate({
    super.key,
    required this.displayState,
    this.roundedCorners = Corner.all,
  });

  @override
  Widget build(final BuildContext context) {
    final displayState = this.displayState;
    final text = displayState is ShowingCarInfoState
        ? displayState.car.registrationId
        : displayState is ShowingUnauthorizedMessageState
            ? displayState.registrationId
            : 'Detecting';

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 128),
      child: HerbHubCard(
        roundedCorners: roundedCorners,
        containerColor: context.theme.colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(text, style: monospace.copyWith(fontSize: 48)),
          ),
        ),
      ),
    );
  }
}
