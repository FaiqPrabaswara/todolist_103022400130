
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  // Controller untuk input teks
  TextEditingController kegiatanController =
      TextEditingController();

  TextEditingController tanggalController =
      TextEditingController();

  List<String> kegiatan = [
    'Mengerjakan tugas kuliah',
    'Pergi Kuliah',
    'Pergi Kuliah',
  ];

  List<String> tanggal = [
    '15/10/2026',
    '15/10/2026',
    '16/10/2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            TextField(
              controller: kegiatanController,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                hintText: 'Masukkan kegiatan',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: tanggalController,
              decoration: const InputDecoration(
                labelText: 'Tanggal Kegiatan',
                hintText: 'Contoh: 15/10/2026',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  kegiatanController.clear();
                  tanggalController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Dimasukkan ke dalam list!',
                      ),
                    ),
                  );
                },
                child: const Text('Tambah'),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Daftar To-Do',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: kegiatan.length,

                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(kegiatan[index]),
                      trailing: Text(tanggal[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
