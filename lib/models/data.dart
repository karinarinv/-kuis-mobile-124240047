class User {
  String username;
  String password;
  String name;

  User({required this.username, required this.password, required this.name});
}

User user1 = User(username: "a", password: "1", name: "Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun");

// ===== Link gambar profil =====
const String maleImg =
    'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
const String femaleImg =
    'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

// Foto default = karakter male
const String defaultProfileImg = maleImg;

//kalo tipe koma pake float/double, kalo pake titik pake int

class Pokemon {
  int id;
  String name;
  List<String> types;
  int height;
  int weight;
  String image;
  String ability;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.image,
    required this.ability,
  });
}

final List<Pokemon> pokemonList = [
  Pokemon(
    id: 1,
    name: 'Bulbasaur',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    types: ['Grass', 'Poison'],
    height: 7,
    weight: 69,
    ability: 'Overgrow',
  ),
  Pokemon(
    id: 2,
    name: 'Ivysaur',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
    types: ['Grass', 'Poison'],
    height: 10,
    weight: 130,
    ability: 'Overgrow',
  ),
  Pokemon(
    id: 3,
    name: 'Venusaur',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
    types: ['Grass', 'Poison'],
    height: 20,
    weight: 1000,
    ability: 'Overgrow',
  ),
  Pokemon(
    id: 4,
    name: 'Charmander',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    types: ['Fire'],
    height: 6,
    weight: 85,
    ability: 'Blaze',
  ),
  Pokemon(
    id: 5,
    name: 'Charmeleon',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
    types: ['Fire'],
    height: 11,
    weight: 190,
    ability: 'Blaze',
  ),
  Pokemon(
    id: 6,
    name: 'Charizard',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
    types: ['Fire', 'Flying'],
    height: 17,
    weight: 905,
    ability: 'Blaze',
  ),
  Pokemon(
    id: 7,
    name: 'Squirtle',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    types: ['Water'],
    height: 5,
    weight: 90,
    ability: 'Torrent',
  ),
  Pokemon(
    id: 8,
    name: 'Wartortle',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',
    types: ['Water'],
    height: 10,
    weight: 225,
    ability: 'Torrent',
  ),
  Pokemon(
    id: 9,
    name: 'Blastoise',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
    types: ['Water'],
    height: 16,
    weight: 855,
    ability: 'Torrent',
  ),
  Pokemon(
    id: 10,
    name: 'Caterpie',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    types: ['Bug'],
    height: 3,
    weight: 29,
    ability: 'Shield Dust',
  ),
  Pokemon(
    id: 11,
    name: 'Metapod',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png',
    types: ['Bug'],
    height: 7,
    weight: 99,
    ability: 'Shed Skin',
  ),
  Pokemon(
    id: 12,
    name: 'Butterfree',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',
    types: ['Bug', 'Flying'],
    height: 11,
    weight: 320,
    ability: 'Compound Eyes',
  ),
  Pokemon(
    id: 13,
    name: 'Weedle',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png',
    types: ['Bug', 'Poison'],
    height: 3,
    weight: 32,
    ability: 'Shield Dust',
  ),
  Pokemon(
    id: 14,
    name: 'Kakuna',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png',
    types: ['Bug', 'Poison'],
    height: 6,
    weight: 100,
    ability: 'Shed Skin',
  ),
  Pokemon(
    id: 15,
    name: 'Beedrill',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png',
    types: ['Bug', 'Poison'],
    height: 10,
    weight: 295,
    ability: 'Swarm',
  ),
  Pokemon(
    id: 16,
    name: 'Pidgey',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png',
    types: ['Normal', 'Flying'],
    height: 3,
    weight: 18,
    ability: 'Keen Eye',
  ),
  Pokemon(
    id: 17,
    name: 'Pidgeotto',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png',
    types: ['Normal', 'Flying'],
    height: 11,
    weight: 300,
    ability: 'Keen Eye',
  ),
  Pokemon(
    id: 18,
    name: 'Pidgeot',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png',
    types: ['Normal', 'Flying'],
    height: 15,
    weight: 395,
    ability: 'Keen Eye',
  ),
  Pokemon(
    id: 19,
    name: 'Rattata',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png',
    types: ['Normal'],
    height: 3,
    weight: 35,
    ability: 'Run Away',
  ),
  Pokemon(
    id: 20,
    name: 'Raticate',
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png',
    types: ['Normal'],
    height: 7,
    weight: 185,
    ability: 'Run Away',
  ),
];
