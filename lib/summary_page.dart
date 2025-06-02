import 'package:flutter/material.dart';
import 'services/api_service.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final TextEditingController _controller = TextEditingController();
  String _summary = '';
  bool _isLoading = false;

  Future<void> _getSummary() async {
    setState(() => _isLoading = true);
    try {
      final result = await ApiService.summarizeText(_controller.text);
      setState(() => _summary = result);
    } catch (e) {
      setState(() => _summary = 'Hata: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diyalog Özetleyici")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: "Diyaloğu girin",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _getSummary,
              child: const Text("Özetle"),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : Text(
                    _summary,
                    style: const TextStyle(fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }
}
