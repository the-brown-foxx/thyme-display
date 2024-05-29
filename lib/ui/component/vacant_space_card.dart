import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';

class VacantSpaceCard extends StatelessWidget {
  final int vacantSpace;
  final Set<Corner> roundedCorners;

  const VacantSpaceCard({
    super.key,
    required this.vacantSpace,
    this.roundedCorners = Corner.all,
  });

  @override
  Widget build(final BuildContext context) {
    return HerbHubCard(
      roundedCorners: roundedCorners,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Remaining space: $vacantSpace',
                  style: context.theme.textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
