import 'package:flutter/material.dart';
import 'attraction_model.dart';

// Screen that displays detailed information about a selected attraction
class AttractionDetailScreen extends StatefulWidget {
  final Attraction attraction;

  const AttractionDetailScreen({super.key, required this.attraction});

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
              title: Text(widget.attraction.name),
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
                    child: Text(
                      widget.attraction.category,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Short description of the attraction
                  Text(widget.attraction.description),

                  const SizedBox(height: 24),
                  // Details section header
                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  _buildDetailRow('Location', widget.attraction.location),
                  const Divider(),
                  _buildDetailRow('Category', widget.attraction.category),
                  const Divider(),
                  _buildDetailRow('Built', widget.attraction.built),
                  const Divider(),
                  _buildDetailRow(
                    'Opening Hours',
                    widget.attraction.openingHours,
                  ),
                  const Divider(),
                  _buildDetailRow('Admission', widget.attraction.admission),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds a single detail row with a label and value
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
