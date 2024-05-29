import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thyme_to_park_display/service/registry/model/car.dart';
import 'package:thyme_to_park_display/ui/component/car_card.dart';
import 'package:thyme_to_park_display/ui/component/car_card_decoration.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';
import 'package:thyme_to_park_display/ui/component/license_plate.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';
import 'package:thyme_to_park_display/ui/component/vacant_space_card.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';

class Display extends StatelessWidget {
  final DisplayState state;
  final int vacantSpace;

  const Display({super.key, required this.state, required this.vacantSpace});

  @override
  Widget build(final BuildContext context) {
    final state = this.state;
    final color = state is ShowingCarInfoState ? state.car.color : null;

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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        LicensePlate(
                          roundedCorners: Edge.top,
                          displayState: state,
                        ),
                        const SizedBox(height: 16),
                        CarCard(
                          roundedCorners: const {},
                          displayState: state,
                        ),
                        const SizedBox(height: 16),
                        VacantSpaceCard(
                          roundedCorners: Edge.bottom,
                          vacantSpace: vacantSpace,
                        ),
                        const Spacer(),
                      ],
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
