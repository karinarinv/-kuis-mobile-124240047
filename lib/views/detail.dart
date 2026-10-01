import 'package:flutter/material.dart'; // library dasar Flutter (Scaffold, Text, dll.)
import '../models/data.dart'; // supaya class Pokemon dikenali di file ini
import 'home.dart' show TypeChip; // ambil HANYA widget TypeChip dari home.dart

// ==========================================================
// DetailPage = halaman detail 1 pokemon
//
// Kenapa StatelessWidget?
// Karena isi halaman ini tidak berubah setelah dibuka. Tidak ada
// tombol yang mengubah tampilan, jadi tidak butuh setState().
// ==========================================================
class DetailPage extends StatelessWidget {
  // Data pokemon yang mau ditampilkan.
  // Datanya dikirim dari halaman Home saat kartu diklik:
  //   DetailPage(pokemon: p)
  final Pokemon pokemon;

  // "required" = wajib diisi, jadi DetailPage tidak bisa dibuka tanpa data.
  const DetailPage({super.key, required this.pokemon});

  // ----------------------------------------------------------
  // _attr = fungsi pembuat 1 baris atribut.
  // Hasilnya seperti:  > Ability: Overgrow
  //
  // Kenapa dibuat fungsi? Ada 4 baris atribut (ID, Ability, Height,
  // Weight) yang bentuknya sama. Daripada menulis kode yang sama
  // 4 kali, cukup tulis sekali lalu panggil 4 kali.
  //
  //   label = nama atribut, contoh "Height"
  //   value = isi atribut, contoh "7"
  //
  // Awalan "_" pada nama artinya fungsi ini private (hanya dipakai
  // di file ini).
  // ----------------------------------------------------------
  Widget _attr(String label, String value) => Padding(
        // jarak 2 pixel di atas dan bawah supaya antar baris tidak dempet
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          // Row = susun ke samping: [ikon panah] [teks]
          children: [
            // Ikon panah kecil ">" di depan tiap atribut
            const Icon(Icons.chevron_right, size: 18),
            // '$label: $value' = gabungkan dua teks.
            // Contoh: label 'Height' dan value '7' jadi "Height: 7"
            Text('$label: $value', style: const TextStyle(fontSize: 12)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    // Nama "pokemon" dipendekkan jadi "p" supaya penulisan di bawah singkat.
    // Jadi p.name sama artinya dengan pokemon.name
    final p = pokemon;

    // Scaffold = kerangka halaman. Punya slot: appBar (atas),
    // body (tengah), bottomNavigationBar (bawah).
    return Scaffold(
      // ---------- BAR ORANYE DI ATAS ----------
      // '${p.name}' menyisipkan nama pokemon ke dalam teks.
      // Contoh hasilnya: "Detail: Bulbasaur"
      appBar: AppBar(title: Text('Detail: ${p.name}')),

      // ---------- ISI HALAMAN ----------
      // SingleChildScrollView = isi bisa di-scroll. Berguna kalau layar
      // HP kecil dan isinya lebih panjang dari layar (mencegah error overflow).
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // jarak isi ke tepi layar
        // Column = susun ke bawah (atas ke bawah)
        child: Column(
          // Semua isi Column rata kiri. Yang perlu di tengah dibungkus Center.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =============================================
            // 1. GAMBAR POKEMON DALAM LINGKARAN UNGU
            // =============================================
            // Center = taruh isinya di tengah (karena Column-nya rata kiri)
            Center(
              // Container = kotak yang bisa diatur ukuran, warna, dan bentuk
              child: Container(
                width: 160, // lebar lingkaran
                height: 160, // tinggi lingkaran (sama dengan lebar = bulat)
                // jarak antara tepi lingkaran dan gambar, supaya gambar
                // tidak menempel ke pinggir
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8DEF8), // warna ungu muda
                  shape: BoxShape.circle, // bentuk lingkaran
                ),
                // Image.network = tampilkan gambar dari link internet
                child: Image.network(
                  p.image, // link gambar dari data
                  // errorBuilder jalan HANYA kalau gambar gagal dimuat
                  // (internet mati atau link rusak). Isinya ikon pengganti
                  // supaya aplikasi tidak tampil kosong atau error.
                  //
                  // (_, __, ___) = errorBuilder otomatis mengirim 3 nilai
                  // (context, error, stackTrace). Kita tidak memakai satupun,
                  // jadi cukup diberi nama "_" yang artinya "abaikan".
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.catching_pokemon, size: 80),
                ),
              ),
            ),

            // SizedBox tanpa isi = spasi kosong (di sini tinggi 12 pixel)
            const SizedBox(height: 12),

            // =============================================
            // 2. NAMA POKEMON (tebal, di tengah)
            // =============================================
            Center(
              child: Text(
                p.name, // contoh: "Bulbasaur"
                style: const TextStyle(
                  fontSize: 16, // ukuran huruf
                  fontWeight: FontWeight.bold, // huruf tebal
                ),
              ),
            ),
            const SizedBox(height: 10),

            // =============================================
            // 3. KOTAK-KOTAK TYPE (abu-abu, di tengah)
            //    contoh: [ Grass ] [ Poison ]
            // =============================================
            Center(
              child: Row(
                // Row biasanya melebar penuh. mainAxisSize.min membuatnya
                // seukuran isinya saja, supaya Center bisa menaruhnya di tengah.
                mainAxisSize: MainAxisSize.min,
                children: p.types
                    // Masalahnya: jumlah type tiap pokemon beda-beda.
                    // Bulbasaur punya 2 (Grass, Poison), Charmander cuma 1 (Fire).
                    // Jadi kotaknya harus dibuat otomatis sesuai isi list.
                    //
                    // .map() = ambil isi list satu per satu, lalu ubah tiap
                    //          isi menjadi widget.
                    // "t"    = nama sementara untuk 1 isi list yang sedang
                    //          diproses (boleh diganti nama lain).
                    //
                    // Contoh Bulbasaur, types = ['Grass', 'Poison']:
                    //   putaran 1: t = 'Grass'  -> dibuat kotak "Grass"
                    //   putaran 2: t = 'Poison' -> dibuat kotak "Poison"
                    //
                    // grey: true = kotak berwarna abu-abu dan lebih besar
                    //              (gaya halaman Detail)
                    .map((t) => TypeChip(t, grey: true))
                    // .map() menghasilkan Iterable, sedangkan "children"
                    // hanya menerima List, jadi diubah dengan .toList()
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),

            // =============================================
            // 4. JUDUL "Attributes"
            // =============================================
            const Text(
              'Attributes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            // =============================================
            // 5. DAFTAR ATRIBUT
            //    Semua data di dummy ditampilkan (soal: 15 poin)
            // =============================================
            // Kenapa '${p.id}'? Fungsi _attr meminta value bertipe String,
            // sedangkan id, height, dan weight bertipe angka (int).
            // '${...}' mengubah angka menjadi teks.
            _attr('ID', '${p.id}'),
            _attr('Ability', p.ability), // ability sudah String, langsung pakai
            _attr('Height', '${p.height}'),
            _attr('Weight', '${p.weight}'),
          ],
        ),
      ),

      // =============================================
      // 6. TOMBOL "Kembali" DI BAGIAN BAWAH
      // =============================================
      // Tombol ditaruh di bottomNavigationBar supaya menempel di dasar
      // layar dan tidak ikut ter-scroll bersama isi halaman.
      bottomNavigationBar: SafeArea(
        // SafeArea = beri jarak otomatis supaya tombol tidak tertutup
        // garis gesture atau tombol navigasi bawaan HP
        child: Padding(
          padding: const EdgeInsets.all(12),
          // SizedBox dipakai untuk mengatur tinggi tombol
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              // onPressed = yang dijalankan saat tombol ditekan.
              //
              // Navigator.pop(context) = tutup halaman ini dan kembali
              // ke halaman sebelumnya (Home). Bisa begini karena Home
              // dibuka memakai Navigator.push, jadi Home masih tersimpan
              // di "tumpukan halaman" dan langsung muncul lagi.
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8DEF8), // warna tombol
                foregroundColor: Colors.black, // warna tulisan tombol
                shape: RoundedRectangleBorder(
                  // 22 = setengah dari tinggi tombol (44),
                  // jadi ujung kiri-kanan tombol membulat penuh
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}