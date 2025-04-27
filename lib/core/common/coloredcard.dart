import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todyapp/core/constants/constans.dart';

class ColoredCard extends ConsumerWidget {
  final Color topColor;
  const ColoredCard({super.key, required this.topColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Colored Top Bar
            Container(
              height: SizeConfig.height * 0.04,
              decoration: BoxDecoration(
                color: topColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Avatar Placeholder
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: CardColors.blurColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Text Placeholder
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: SizeConfig.height * 0.01,
                            width: SizeConfig.width * 0.6,
                            color: CardColors.blurColor),
                        const SizedBox(height: 8),
                        Container(
                            height: SizeConfig.height * 0.01,
                            width: SizeConfig.width * 0.4,
                            color: CardColors.blurColor),
                        const SizedBox(height: 8),
                        Container(
                            height: SizeConfig.height * 0.01,
                            width: SizeConfig.width * 0.6,
                            color: CardColors.blurColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
