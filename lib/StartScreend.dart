import 'package:flutter/material.dart';
import 'package:olabs_app/TechnologyScreen.dart';
import 'package:olabs_app/components/Appbar.dart';
import 'package:olabs_app/components/Grid.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _calculateTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 20;
    if (width > 800) return 18;
    if (width > 400) return 16;
    return 14;
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      GridItem(
        image: 'assets/physics1.png', // Updated icon
        label: 'Physics',
        color: const Color(0xFF1976D2), // Deep Blue (Material Design primary)
      ),
      GridItem(
        image: 'assets/chemistry1.png', // Updated icon
        label: 'Chemistry',
        color:
            const Color(0xFF2E7D32), // Deep Green (Material Design secondary)
      ),
      GridItem(
        image: 'assets/biology1.png', // Updated icon
        label: 'Biology',
        color: const Color(0xFFF57C00),
      ),
      GridItem(
        image: 'assets/maths1.png', // Updated icon
        label: 'Maths',
        color:
            const Color(0xFF6A1B9A), // Deep Purple (Material Design tertiary)
      ),
      GridItem(
        image: 'assets/MicrosoftTeams-image_3Darvr.png', // New icon
        label: 'AR/VR',
        color: const Color(0xFF00796B), // Teal (Material Design accent)
      ),
      GridItem(
        image: 'assets/social_science.png', // New icon
        label: 'Social Science',
        color: const Color(0xFFD32F2F), // Deep Red (Material Design warning)
      ),
      GridItem(
        image: 'assets/skillDev.jpg', // New icon
        label: 'Skill Development',
        color: const Color.fromARGB(255, 211, 159, 47),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(
          0xFFF5F7FA), // Very light grey-blue for a clean, professional look
      appBar: const AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Increased padding for a more spacious feel
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, // Fixed size for 2x3 grid
                      childAspectRatio:
                          0.85, // Slightly adjusted for better balance
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GridItemCard(
                        image: item.image,
                        label: item.label,
                        color: item.color,
                        textSize: _calculateTextSize(context),
                        onTap: item.label == 'Skill Development'
                            ? (context) {
                                // Navigate to TechnologyScreen using Navigator.push
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TechnologyScreen(),
                                  ),
                                );
                              }
                            : null, // Use default behavior for other items
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
