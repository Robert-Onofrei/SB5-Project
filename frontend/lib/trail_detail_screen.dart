import 'package:flutter/material.dart';

class TrailDetailScreen extends StatelessWidget {
  const TrailDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Latin Quarter Trail'),
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
                children: [
                  // Shows key trail stats
                  Row(
                    //Icons from google fonts
                    children: const [
                      Icon(Icons.place, size: 16),
                      SizedBox(width: 4),
                      Text('7 stops'),
                      SizedBox(width: 16),
                      Icon(Icons.straighten, size: 16),
                      SizedBox(width: 4),
                      Text('1.2km'),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('45 min'),
                    ],
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
