import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController TabC = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Whatsapp Clone",
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: TabC,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.camera_alt_sharp,
                color: Colors.white,
              ),
            ),
            Tab(
              child: Text(
                "Chats",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Status",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Calls",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: TabC,
        children: [
          Icon(Icons.camera_alt_sharp),
          ListView(
            children: const [
              ChatItem(
                nama: "Budi",
                pesanTerakhir: "Halo, apa kabar?",
                waktu: "10:30",
                jumlahPesanBelumDibaca: 2,
              ),
              ChatItem(
                nama: "Ani",
                pesanTerakhir: "Jadi kita ketemu jam berapa?",
                waktu: "09:15",
                jumlahPesanBelumDibaca: 0,
              ),
              ChatItem(
                nama: "Dedi",
                pesanTerakhir: "Oke, sampai ketemu besok!",
                waktu: "Kemarin",
                jumlahPesanBelumDibaca: 0,
              ),
              ChatItem(
                nama: "Siti",
                pesanTerakhir: "Terima kasih infonya",
                waktu: "Kemarin",
                jumlahPesanBelumDibaca: 1,
              ),
            ],
          ),
          Center(
            child: Text("Status"),
          ),
          Center(
            child: Text("Calls"),
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String nama;
  final String pesanTerakhir;
  final String waktu;
  final int jumlahPesanBelumDibaca;

  const ChatItem({
    Key? key,
    required this.nama,
    required this.pesanTerakhir,
    required this.waktu,
    required this.jumlahPesanBelumDibaca,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nama),
      subtitle: Text(pesanTerakhir),
      trailing: Column(
        children: [
          Text(waktu),
          if (jumlahPesanBelumDibaca > 0)
            CircleAvatar(
              radius: 10,
              child: Text(jumlahPesanBelumDibaca.toString()),
            ),
        ],
      ),
    );
  }
}
