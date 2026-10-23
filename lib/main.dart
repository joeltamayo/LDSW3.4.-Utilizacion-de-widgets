import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoApp());
}

const Color azulMarino = Color(0xFF172744);
const Color grisFondo = Color(0xFFF7F8FA);
const Color rosa = Color(0xFFE94E77);

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi catálogo',
      theme: ThemeData(
        scaffoldBackgroundColor: grisFondo,
        useMaterial3: true,
      ),
      home: const CatalogoPage(),
    );
  }
}

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Navbar
            Container(
              height: 48,
              color: azulMarino,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Movie Archive',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Contenido principal
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'TODAS LAS PELÍCULAS QUE PUEDES IMAGINAR', // en mayúsculas
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Hello World',
                    style: TextStyle(
                      color: azulMarino,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Primera tarjeta
                  const PeliculaCard(
                    titulo: 'Arrive',
                    imagen: 'https://res.cloudinary.com/dpwmdlttg/image/upload/v1792784683/MV5BMTExMzU0ODcxNDheQTJeQWpwZ15BbWU4MDE1OTI4MzAy._V1__iwyfkl.jpg',
                  ),

                  const SizedBox(height: 18),

                  // Segunda tarjeta
                  const PeliculaCard(
                    titulo: 'La batalla de los angeles',
                    imagen: 'https://res.cloudinary.com/dpwmdlttg/image/upload/v1792784726/MV5BOGI1MzU4MGMtYjY5MC00MDNjLWI3OTMtYjM5YzcwOTg5NWNmXkEyXkFqcGc._V1_FMjpg_UX1000__n7pbk2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PeliculaCard extends StatefulWidget {
  final String titulo;
  final String imagen;

  const PeliculaCard({
    super.key,
    required this.titulo,
    required this.imagen,
  });

  @override
  State<PeliculaCard> createState() => _PeliculaCardState();
}

class _PeliculaCardState extends State<PeliculaCard> {
  bool meGusta = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E3E8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen y botón flotante
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  widget.imagen,
                  width: double.infinity,
                  height: 480,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 480,
                      width: double.infinity,
                      color: const Color(0xFFD7EAF8),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.movie_outlined,
                        size: 60,
                        color: azulMarino,
                      ),
                    );
                  },
                ),
              ),

              // Botón de Me gusta flotante
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    tooltip: 'Me gusta',
                    onPressed: () {
                      setState(() {
                        meGusta = !meGusta;
                      });
                    },
                    icon: Icon(
                      meGusta
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: meGusta ? rosa : azulMarino,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Título de la película
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.titulo,
                    style: const TextStyle(
                      color: azulMarino,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
