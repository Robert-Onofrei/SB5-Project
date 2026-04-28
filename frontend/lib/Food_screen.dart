import 'package:flutter/material.dart';
import 'food_model.dart';
import 'bottom_nav_bar.dart';
import 'attraction_list.dart';
import 'attraction_model.dart';

// Screen displaying popular food venues in Galway
class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // Current selected nav bar index
  int _selectedIndex = 3;
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  // Currently selected category filter, null means show all
  String? selectedCategory;
  // Tracks which venues the user has favourited
  Set<String> favourites = {};

  @override
  Widget build(BuildContext context) {
    // Filter venues based on search text and selected category
    final filteredVenues = mockFoodVenues.where((venue) {
      final matchesSearch =
          venue.name.toLowerCase().contains(searchText.toLowerCase()) ||
          venue.location.toLowerCase().contains(searchText.toLowerCase());
      final matchesCategory =
          selectedCategory == null || venue.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Food & Drink', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Popular spots in Galway', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search restaurants, cafes, pubs...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(height: 12),
            // Category filter chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // All filter chip
                  _buildFilterChip('All', null),
                  const SizedBox(width: 8),
                  _buildFilterChip('Restaurant', 'Restaurant'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Cafe', 'Cafe'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Pub', 'Pub'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Venue list
            Expanded(
              child: filteredVenues.isEmpty
                  ? const Center(child: Text('No venues found'))
                  : ListView.builder(
                      itemCount: filteredVenues.length,
                      itemBuilder: (context, index) {
                        final venue = filteredVenues[index];
                        return Column(
                          children: [
                            _buildVenueCard(venue),
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
            // Navigate back to home
            Navigator.pop(context);
          } else if (index == 2) {
            // Navigate to attractions screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AttractionsScreen(
                  attractions: mockAttractions,
                ),
              ),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  // Builds a filter chip for category selection
  Widget _buildFilterChip(String label, String? category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Builds a card for a single food venue
  Widget _buildVenueCard(FoodVenue venue) {
    final isFavourited = favourites.contains(venue.name);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Venue name
                Expanded(
                  child: Text(
                    venue.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Favourite heart button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isFavourited) {
                        favourites.remove(venue.name);
                      } else {
                        favourites.add(venue.name);
                      }
                    });
                  },
                  child: Icon(
                    isFavourited ? Icons.favorite : Icons.favorite_border,
                    color: isFavourited ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Category badge and rating
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    venue.category,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  venue.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 8),
                Text(
                  venue.priceRange,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Venue description
            Text(
              venue.description,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 8),
            // Location and opening hours
            Row(
              children: [
                const Icon(Icons.place, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    venue.location,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  venue.openingHours,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}