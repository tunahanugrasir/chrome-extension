import 'package:shared_preferences/shared_preferences.dart';

class SavedWordsRepository {
  Future<List<String>> loadSavedWords() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('savedWords') ?? [];
  }

  Future<void> clearSavedWords() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedWords');
  }
}
