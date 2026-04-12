import 'package:flutter/material.dart';

// Screen that displays detailed information about a selected attraction
class AttractionDetailScreen extends StatefulWidget {
  const AttractionDetailScreen({super.key});

  @override
  State<AttractionDetailScreen> createState() => _AttractionDetailScreenState();
}

class _AttractionDetailScreenState extends State<AttractionDetailScreen> {
  // Tracks whether the user has favourited this attraction
  bool isFavourited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible app bar with attraction image
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            actions: [
              // Favourite heart button in the top right
              IconButton(
                icon: Icon(
                  isFavourited ? Icons.favorite : Icons.favorite_border,
                  color: isFavourited ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFavourited = !isFavourited;
                  });
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Spanish Arch'),
              // Placeholder until real images are added
              background: Container(
                color: Colors.grey[400],
                child: const Icon(Icons.image, size: 80, color: Colors.white),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Heritage',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Short description of the attraction
                  const Text(
                    'Built in 1584, the Spanish Arch is a remnant of the old Galway city walls, located near the River Corrib.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
