import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/car_card_decoration.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/disconnected_indicator.dart';
import 'package:thyme_to_park_display/ui/component/display_info.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';

class Display extends StatelessWidget {
  final DisplayState? state;
  final int vacantSpace;
  final VoidCallback onReconnect;

  const Display({
    super.key,
    required this.state,
    required this.vacantSpace,
    required this.onReconnect,
  });

  @override
  Widget build(final BuildContext context) {
    final state = this.state;
    final color = state is ShowingCarInfoState ? state.car.color : null;
    final content = switch (state) {
      null => DisconnectedIndicator(onReconnect: onReconnect),
      _ => DisplayInfo(state: state, vacantSpace: vacantSpace),
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: CarCardDecoration(
                carColor: color,
                child: HerbHubCard(
                  largeCornerRadius: true,
                  child: Padding(
                    padding: const EdgeInsets.all(64),
                    child: Center(
                      child: content,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
