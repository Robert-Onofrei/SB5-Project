// Model class representing a single food venue
class FoodVenue {
  final String name;
  final String category;
  final String description;
  final String location;
  final String openingHours;
  final String priceRange;
  final double rating;

  const FoodVenue({
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.openingHours,
    required this.priceRange,
    required this.rating,
  });
}

// Mock food venue data
final List<FoodVenue> mockFoodVenues = [
  FoodVenue(
    name: 'The Quays Bar',
    category: 'Pub',
    description: 'One of Galway\'s most iconic pubs, famous for its traditional Irish music sessions and warm atmosphere.',
    location: 'Quay Street, Galway',
    openingHours: 'Mon - Sun: 10:30am - 11:30pm',
    priceRange: '€€',
    rating: 4.5,
  ),
  FoodVenue(
    name: 'Ard Bia at Nimmos',
    category: 'Restaurant',
    description: 'A beloved Galway restaurant serving locally sourced food in a beautifully restored stone building by the River Corrib.',
    location: 'Spanish Arch, Galway',
    openingHours: 'Tue - Sun: 10am - 9pm',
    priceRange: '€€€',
    rating: 4.7,
  ),
  FoodVenue(
    name: 'Coffeewerk + Press',
    category: 'Cafe',
    description: 'A specialty coffee shop and bookstore tucked away in the Latin Quarter, known for excellent coffee and a cosy atmosphere.',
    location: 'Quay Street, Galway',
    openingHours: 'Mon - Sat: 8am - 6pm',
    priceRange: '€',
    rating: 4.6,
  ),
  FoodVenue(
    name: 'Tigh Neachtain',
    category: 'Pub',
    description: 'A traditional Irish pub in the heart of Galway city, with a cosy interior and a great selection of craft beers.',
    location: 'Cross Street, Galway',
    openingHours: 'Mon - Sun: 10:30am - 11:30pm',
    priceRange: '€€',
    rating: 4.4,
  ),
  FoodVenue(
    name: 'Aniar Restaurant',
    category: 'Restaurant',
    description: 'A Michelin starred restaurant celebrating the wild flavours of the West of Ireland.',
    location: 'Lower Dominick Street, Galway',
    openingHours: 'Tue - Sat: 6pm - 10pm',
    priceRange: '€€€€',
    rating: 4.8,
  ),
  FoodVenue(
    name: 'Java Coffee House',
    category: 'Cafe',
    description: 'A popular cafe in the heart of Galway city, known for its great coffee and friendly staff.',
    location: 'Shop Street, Galway',
    openingHours: 'Mon - Sun: 7:30am - 7pm',
    priceRange: '€',
    rating: 4.3,
  ),
];