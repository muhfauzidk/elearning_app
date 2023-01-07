import 'package:elearning_app/constans/r.dart';
import 'package:elearning_app/views/main/latihan_soal/home_page.dart';
import 'package:elearning_app/views/main/latihan_soal/paket_soal_page.dart';
import 'package:flutter/material.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({super.key});
  static String route = "mapel_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Mata Pelajaran",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(PaketSoalPage.route);
              },
              child: MapelWidget());
        }),
      ),
    );
  }
}
