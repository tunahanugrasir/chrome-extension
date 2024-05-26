import 'package:flutter/material.dart';
import '../data/saved_words_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late final SavedWordsRepository _repository = SavedWordsRepository();
  late Future<List<String>> _savedWordsFuture;

  @override
  void initState() {
    super.initState();
    _savedWordsFuture = _repository.loadSavedWords(); 
  }

  Future<void> _clearSavedWords() async {
    await _repository.clearSavedWords();
    setState(() {
      _savedWordsFuture = _repository.loadSavedWords(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Words'),
      ),
      body: FutureBuilder<List<String>>(
        future: _savedWordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); 
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No saved words yet.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearSavedWords,
        tooltip: 'Clear Saved Words',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
