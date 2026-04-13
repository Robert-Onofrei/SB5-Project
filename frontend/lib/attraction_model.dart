// Model class representing a single attraction
class Attraction {
  final String name;
  final String category;
  final String description;
  final String location;
  final String built;
  final String openingHours;
  final String admission;

  const Attraction({
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.built,
    required this.openingHours,
    required this.admission,
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
  ),
  Attraction(
    name: 'Galway City Museum',
    category: 'Museum',
    description: 'The Galway City Museum explores the history and culture of Galway city from prehistoric times to the present day.',
    location: 'Spanish Parade, Galway',
    built: '2006',
    openingHours: 'Tue - Sat: 10am - 5pm',
    admission: 'Free',
  ),
  Attraction(
    name: 'Church of St. Nicholas',
    category: 'Heritage',
    description: 'The Collegiate Church of St. Nicholas of Myra is a medieval church dating to 1320, making it the largest medieval parish church in Ireland still in continuous use.',
    location: 'Lombard Street, Galway',
    built: '1320',
    openingHours: 'Mon - Sat: 9am - 5pm, Sun: 1pm - 5pm',
    admission: 'Free',
  ),
];