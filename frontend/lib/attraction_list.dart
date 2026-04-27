import 'package:flutter/material.dart';
import 'attraction_model.dart';
import 'bottom_nav_bar.dart';
import 'attraction_detail_screen.dart';

// Main screen for displaying and searching attractions
class AttractionsScreen extends StatefulWidget {
  final List<Attraction> attractions;

  const AttractionsScreen({
    super.key,
    required this.attractions,
  });

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

class _AttractionsScreenState extends State<AttractionsScreen> {
  int _selectedIndex = 2;
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    // Filter based on search 
    final filteredAttractions = widget.attractions.where((attraction) {
      final name = attraction.name.toLowerCase();
      final category = attraction.category.toLowerCase();
      final location = attraction.location.toLowerCase();

      return name.contains(searchText.toLowerCase()) ||
          category.contains(searchText.toLowerCase()) ||
          location.contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attractions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Galway city & surrounds',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
      // Main content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search attractions...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Filter'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredAttractions.isEmpty
                  ? const Center(
                      child: Text('No attractions found'),
                    )
                  : ListView.builder(
                      itemCount: filteredAttractions.length,
                      itemBuilder: (context, index) {
                        final attraction = filteredAttractions[index];
                        return Column(
                          children: [
                            _buildAttractionCard(attraction),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildAttractionCard(Attraction attraction) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: const Icon(Icons.place),
        title: Text(
          attraction.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${attraction.category} • ${attraction.location}'),
        trailing: const Icon(Icons.chevron_right),
onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AttractionDetailScreen(attraction: attraction),
            ),
          );
        },
      ),
    );
  }

}
