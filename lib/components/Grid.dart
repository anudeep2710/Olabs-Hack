import 'package:flutter/material.dart';

class GridItem {
  final String image;
  final String label;
  final Color color;

  GridItem({required this.image, required this.label, required this.color});
}

class GridItemCard extends StatelessWidget {
  final String image;
  final String label;
  final Color color;
  final double textSize;
  final void Function(BuildContext)? onTap; // Optional onTap with BuildContext

  const GridItemCard({
    super.key,
    required this.image,
    required this.label,
    required this.color,
    required this.textSize,
    this.onTap, // Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () => onTap!(context) // Call the provided onTap with context
          : () {
              // Default behavior if no onTap is provided
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tapped $label'),
                  backgroundColor:
                      Colors.black87, // Professional snackbar color
                ),
              );
            },
      borderRadius:
          BorderRadius.circular(16), // Rounded corners for tap feedback
      child: Card(
        elevation: 4, // Increased elevation for a more premium look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Larger rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      color.withOpacity(0.08), // Very light tint for subtlety
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                    colorBlendMode: BlendMode.modulate, // Subtle color blending
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                  12), // Increased padding for a cleaner look
              decoration: BoxDecoration(
                color: color
                    .withOpacity(0.12), // Slightly darker for better contrast
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: color, // Use the full color for text
                  letterSpacing: 0.5, // Slight spacing for professionalism
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // Handle long text gracefully
              ),
            ),
          ],
        ),
      ),
    );
  }
}
