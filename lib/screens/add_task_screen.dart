import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  // ini controller buat nangkep apa yang aku ketik di kolom judul dan deskripsi
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF0F4F8,
      ), // disamain kaya home screen warnanya
      appBar: AppBar(
        title: const Text(
          "Tambah Task Baru",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF1976D2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // kasih teks dikit biar jelas
              const Text(
                "Mau ngapain hari ini?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
              const SizedBox(height: 24),

              // ini inputan buat judul task
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Judul Task",
                  hintText: "Contoh: Beli Kopi",
                  prefixIcon: const Icon(Icons.edit_note),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide.none, // ngilangin garis item yang kaku
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ini inputan buat deskripsi, aku bikin agak gede biar muat banyak
              TextField(
                controller: descController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Deskripsi",
                  hintText: "Contoh: Kopi susu gula aren ukuran large",
                  // biar labelnya tetep di atas walau maxLines-nya banyak
                  filled: true,
                  alignLabelWithHint: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // tombol simpan yang panjang full layar
              SizedBox(
                width: double.infinity,
                // agak ditonggihin biar gampang dipencet
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // ada bayangannya dikit biar cakep
                    elevation: 5,
                  ),
                  onPressed: () {
                    // pas tombol diklik, kirim title dan description ke home trus langsung tutup layar ini
                    Navigator.pop(context, {
                      "title": titleController.text,
                      "description": descController.text,
                    });
                  },
                  child: const Text(
                    "Simpan Task",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
