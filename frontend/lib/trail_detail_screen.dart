import 'package:flutter/material.dart';
import 'trail_model.dart';

// Screen that displays detailed information about a selected trail
// Accepts a Trail object passed from the home screen
class TrailDetailScreen extends StatelessWidget {
  final Trail trail;

  const TrailDetailScreen({
    super.key,
    required this.trail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible app bar with trail image
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // Trail name from the model
              title: Text(trail.name),
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
                  // Row showing key trail stats from the model
                  Row(
                    children: [
                      const Icon(Icons.place, size: 16),
                      const SizedBox(width: 4),
                      Text('${trail.numberOfStops} stops'),
                      const SizedBox(width: 16),
                      const Icon(Icons.straighten, size: 16),
                      const SizedBox(width: 4),
                      Text(trail.distance),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(trail.duration),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // About section header
                  const Text(
                    'About this Trail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Trail description from the model
                  Text(trail.description),
                  const SizedBox(height: 24),
                  // Stops section header
                  const Text(
                    'Stops on this Trail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Build a stop item for each stop in the model
                  ...trail.stops.asMap().entries.map((entry) {
                    return _buildStop(
                      entry.key + 1,
                      entry.value.name,
                      entry.value.description,
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      // Fixed bottom button to navigate to map view
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
          // Numbered circle for stop order
          CircleAvatar(
            radius: 14,
            child: Text('$number'),
          ),
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