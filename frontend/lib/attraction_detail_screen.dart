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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}