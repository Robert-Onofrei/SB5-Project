// Model class representing a single trail stop
class TrailStop {
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  const TrailStop({
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}

// Model class representing a cultural trail
class Trail {
  final String name;
  final String distance;
  final String duration;
  final int numberOfStops;
  final String description;
  final List<TrailStop> stops;

  const Trail({
    required this.name,
    required this.distance,
    required this.duration,
    required this.numberOfStops,
    required this.description,
    required this.stops,
  });
}

// Mock trail data, will be replaced with real data from the API later
final List<Trail> mockTrails = [
  Trail(
    name: 'Latin Quarter Trail',
    distance: '1.2km',
    duration: '45 min',
    numberOfStops: 7,
    description:
        'The Latin Quarter Trail takes you through the heart of Galway city, exploring its rich cultural heritage, medieval architecture, and vibrant street life.',
    stops: [
      TrailStop(name: 'Spanish Arch', description: 'Historic 16th century arch on the River Corrib', latitude: 53.2696, longitude: -9.0536),
      TrailStop(name: 'Galway City Museum', description: 'Explore Galway\'s history and culture', latitude: 53.2698, longitude: -9.0530),
      TrailStop(name: 'Church of St. Nicholas', description: 'Medieval collegiate church dating to 1320', latitude: 53.2720, longitude: -9.0530),
      TrailStop(name: 'Shop Street', description: 'The heart of Galway\'s social and cultural life', latitude: 53.2726, longitude: -9.0527),
      TrailStop(name: 'Eyre Square', description: 'Central park and gateway to the city', latitude: 53.2743, longitude: -9.0490),
    ],
  ),
  Trail(
    name: 'Galway City Trail',
    distance: '2.1km',
    duration: '60 min',
    numberOfStops: 5,
    description:
        'Explore the best of Galway city on this trail, taking in the main landmarks and hidden gems of this vibrant Irish city.',
    stops: [
      TrailStop(name: 'Eyre Square', description: 'Central park and gateway to the city', latitude: 53.2743, longitude: -9.0490),
      TrailStop(name: 'Galway Cathedral', description: 'One of the last great stone cathedrals built in the western world', latitude: 53.2753, longitude: -9.0592),
      TrailStop(name: 'Salmon Weir Bridge', description: 'Watch salmon leap upstream on the River Corrib', latitude: 53.2748, longitude: -9.0575),
      TrailStop(name: 'The Long Walk', description: 'Scenic waterfront walk along the River Corrib', latitude: 53.2690, longitude: -9.0500),
      TrailStop(name: 'Claddagh', description: 'Historic fishing village and birthplace of the Claddagh ring', latitude: 53.2670, longitude: -9.0540),
    ],
  ),
  Trail(
    name: 'Salthill Trail',
    distance: '3.5km',
    duration: '90 min',
    numberOfStops: 4,
    description:
        'A scenic coastal trail along the famous Salthill promenade, with stunning views of Galway Bay and the Burren.',
    stops: [
      TrailStop(name: 'Salthill Promenade', description: 'Famous seaside promenade stretching 2km along Galway Bay', latitude: 53.2590, longitude: -9.0780),
      TrailStop(name: 'Blackrock Diving Board', description: 'Iconic diving board and swimming spot', latitude: 53.2560, longitude: -9.0890),
      TrailStop(name: 'Galway Lawn Tennis Club', description: 'Historic tennis club founded in 1890', latitude: 53.2580, longitude: -9.0830),
      TrailStop(name: 'Salthill Park', description: 'Beautiful park with views over Galway Bay', latitude: 53.2575, longitude: -9.0850),
    ],
  ),
];