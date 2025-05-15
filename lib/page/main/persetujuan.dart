import 'package:flutter/material.dart';

class PersetujuanPage extends StatefulWidget {
  const PersetujuanPage({Key? key}) : super(key: key);

  @override
  State<PersetujuanPage> createState() => _PersetujuanPageState();
}

class _PersetujuanPageState extends State<PersetujuanPage> {
  String selectedAction = '';

  void handleMenuSelection(String value) {
    setState(() {
      selectedAction = value;
    });

    // Misalnya bisa trigger sesuatu berdasarkan value
    if (value == 'edit') {
      // Lakukan edit
      debugPrint('Edit action triggered');
    } else if (value == 'delete') {
      // Lakukan delete
      debugPrint('Delete action triggered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenuButton Demo'),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleMenuSelection,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Text(
          selectedAction.isEmpty ? 'Belum memilih apa-apa' : 'Kamu pilih: $selectedAction',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
