import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'trail_model.dart';

// Screen that displays a trail's stops on an interactive map
class TrailMapScreen extends StatelessWidget {
  final Trail trail;

  const TrailMapScreen({super.key, required this.trail});

  @override
  Widget build(BuildContext context) {
    // Centre the map on the first stop of the trail
    final centre = LatLng(trail.stops.first.latitude, trail.stops.first.longitude);

    return Scaffold(
      appBar: AppBar(title: Text(trail.name)),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: centre,
          initialZoom: 14.0,
        ),
        children: [
          // Map tiles from OpenStreetMap
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.failtego',
          ),
          // Blue line connecting the trail stops in order
          PolylineLayer(
            polylines: [
              Polyline(
                points: trail.stops.map((stop) => LatLng(stop.latitude, stop.longitude)).toList(),
                color: Colors.blue,
                strokeWidth: 3.0,
              ),
            ],
          ),
          // Red pins marking each stop with its name above
          MarkerLayer(
            markers: trail.stops.map((stop) {
              return Marker(
                point: LatLng(stop.latitude, stop.longitude),
                width: 200,
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        stop.name,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.location_pin, color: Colors.red, size: 30),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}