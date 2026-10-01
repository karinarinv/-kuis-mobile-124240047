import 'package:flutter/material.dart';
import 'package:pokemon/models/data.dart'; // isi: user1, pokemonList, dll.
import '../root.dart'; // RootPage = halaman utama setelah login

// ==========================================================
// LoginPage = halaman login (halaman pertama yang muncul)
//
// Kenapa StatefulWidget?
// Karena halaman ini punya TextEditingController (menyimpan isi
// kolom username/password) yang harus dibuat dan dibuang manual.
// ==========================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController = "pengambil isi" dari TextField.
  // Nanti dipakai: _userCtrl.text -> isi kolom username
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  // ---------- FUNGSI LOGIN ----------
  // Dipanggil saat tombol Login ditekan.
  void _login() {
    // .trim() = hapus spasi di awal/akhir, supaya "a " dianggap "a"
    final username = _userCtrl.text.trim();
    final password = _passCtrl.text.trim();

    // ScaffoldMessenger = pengelola Snackbar (pesan kecil di bawah layar)
    final messenger = ScaffoldMessenger.of(context);
    // Hapus Snackbar lama dulu supaya tidak menumpuk kalau ditekan berkali-kali
    messenger.hideCurrentSnackBar();

    // Cocokkan input dengan data user di data.dart (user1)
    if (username == user1.username && password == user1.password) {
      // Login berhasil: Snackbar hijau
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          // ${...} = menyisipkan nilai variabel ke dalam teks
          content: Text('Login berhasil! Selamat datang, ${user1.username}'),
        ),
      );

      // pushReplacement = pindah halaman DAN hapus halaman login dari
      // tumpukan, jadi tombol Back tidak bisa kembali ke login.
      // Username dikirim ke RootPage (nanti dipakai di halaman Profile).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => RootPage(username: user1.username),
        ),
      );
    } else {
      // Login gagal: Snackbar merah, tetap di halaman login
      messenger.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login gagal! Username atau password salah'),
        ),
      );
    }
  }

  // dispose = dijalankan saat halaman ditutup.
  // Controller wajib dibuang di sini supaya tidak boros memori (memory leak).
  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold = kerangka halaman (bar atas + isi)
    return Scaffold(
      // Bar di bagian atas layar
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: false, // false = judul rata kiri
      ),

      // Center = taruh isi di tengah layar
      body: Center(
        // SingleChildScrollView = isi bisa di-scroll.
        // Berguna saat keyboard muncul, supaya tidak overflow (garis kuning).
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16), // jarak ke tepi layar

          // Card = kotak putih dengan bayangan yang membungkus form
          child: Card(
            elevation: 3, // tinggi bayangan
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16), // jarak isi ke tepi kartu

              // Column = susun ke bawah: logo, username, password, tombol
              child: Column(
                // min = tinggi Column hanya sebesar isinya (tidak memenuhi layar)
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ==========================================
                  // LOGO / GAMBAR DI ATAS
                  // ==========================================
                  // VERSI SEKARANG = BULAT
                  // CircleAvatar otomatis berbentuk lingkaran.
                  //   radius: 40 -> jari-jari 40, jadi diameter 80
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFF9A825), // warna oranye
                    child: FlutterLogo(size: 44), // logo Flutter di tengah
                  ),

// ini kalo circle tapi pake image dari link
// const CircleAvatar(
//   radius: 40,
//   backgroundColor: Color(0xFFF9A825),
//   backgroundImage: NetworkImage(
//     'https://www.chocolatesandchai.com/wp-content/uploads/2024/10/Martabak-Manis-Featured.jpg',
//   ),
// ),

                  // ------------------------------------------
                  // KALAU MAU KOTAK (bukan bulat):
                  // Hapus/comment CircleAvatar di atas, lalu
                  // pakai Container di bawah ini.
                  //
                  // Container(
                  //   width: 80,   // lebar  (sama dengan diameter bulat: 40 x 2)
                  //   height: 80,  // tinggi (samakan dengan lebar supaya persegi)
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFF9A825), // warna latar
                  
                  //     // Pilih SALAH SATU:
                  //     // a. Kotak dengan sudut sedikit membulat
                  //     borderRadius: BorderRadius.circular(12),
                  //     // b. Kotak tajam 100% (tanpa lengkung):
                  //     //    hapus baris borderRadius di atas
                  //   ),
                  //   alignment: Alignment.center
                  // ),
                  //
                  // Kalau isinya GAMBAR dari link / asset (bukan FlutterLogo),
                  // tambahkan clipBehavior supaya gambar ikut terpotong
                  // mengikuti sudut kotak:
                  //
                  // Container(
                  //   width: 3000,
                  //   height: 300,
                  //   clipBehavior: Clip.antiAlias, // potong gambar sesuai bentuk
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFF9A825),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Image.network(
                  //     'https://www.chocolatesandchai.com/wp-content/uploads/2024/10/Martabak-Manis-Featured.jpg',
                  //     fit: BoxFit.cover, // gambar memenuhi kotak
                  //   ),
                  // ),
                  // ------------------------------------------

                  // SizedBox = spasi kosong (24 px) antara logo dan form
                  const SizedBox(height: 24),

                  // ==========================================
                  // KOLOM USERNAME
                  // ==========================================
                  TextField(
                    controller: _userCtrl, // sambungkan ke controller
                    decoration: const InputDecoration(
                      labelText: 'Username', // teks petunjuk
                      border: OutlineInputBorder(), // garis tepi kotak
                      isDense: true, // kolom lebih ringkas (tidak terlalu tinggi)
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ==========================================
                  // KOLOM PASSWORD
                  // ==========================================
                  TextField(
                    controller: _passCtrl,
                    obscureText: true, // true = teks disamarkan jadi titik-titik
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ==========================================
                  // TOMBOL LOGIN
                  // ==========================================
                  // SizedBox + width: double.infinity = tombol selebar penuh
                  // (selebar kartu), bukan sekecil teksnya saja.
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login, // klik -> jalankan fungsi _login di atas
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF9A825), // warna tombol
                        foregroundColor: Colors.white, // warna teks tombol
                        shape: RoundedRectangleBorder(
                          // lengkung sudut tombol, makin besar makin bulat
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}