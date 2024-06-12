import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/theme.dart';

import 'corner.dart';

class DisconnectedIndicator extends StatelessWidget {
  final VoidCallback onReconnect;

  const DisconnectedIndicator({super.key, required this.onReconnect});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HerbHubCard(
          roundedCorners: Edge.top,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'Disconnected',
              style: context.theme.textTheme.displayMedium,
            ),
          ),
        ),
        const SizedBox(height: 16),
        HerbHubCard(
          roundedCorners: Edge.bottom,
          containerColor: context.theme.colorScheme.primary,
          child: InkWell(
            onTap: onReconnect,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Icon(
                    Icons.refresh,
                    size: 64,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 32),
                  Text(
                    'Reconnect',
                    style: context.theme.textTheme.displayMedium
                        ?.copyWith(color: context.theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
