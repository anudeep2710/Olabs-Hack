import 'package:flutter/material.dart';
import 'package:olabs_app/Ai_Visualiser.dart';
import 'package:olabs_app/Web_Development.dart';
import 'package:olabs_app/components/Appbar.dart'; // Assuming this is the path to AppBarComponent
import 'package:olabs_app/components/Grid.dart'; // Assuming this is the path to GridItem and GridItemCard
// Import WebDevelopmentScreen

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({super.key});

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  double _calculateTextSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 20;
    if (width > 800) return 18;
    if (width > 400) return 16;
    return 14;
  }

  @override
  Widget build(BuildContext context) {
    final aiMlItems = [
      GridItem(
        image:
            'assets/Compter_Science_img.png', // Update with actual asset path
        label: 'AI/ML Visualizer',
        color: const Color(0xFF1976D2), // Deep Blue for AI/ML
      ),
    ];

    final webDevItems = [
      GridItem(
        image:
            'assets/Compter_Science_img.png', // Update with actual asset path
        label: 'Web Development',
        color: const Color(0xFF2E7D32), // Deep Green for Web Development
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(
          0xFFF5F7FA), // Match the background color of StartScreen for consistency
      appBar: const AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Increased padding for a more spacious feel
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Technology Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                200, // Fixed size for a single column
                            childAspectRatio:
                                0.85, // Slightly adjusted for better balance
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: aiMlItems.length,
                          itemBuilder: (context, index) {
                            final item = aiMlItems[index];
                            return GridItemCard(
                              image: item.image,
                              label: item.label,
                              color: item.color,
                              textSize: _calculateTextSize(context),
                              onTap: (context) {
                                // Navigate to AIVisualizerScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AIVisualizerScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                200, // Fixed size for a single column
                            childAspectRatio:
                                0.85, // Slightly adjusted for better balance
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: webDevItems.length,
                          itemBuilder: (context, index) {
                            final item = webDevItems[index];
                            return GridItemCard(
                              image: item.image,
                              label: item.label,
                              color: item.color,
                              textSize: _calculateTextSize(context),
                              onTap: (context) {
                                // Navigate to WebDevelopmentScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WebDevelopmentScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
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
