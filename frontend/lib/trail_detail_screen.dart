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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shows key trail stats
                  const Row(
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
                  const SizedBox(height: 16),
                  // Section header for trail description
                  const Text(
                    'About this Trail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    'The Latin Quarter Trail takes you through the heart of Galway city, exploring its rich cultural heritage, medieval architecture, and vibrant street life.',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Stops on this Trail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),
                  _buildStop(
                    1,
                    'Spanish Arch',
                    'Historic 16th century arch on the River Corrib',
                  ),
                  _buildStop(
                    2,
                    'Galway City Museum',
                    'Explore Galway\'s history and culture',
                  ),
                  _buildStop(
                    3,
                    'Church of St. Nicholas',
                    'Medieval collegiate church dating to 1320',
                  ),
                  _buildStop(
                    4,
                    'Shop Street',
                    'The heart of Galway\'s social and cultural life',
                  ),
                  _buildStop(
                    5,
                    'Eyre Square',
                    'Central park and gateway to the city',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.map),
          label: const Text('View on Map'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
      ),
    );
  }

  // Builds a single stop item with a numbered circle avatar and description
  Widget _buildStop(int number, String name, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Numbered circle avatar for stop number
          CircleAvatar(radius: 14, child: Text('$number')),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
