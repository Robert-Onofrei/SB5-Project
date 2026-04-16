// Model class representing a single trail stop
class TrailStop {
  final String name;
  final String description;

  const TrailStop({
    required this.name,
    required this.description,
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
      TrailStop(name: 'Spanish Arch', description: 'Historic 16th century arch on the River Corrib'),
      TrailStop(name: 'Galway City Museum', description: 'Explore Galway\'s history and culture'),
      TrailStop(name: 'Church of St. Nicholas', description: 'Medieval collegiate church dating to 1320'),
      TrailStop(name: 'Shop Street', description: 'The heart of Galway\'s social and cultural life'),
      TrailStop(name: 'Eyre Square', description: 'Central park and gateway to the city'),
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
      TrailStop(name: 'Eyre Square', description: 'Central park and gateway to the city'),
      TrailStop(name: 'Galway Cathedral', description: 'One of the last great stone cathedrals built in the western world'),
      TrailStop(name: 'Salmon Weir Bridge', description: 'Watch salmon leap upstream on the River Corrib'),
      TrailStop(name: 'The Long Walk', description: 'Scenic waterfront walk along the River Corrib'),
      TrailStop(name: 'Claddagh', description: 'Historic fishing village and birthplace of the Claddagh ring'),
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
      TrailStop(name: 'Salthill Promenade', description: 'Famous seaside promenade stretching 2km along Galway Bay'),
      TrailStop(name: 'Blackrock Diving Board', description: 'Iconic diving board and swimming spot'),
      TrailStop(name: 'Galway Lawn Tennis Club', description: 'Historic tennis club founded in 1890'),
      TrailStop(name: 'Salthill Park', description: 'Beautiful park with views over Galway Bay'),
    ],
  ),
];