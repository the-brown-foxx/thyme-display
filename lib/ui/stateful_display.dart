import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/service/display/display_controller.dart';
import 'package:thyme_to_park_display/service/display/model/display_controller_event.dart';
import 'package:thyme_to_park_display/ui/display.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';

class StatefulDisplay extends StatefulWidget {
  final DisplayController _displayController;

  const StatefulDisplay({
    super.key,
    required final DisplayController displayController,
  }) : _displayController = displayController;

  @override
  State<StatefulDisplay> createState() => _StatefulDisplayState();
}

class _StatefulDisplayState extends State<StatefulDisplay> {
  Timer? resetTimer;
  DisplayState? state = const ShowingInstructionsState();
  var vacantSpace = 0;

  @override
  void initState() {
    widget._displayController.events.listen((final event) {
      switch (event) {
        case DisplayControllerErrorEvent():
          setState(() => state = null);
        case UpdateVacantSpaceEvent():
          setState(() {
            if (event.vacantSpace > 0 && event.vacantSpace > vacantSpace) {
              state = const ShowingInstructionsState();
            }
            vacantSpace = event.vacantSpace;
          });
        case ShowInstructionsEvent():
          setState(() => state = const ShowingInstructionsState());
        case ShowParkingFullEvent():
          setState(() => state = const ShowingParkingFullState());
        case ShowCarInfoEvent():
          setState(() => state = ShowingCarInfoState(car: event.car));
        case ShowUnauthorizedMessageEvent():
          setState(() {
            state = ShowingUnauthorizedMessageState(
              registrationId: event.registrationId,
            );
          });
          resetTimer?.cancel();
          resetTimer = Timer(const Duration(seconds: 10), () {
            if (!mounted) return;
            setState(() => state = const ShowingInstructionsState());
          });
      }
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Display(
      state: state,
      vacantSpace: vacantSpace,
      onReconnect: onReconnect,
    );
  }

  void onReconnect() async {
    await widget._displayController.reconnect();
  }
}
