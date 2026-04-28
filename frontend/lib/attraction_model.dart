// Model class representing a single attraction
class Attraction {
  final String name;
  final String category;
  final String description;
  final String location;
  final String built;
  final String openingHours;
  final String admission;
  final String imagePath;

  const Attraction({
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.built,
    required this.openingHours,
    required this.admission,
    required this.imagePath,
  });
}

final List<Attraction> mockAttractions = [
  Attraction(
    name: 'Spanish Arch',
    category: 'Heritage',
    description: 'Built in 1584, the Spanish Arch is a remnant of the old Galway city walls, located near the River Corrib.',
    location: 'Spanish Parade, Galway',
    built: '1584',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/spanish_arch.jpg',
  ),
  Attraction(
    name: 'Galway City Museum',
    category: 'Museum',
    description: 'The Galway City Museum explores the history and culture of Galway city from prehistoric times to the present day.',
    location: 'Spanish Parade, Galway',
    built: '2006',
    openingHours: 'Tue - Sat: 10am - 5pm',
    admission: 'Free',
    imagePath: 'assets/images/attractions/museum.jpg',
  ),
  Attraction(
    name: 'Church of St. Nicholas',
    category: 'Heritage',
    description: 'The Collegiate Church of St. Nicholas of Myra is a medieval church dating to 1320, making it the largest medieval parish church in Ireland still in continuous use.',
    location: 'Lombard Street, Galway',
    built: '1320',
    openingHours: 'Mon - Sat: 9am - 5pm, Sun: 1pm - 5pm',
    admission: 'Free',
    imagePath: 'assets/images/attractions/church.jpg',
  ),

  Attraction(
    name: 'Eyre Square',
    category: 'Heritage',
    description: 'The heart of Galway city, Eyre Square is a popular public park and shopping area surrounded by historic buildings and monuments.',
    location: 'Eyre Square, Galway',
    built: '1710',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/eyre_square.jpg',
  ),
  Attraction(
    name: 'Shop Street',
    category: 'Culture',
    description: 'The main pedestrianised street in Galway city, lined with shops, cafes, street performers and historic buildings.',
    location: 'Shop Street, Galway',
    built: 'Medieval',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/shop_street.jpg',
  ),
  Attraction(
    name: 'Galway Cathedral',
    category: 'Heritage',
    description: 'One of the last great stone cathedrals built in the western world, completed in 1965 on the banks of the River Corrib.',
    location: 'Gaol Road, Galway',
    built: '1965',
    openingHours: 'Mon - Sun: 8am - 6:30pm',
    admission: 'Free',
    imagePath: 'assets/images/attractions/cathedral.jpeg',
  ),
  Attraction(
    name: 'Salmon Weir Bridge',
    category: 'Nature',
    description: 'A popular spot to watch salmon leap upstream on the River Corrib during spawning season.',
    location: 'Salmon Weir Bridge, Galway',
    built: '1818',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/bridge.jpeg',
  ),
  Attraction(
    name: 'The Long Walk',
    category: 'Nature',
    description: 'A scenic waterfront walk along the River Corrib with colourful terraced houses and stunning views of the Spanish Arch.',
    location: 'The Long Walk, Galway',
    built: '19th Century',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/long_walk.jpg',
  ),
  Attraction(
    name: 'Claddagh',
    category: 'Heritage',
    description: 'Historic fishing village and birthplace of the world famous Claddagh ring, located at the mouth of the River Corrib.',
    location: 'Claddagh, Galway',
    built: 'Medieval',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/claddagh.jpg',
  ),
  Attraction(
    name: 'Salthill Promenade',
    category: 'Nature',
    description: 'Famous seaside promenade stretching 2km along Galway Bay with stunning views of the Burren and Aran Islands.',
    location: 'Salthill, Galway',
    built: 'Early 20th Century',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/prom.jpg',
  ),
  Attraction(
    name: 'Blackrock Diving Board',
    category: 'Nature',
    description: 'An iconic diving board and swimming spot at the end of the Salthill Promenade, popular with locals year round.',
    location: 'Salthill, Galway',
    built: 'Early 20th Century',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/blackrock.jpeg',
  ),
  Attraction(
    name: 'Galway Lawn Tennis Club',
    category: 'Sport',
    description: 'Historic tennis club founded in 1890, one of the oldest tennis clubs in Ireland.',
    location: 'Salthill, Galway',
    built: '1890',
    openingHours: 'Mon - Sun: 8am - 10pm',
    admission: 'Members only',
    imagePath: 'assets/images/attractions/tennis.jpeg',
  ),
  Attraction(
    name: 'Salthill Park',
    category: 'Nature',
    description: 'A beautiful park overlooking Galway Bay with walking paths, playgrounds and stunning views of the Burren.',
    location: 'Salthill, Galway',
    built: 'Early 20th Century',
    openingHours: 'Open 24 hours',
    admission: 'Free',
    imagePath: 'assets/images/attractions/park.webp',
  ),

];