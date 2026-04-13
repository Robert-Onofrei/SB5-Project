import 'package:flutter/material.dart';
import 'trail_detail_screen.dart';
import 'trail_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FáilteGo', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Discover Galway', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cultural Trails',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...mockTrails.map(
                (trail) => Column(
                  children: [
                    _buildTrailCard(context, trail),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Discover Nearby',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: const Icon(Icons.map),
                  title: const Text(
                    'View On Map',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('All Pinned Locations'),
                  onTap: () {
                    // Map screen navigation will go here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrailCard(BuildContext context, Trail trail) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrailDetailScreen(trail: trail),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey[300],
              child: Icon(Icons.image, size: 40, color: Colors.grey[500]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trail.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${trail.numberOfStops} stops  .  ${trail.distance}  -  ${trail.duration}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
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