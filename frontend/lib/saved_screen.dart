import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'trail_model.dart';
import 'attraction_model.dart';
import 'food_model.dart';
import 'trail_detail_screen.dart';
import 'attraction_detail_screen.dart';
import 'food_screen.dart';
import 'favourites_service.dart';
import 'attraction_list.dart';
import 'map_screen.dart';
import 'profile_screen.dart';

// Screen displaying all saved/favourited items
class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int _selectedIndex = 1;
  // Lists to hold saved items
  List<Trail> savedTrails = [];
  List<Attraction> savedAttractions = [];
  List<FoodVenue> savedFoodVenues = [];

  @override
  void initState() {
    super.initState();
    // Load saved items when screen opens
    _loadSavedItems();
  }

  // Load saved item names from shared preferences and match to mock data
Future<void> _loadSavedItems() async {
    final saved = await FavouritesService.getAllSaved();
    setState(() {
      savedTrails = mockTrails
          .where((t) => saved['savedTrails']!.contains(t.name))
          .toList();
      savedAttractions = mockAttractions
          .where((a) => saved['savedAttractions']!.contains(a.name))
          .toList();
      savedFoodVenues = mockFoodVenues
          .where((f) => saved['savedFood']!.contains(f.name))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Your favourites', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: savedTrails.isEmpty && savedAttractions.isEmpty && savedFoodVenues.isEmpty
          ? const Center(
              child: Text('No saved items yet. Tap the heart icon to save.'),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Saved trails section
                if (savedTrails.isNotEmpty) ...[
                  const Text('Trails', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...savedTrails.map((trail) => _buildTrailCard(trail)),
                  const SizedBox(height: 24),
                ],
                // Saved attractions section
                if (savedAttractions.isNotEmpty) ...[
                  const Text('Attractions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...savedAttractions.map((attraction) => _buildAttractionCard(attraction)),
                  const SizedBox(height: 24),
                ],
                // Saved food venues section
                if (savedFoodVenues.isNotEmpty) ...[
                  const Text('Food & Drink', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...savedFoodVenues.map((venue) => _buildFoodCard(venue)),
                ],
              ],
            ),
bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AttractionsScreen(attractions: mockAttractions),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const FoodScreen(),
              ),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MapScreen(),
              ),
            );
          } else if (index == 5) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
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

  // Builds a trail card that navigates to trail detail
  Widget _buildTrailCard(Trail trail) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: trail.imagePath.isNotEmpty
            ? Image.asset(trail.imagePath, width: 50, height: 50, fit: BoxFit.cover)
            : const Icon(Icons.map),
        title: Text(trail.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${trail.numberOfStops} stops  •  ${trail.distance}  •  ${trail.duration}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrailDetailScreen(trail: trail)),
          );
        },
      ),
    );
  }

  // Builds an attraction card that navigates to attraction detail
  Widget _buildAttractionCard(Attraction attraction) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.place),
        title: Text(attraction.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${attraction.category} • ${attraction.location}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttractionDetailScreen(attraction: attraction)),
          );
        },
      ),
    );
  }

  // Builds a food venue card
  Widget _buildFoodCard(FoodVenue venue) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.restaurant),
        title: Text(venue.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${venue.category} • ${venue.location}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FoodScreen()),
          );
        },
      ),
    );
  }
}