import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'attraction_model.dart';
import 'attraction_detail_screen.dart';

// Screen that displays all attractions as pins on a map of Galway
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Map', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Galway', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Map takes up the top portion of the screen
          Expanded(
            flex: 3,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(53.2707, -9.0568),
                initialZoom: 14.0,
              ),
              children: [
                // Map tiles from OpenStreetMap
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.failtego',
                ),
                // Pin markers for each attraction
                MarkerLayer(
                  markers: mockAttractions.map((attraction) {
                    return Marker(
                      point: LatLng(attraction.latitude, attraction.longitude),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AttractionDetailScreen(attraction: attraction),
                            ),
                          );
                        },
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // List of attractions below the map
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: mockAttractions.length,
              itemBuilder: (context, index) {
                final attraction = mockAttractions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      attraction.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${attraction.category} . Tap for details'),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}