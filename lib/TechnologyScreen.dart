import 'package:flutter/material.dart';
import 'package:olabs_app/AI/Ai_Visualiser.dart';
import 'package:olabs_app/Web/Web_Development.dart';
import 'package:olabs_app/components/Appbar.dart';
import 'package:olabs_app/components/Grid.dart';

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
    final items = [
      GridItem(
        image: 'assets/Compter_Science_img.png',
        label: 'AI ML',
        color: const Color(0xFF1976D2),
      ),
      GridItem(
        image: 'assets/Compter_Science_img.png',
        label: 'Collabrated Learning',
        color: const Color(0xFF2E7D32),
      ),
      GridItem(
        image: 'assets/Compter_Science_img.png',
        label: 'Web Development',
        color: const Color(0xFFF57C00),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: const AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.85,
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
                        onTap: (context) {
                          if (item.label == 'AI ML') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AIVisualizerScreen(),
                              ),
                            );
                          } else if (item.label == 'Web Development') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WebDevelopmentScreen(),
                              ),
                            );
                          } else {
                            // Placeholder for other screens
                          }
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
    );
  }
}
