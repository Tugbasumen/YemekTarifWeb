import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String category;
  final List<String> ingredients;
  final String instructions;
  final String? youtubeUrl;

  const RecipeDetailCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.ingredients,
    required this.instructions,
    this.youtubeUrl,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final textColor = Theme.of(context).colorScheme.onPrimary;

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 800,
          height: 1600,
          child: Card(
            color: Colors.amber[50],
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Resim
                  Center(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Başlık
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Malzemeler başlığı
                  Text(
                    "İngredients:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Malzeme listesi
                  ...ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 15,
                            color: secondaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            ingredient,
                            style: TextStyle(fontSize: 15, color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Talimatlar başlığı
                  Text(
                    "Instructions:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Talimat metni
                  Text(
                    instructions,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // YouTube butonu
                  if (youtubeUrl != null)
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        // youtube yönlendirme
                        onPressed: () async {
                          final Uri url = Uri.parse(youtubeUrl!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {
                            // Hata yönetimi
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Could not open YouTube link."),
                              ),
                            );
                          }
                        },

                        icon: const Icon(
                          Icons.play_circle_fill,
                          size: 20,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "YouTube Video",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
