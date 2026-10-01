// import 'package:flutter/material.dart'; //ini bagian 1 baris
// import 'package:pokemon/models/data.dart';
// import 'detail.dart';
// // ==========================================================
// // TypeChip = kotak kecil untuk menampilkan 1 type pokemon
// //            contoh: [ Grass ] atau [ Poison ]
// //
// // Kenapa dibuat widget sendiri?
// // Karena kotak ini dipakai di 2 tempat:
// //   1. Halaman Home   -> kotak putih kecil (grey = false)
// //   2. Halaman Detail -> kotak abu-abu lebih besar (grey = true)
// // Daripada menulis kode kotak 2 kali, cukup tulis sekali di sini
// // lalu dipakai ulang di mana saja.
// //
// // File detail.dart mengambilnya dengan:
// //   import 'home.dart' show TypeChip;
// // ==========================================================
// class TypeChip extends StatelessWidget {
//   final String label; // teks di dalam kotak, contoh "Grass"

//   // grey = false -> gaya Home (putih, kecil, ada garis tepi)
//   // grey = true  -> gaya Detail (abu-abu, lebih besar, tanpa garis tepi)
//   final bool grey;

//   // "this.label" tanpa nama = parameter posisi, dipakai: TypeChip('Grass')
//   // "this.grey = false"    = parameter bernama, boleh tidak diisi
//   //                          (kalau tidak diisi otomatis false)
//   const TypeChip(this.label, {super.key, this.grey = false});

//   @override
//   Widget build(BuildContext context) {
//     // Container = kotak yang bisa diatur warna, garis tepi, dan jarak
//     return Container(
//       // Jarak kosong di sebelah kanan kotak, supaya antar kotak
//       // tidak menempel (contoh: [Grass] [Poison])
//       margin: const EdgeInsets.only(right: 8),

//       // Jarak antara teks dan tepi kotak (isi kotak dengan "napas").
//       // Tanda "grey ? A : B" artinya: kalau grey benar pakai A, kalau tidak pakai B.
//       // Jadi kotak di Detail lebih besar daripada kotak di Home.
//       padding: EdgeInsets.symmetric(
//         horizontal: grey ? 14 : 10, // jarak kiri-kanan
//         vertical: grey ? 6 : 4, // jarak atas-bawah
//       ),

//       decoration: BoxDecoration(
//         // Warna kotak: abu-abu untuk Detail, putih untuk Home
//         color: grey ? Colors.grey.shade400 : Colors.white,
//         borderRadius: BorderRadius.circular(6), // sudut kotak sedikit membulat
//         // Garis tepi tipis hanya untuk gaya Home.
//         // Untuk gaya Detail tidak ada garis tepi (null = kosong).
//         border: grey ? null : Border.all(color: Colors.grey.shade300),
//       ),

//       // Teks type di dalam kotak
//       child: Text(
//         label,
//         style: TextStyle(
//           fontSize: grey ? 12 : 11,
//           fontWeight: FontWeight.w500, // agak tebal (tidak setebal bold)
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }

// // ==========================================================
// // HomePage = halaman daftar semua pokemon
// //
// // Halaman ini hanya berisi daftarnya saja. Bar oranye di atas dan
// // menu Home/Profile di bawah ada di root.dart.
// //
// // Kenapa StatelessWidget? Karena daftar tidak berubah setelah
// // dibuka (tidak ada fitur cari, filter, dll.).
// // ==========================================================
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ---------- DAFTAR YANG BISA DI-SCROLL ----------
//     // ListView.builder = membuat daftar dengan cara "dibuat satu-satu
//     // sesuai kebutuhan". Item yang belum terlihat di layar belum dibuat,
//     // jadi hemat memori. Cocok untuk data yang banyak.

//     return ListView.builder(
//       padding: const EdgeInsets.all(12), // jarak daftar ke tepi layar
//       itemCount: pokemonList.length,

//       itemBuilder: (context, i) {
//         // Ambil pokemon ke-i dari daftar.
//         // Contoh: i = 0 -> Bulbasaur, i = 3 -> Charmander
//         final p = pokemonList[i];

//         // =============================================
//         // 1 KARTU POKEMON
//         // =============================================
//         // Card = kotak putih dengan bayangan (yang terlihat di screenshot)
//         return Card(
//           elevation: 3, // tinggi bayangan, makin besar makin jelas
//           color: Colors.white,
//           // Jarak di bawah kartu, supaya antar kartu ada celah
//           margin: const EdgeInsets.only(bottom: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10), // sudut kartu membulat
//           ),

//           // InkWell = membuat widget di dalamnya BISA DIKLIK dan
//           // memberi efek percikan air saat disentuh.
//           // (Card sendiri tidak bisa diklik, makanya dibungkus InkWell.)
//           child: InkWell(
//             // Dibuat membulat juga supaya efek percikannya tidak keluar
//             // dari sudut kartu
//             borderRadius: BorderRadius.circular(10),

//             // onTap = yang dijalankan saat kartu diklik.
//             // Navigator.push = buka halaman baru di atas halaman sekarang.
//             // Poin soal: "tiap list data bisa diklik menuju halaman detail"
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 // Buat DetailPage dan KIRIM data pokemon yang diklik (p).
//                 // Data ini diterima DetailPage lewat "required this.pokemon".
//                 // Tanda "_" = parameter yang tidak dipakai, diabaikan.
//                 builder: (_) => DetailPage(pokemon: p),
//               ),
//             ),

//             child: Padding(
//               padding: const EdgeInsets.all(10), // jarak isi ke tepi kartu

//               // Row = isi kartu disusun ke samping (kiri ke kanan):
//               //   [gambar] [nama + type ............] [ikon info]
//               child: Row(
//                 children: [
//                   // ===== a. GAMBAR POKEMON (paling kiri) =====
//                   Image.network(
//                     p.image, // link gambar dari data
//                     width: 48,
//                     height: 48,
//                     // Kalau gambar gagal dimuat (internet mati / link rusak),
//                     // tampilkan ikon pengganti supaya kartu tidak kosong.
//                     // (_, __, ___) = 3 nilai bawaan yang tidak dipakai.
//                     errorBuilder: (_, __, ___) =>
//                         const Icon(Icons.catching_pokemon, size: 48),
//                   ),
//                   const SizedBox(width: 12), // spasi kosong gambar dan teks

//                   // ===== b. NAMA DAN TYPE (bagian tengah) =====
//                   // Expanded = ambil SEMUA sisa ruang yang ada di Row.
//                   // Akibatnya ikon info terdorong ke ujung kanan kartu.
//                   Expanded(
//                     // Column = susun ke bawah: nama di atas, type di bawahnya
//                     child: Column(
//                       // rata kiri
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Nama pokemon (tebal)
//                         Text(
//                           p.name,
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 6), // spasi nama dan type
//                         Text(p.name),
//                         //biar ada spasi
//                         const SizedBox(height: 6),
//                         // Kotak-kotak type, disusun ke samping.
//                         // Jumlah type tiap pokemon beda-beda
//                         // (Bulbasaur 2, Charmander 1), jadi dibuat otomatis:
//                         //
//                         // p.types.map((t) => TypeChip(t))
//                         //   "t" = nama sementara untuk 1 isi list types.
//                         //   Contoh Bulbasaur, types = ['Grass', 'Poison']:
//                         //     putaran 1: t = 'Grass'  -> kotak "Grass"
//                         //     putaran 2: t = 'Poison' -> kotak "Poison"
//                         //
//                         // .toList() = ubah hasil map jadi List,
//                         //             karena "children" hanya menerima List.
//                         Row(
//                           children: p.types.map((t) => TypeChip(t)).toList(),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // ===== c. IKON INFO (paling kanan) =====
//                   // Hanya hiasan sebagai petunjuk bahwa kartu bisa diklik.
//                   // Yang bisa diklik adalah seluruh kartu (InkWell di atas),
//                   // bukan hanya ikon ini.
//                   const Icon(Icons.info, size: 20, color: Colors.black87),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pokemon/models/data.dart';

import 'detail.dart';

// ==========================================================
// TypeChip = kotak kecil untuk menampilkan 1 type pokemon
//            contoh: [ Grass ] atau [ Poison ]
//
// Dipakai di 2 tempat:
//   1. Halaman Home   -> kotak putih kecil (grey = false)
//   2. Halaman Detail -> kotak abu-abu lebih besar (grey = true)
//
// File detail.dart mengambilnya dengan:
//   import 'home.dart' show TypeChip;
// ==========================================================
class TypeChip extends StatelessWidget {
  final String label; // teks di dalam kotak, contoh "Grass"

  // grey = false -> gaya Home (putih, kecil, ada garis tepi)
  // grey = true  -> gaya Detail (abu-abu, lebih besar, tanpa garis tepi)
  final bool grey;

  const TypeChip(this.label, {super.key, this.grey = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Jarak kanan dan bawah, supaya kalau type turun baris (Wrap)
      // antar kotak tetap ada celah
      margin: const EdgeInsets.only(right: 6, bottom: 4),

      // Jarak antara teks dan tepi kotak
      padding: EdgeInsets.symmetric(
        horizontal: grey ? 14 : 10, // kiri-kanan
        vertical: grey ? 6 : 4, // atas-bawah
      ),

      decoration: BoxDecoration(
        color: grey ? Colors.grey.shade400 : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: grey ? null : Border.all(color: Colors.grey.shade300),
      ),

      child: Text(
        label,
        style: TextStyle(
          fontSize: grey ? 12 : 11,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}

// ==========================================================
// HomePage = halaman daftar semua pokemon (GRID 2 KOLOM)
//
// Bar oranye di atas dan menu Home/Profile di bawah ada di root.dart.
// ==========================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // GridView.builder = kotak-kotak yang bisa di-scroll,
    // item dibuat sesuai kebutuhan (hemat memori).
    return GridView.builder(
      padding: const EdgeInsets.all(12), // jarak grid ke tepi layar
      itemCount: pokemonList.length,

      // Aturan grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kartu per baris
        crossAxisSpacing: 12, // jarak antar kartu ke samping
        mainAxisSpacing: 12, // jarak antar kartu ke bawah
        childAspectRatio: 0.78, // bentuk kartu (kecil = makin tinggi)
      ),

      itemBuilder: (context, i) {
        // Ambil pokemon ke-i dari daftar
        final p = pokemonList[i];

        // =============================================
        // 1 KARTU POKEMON
        // =============================================
        return Card(
          elevation: 3,
          color: Colors.white,
          // margin sengaja tidak dipakai, jarak sudah diatur gridDelegate
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          // InkWell = bikin kartu bisa diklik + efek percikan
          child: InkWell(
            borderRadius: BorderRadius.circular(10),

            // Klik kartu -> buka DetailPage dan kirim data pokemon (p)
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailPage(pokemon: p)),
            ),

            // Stack = tumpuk widget. Isi kartu di bawah,
            // ikon info menempel di pojok kanan atas.
            child: Stack(
              children: [
                // ===== ISI KARTU (susun ke bawah) =====
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // a. GAMBAR (Expanded = ambil sisa ruang di atas)
                      Expanded(
                        child: Image.network(
                          p.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.catching_pokemon, size: 64),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // b. NAMA
                      Text(
                        p.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text("nyoba"),
                      const SizedBox(height: 6),

                      // c. TYPE
                      // Wrap = kalau tidak muat 1 baris, otomatis turun
                      // ke baris berikutnya (tidak overflow seperti Row).
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: p.types.map((t) => TypeChip(t)).toList(),
                      ),
                    ],
                  ),
                ),

                // ===== d. IKON INFO (pojok kanan atas) =====
                // Hanya hiasan; yang bisa diklik seluruh kartu.
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.info, size: 18, color: Colors.black54),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
