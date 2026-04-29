import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Service to manage saved/favourited items using the backend API
class FavouritesService {
  static const String _baseUrl = 'http://10.0.2.2:3000/api/favourites';

  // Get the stored user ID
  static Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  // Check if a trail is saved
  static Future<bool> isTrailSaved(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.get(Uri.parse('$_baseUrl/$userId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedTrails = List<String>.from(data['savedTrails']);
      return savedTrails.contains(name);
    }
    return false;
  }

  // Toggle a trail as saved or unsaved
  static Future<bool> toggleTrail(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.post(
      Uri.parse('$_baseUrl/$userId/trail'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedTrails = List<String>.from(data['savedTrails']);
      return savedTrails.contains(name);
    }
    return false;
  }

  // Check if an attraction is saved
  static Future<bool> isAttractionSaved(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.get(Uri.parse('$_baseUrl/$userId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedAttractions = List<String>.from(data['savedAttractions']);
      return savedAttractions.contains(name);
    }
    return false;
  }

  // Toggle an attraction as saved or unsaved
  static Future<bool> toggleAttraction(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.post(
      Uri.parse('$_baseUrl/$userId/attraction'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedAttractions = List<String>.from(data['savedAttractions']);
      return savedAttractions.contains(name);
    }
    return false;
  }

  // Check if a food venue is saved
  static Future<bool> isFoodSaved(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.get(Uri.parse('$_baseUrl/$userId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedFood = List<String>.from(data['savedFood']);
      return savedFood.contains(name);
    }
    return false;
  }

  // Toggle a food venue as saved or unsaved
  static Future<bool> toggleFood(String name) async {
    final userId = await _getUserId();
    if (userId == null) return false;
    final response = await http.post(
      Uri.parse('$_baseUrl/$userId/food'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final savedFood = List<String>.from(data['savedFood']);
      return savedFood.contains(name);
    }
    return false;
  }

  // Get all saved items
  static Future<Map<String, List<String>>> getAllSaved() async {
    final userId = await _getUserId();
    if (userId == null) return {'savedTrails': [], 'savedAttractions': [], 'savedFood': []};
    final response = await http.get(Uri.parse('$_baseUrl/$userId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'savedTrails': List<String>.from(data['savedTrails']),
        'savedAttractions': List<String>.from(data['savedAttractions']),
        'savedFood': List<String>.from(data['savedFood']),
      };
    }
    return {'savedTrails': [], 'savedAttractions': [], 'savedFood': []};
  }
}