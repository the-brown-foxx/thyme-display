import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/car_card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';
import 'package:thyme_to_park_display/ui/component/license_plate.dart';
import 'package:thyme_to_park_display/ui/component/vacant_space_card.dart';
import 'package:thyme_to_park_display/ui/model/display_state.dart';

class DisplayInfo extends StatelessWidget {
  const DisplayInfo({
    super.key,
    required this.state,
    required this.vacantSpace,
  });

  final DisplayState state;
  final int vacantSpace;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
      ],
    );
  }
}
