import 'package:flutter/material.dart';
import 'package:pokemon/models/data.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
 String _photo = defaultProfileImg;
 
  Widget _picButton(String url, Color color) {
    return GestureDetector(
      onTap: () => setState(() => _photo = url),
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                  color: Color(0xFFE8DEF8), shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                _photo,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person, size: 60),
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.username,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _picButton(maleImg, Colors.blue),
                _picButton(femaleImg, Colors.pink),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8DEF8),
                foregroundColor: Colors.black,
                minimumSize: const Size(80, 30),
              ),
              child: const Text('Logout', style: TextStyle(fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }
}