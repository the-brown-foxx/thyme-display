import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/ui/component/card.dart';
import 'package:thyme_to_park_display/ui/component/corner.dart';

class CardDecoration extends StatefulWidget {
  static const defaultGradientColors = [
    Color(0xFF2fd096),
    Color(0xFF452FD0),
  ];

  final List<Color>? gradientColors;
  final Widget child;

  const CardDecoration({
    super.key,
    this.gradientColors,
    required this.child,
  });

  @override
  State<CardDecoration> createState() => _CardDecorationState();
}

class _CardDecorationState extends State<CardDecoration> {
  var hovered = false;

  @override
  Widget build(final BuildContext context) {
    return HerbHubCard(
      largeCornerRadius: true,
      child: Stack(
        children: [
          Container(
            decoration: widget.gradientColors != null
                ? BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.gradientColors!,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: widget.child),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
