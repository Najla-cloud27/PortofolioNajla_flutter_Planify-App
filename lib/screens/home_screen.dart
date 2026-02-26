import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // sekarang aku simpan title dan description di sini ya
  List<Map<String, String>> tasks = [];

  // ini fungsi buat masukin task baru ke dalem list
  void addTask(Map<String, String> task) {
    setState(() {
      tasks.add(task);
    });
  }

  // ini fungsi buat ngehapus task kalau udah kelar
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // warna background utama aku bikin agak putih kebiruan biar clean
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text(
          "Planify",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        // warna appbar aku samain kaya background trus ga pake bayangan biar nyatu
        backgroundColor: Colors.transparent,
        elevation: 0,
        // warna teks yawwwww
        foregroundColor: const Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // nah di sini aku cek, kalau kosong tampilin gambar lucu, kalau ada isinya tampilin list
        child: tasks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // icon gede biar ga sepi layarnya
                    const Icon(
                      Icons.assignment_turned_in_outlined,
                      size: 80,
                      color: Color(0xFF90CAF9),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Belum ada task nih 💙",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  // desain kotak (card) buat masing-masing task-nya aku bikin rounded
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      // icon bulat di sebelah kiri biar cakep
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFE3F2FD),
                        child: const Icon(
                          Icons.task_alt,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      // judul tasknya aku tebelin
                      title: Text(
                        tasks[index]["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // deskripsinya warnanya agak abu-abu
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          tasks[index]["description"]!,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                      // tombol tempat sampah buat hapus task
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.redAccent,
                        ),
                        onPressed: () => deleteTask(index),
                      ),
                    ),
                  );
                },
              ),
      ),
      // tombol plus di pojok bawah aku bikin lebih gede dan rounded
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () async {
          // pas tombol ini diklik, dia pindah ke layar tambah task trus nunggu balasan
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );

          // kalau balasannya ada isinya (gak null), langsung masukin ke fungsi addTask
          if (newTask != null) {
            addTask(newTask);
          }
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
