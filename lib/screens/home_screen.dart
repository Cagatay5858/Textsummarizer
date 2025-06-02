import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _summary = '';
  bool _loading = false;

  void _summarize() async {
    setState(() {
      _loading = true;
    });

    final summary = await ApiService.summarizeDialogue(_controller.text);

    setState(() {
      _summary = summary;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogue Summarizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter dialogue text',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _summarize,
              child: const Text('Summarize'),
            ),
            const SizedBox(height: 24),
            _loading
                ? const CircularProgressIndicator()
                : Text(
                    _summary.isEmpty ? 'Summary will appear here' : _summary,
                    style: const TextStyle(fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }
}
