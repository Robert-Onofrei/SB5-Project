import 'package:flutter/material.dart';
import 'trail_model.dart';
import 'trail_map_screen.dart';
import 'attraction_model.dart';
import 'attraction_detail_screen.dart';

class TrailDetailScreen extends StatefulWidget {
  final Trail trail;

  const TrailDetailScreen({super.key, required this.trail});

  @override
  State<TrailDetailScreen> createState() => _TrailDetailScreenState();
}

class _TrailDetailScreenState extends State<TrailDetailScreen> {
  // Tracks which stops the user has completed
  List<bool> completedStops = [];

  @override
  void initState() {
    super.initState();
    // Initialise all stops as not completed
    completedStops = List.filled(widget.trail.stops.length, false);
  }

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
              title: Text(widget.trail.name),
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
                      Text('${widget.trail.numberOfStops} stops'),
                      const SizedBox(width: 16),
                      const Icon(Icons.straighten, size: 16),
                      const SizedBox(width: 4),
                      Text(widget.trail.distance),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(widget.trail.duration),
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
                  Text(widget.trail.description),
                  const SizedBox(height: 24),
                  // Stops section header
                  const Text(
                    'Stops on this Trail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Build a stop item for each stop in the model
                  ...widget.trail.stops.asMap().entries.map((entry) {
                    return _buildStop(
                      entry.key + 1,
                      entry.value.name,
                      entry.value.description,
                      entry.key,
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
          builder: (context) => TrailMapScreen(trail: widget.trail),              ),
            );
          },
          icon: const Icon(Icons.map),
          label: const Text('View on Map'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
      ),
    );
  }

  // Builds a single stop item with a tappable numbered circle
Widget _buildStop(int number, String name, String description, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tappable circle that turns orange when stop is completed
        GestureDetector(
          onTap: () {
            setState(() {
              completedStops[index] = !completedStops[index];
            });
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: completedStops[index] ? Colors.orange : Colors.grey,
            child: Text(
              '$number',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Tappable text that navigates to the attraction detail page
        Expanded(
          child: GestureDetector(
            onTap: () {
              final attraction = mockAttractions.firstWhere(
                (a) => a.name == name,
                orElse: () => mockAttractions[0],
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttractionDetailScreen(attraction: attraction),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
