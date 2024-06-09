import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';
import 'package:thyme_to_park_display/ui/theme/text_theme.dart';

class LicensePlate extends StatefulWidget {
  final DisplayState displayState;
  final Set<Corner> roundedCorners;

  const LicensePlate({
    super.key,
    required this.displayState,
    this.roundedCorners = Corner.all,
  });

  @override
  State<LicensePlate> createState() => _LicensePlateState();
}

class _LicensePlateState extends State<LicensePlate>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final displayState = widget.displayState;
    final text = displayState is ShowingCarInfoState
        ? displayState.car.registrationId
        : displayState is ShowingUnauthorizedMessageState
            ? displayState.registrationId
            : 'Detecting...';

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 128),
      child: HerbHubCard(
        roundedCorners: widget.roundedCorners,
        containerColor: context.theme.colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Opacity(
              opacity: displayState is ShowingInstructionsState
                  ? animationController.value
                  : 1,
              child: Text(text, style: monospace.copyWith(fontSize: 48)),
            ),
          ),
        ),
      ),
    );
  }
}
