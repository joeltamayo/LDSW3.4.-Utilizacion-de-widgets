import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoApp());
}

const Color azulMarino = Color(0xFF172744);
//const Color grisFondo = Color(0xFFF7F8FA);
const Color rosa = Color(0xFFE94E77);

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Archive',
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset('assets/images/fondo.jpg', fit: BoxFit.fill),

          // Contenido de la pantalla
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 35),

                    const Text(
                      'Bienvenido a',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Movie Archive',
                      style: TextStyle(
                        color: azulMarino,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Tu Archivo personal de películas',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const Text(
                      'Hello World',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const SizedBox(height: 18),

                    // Logo
                    Image.asset(
                      'assets/images/logo.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 65),

                    // Correo
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CORREO',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'ejemplo@correo.com',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Contraseña
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CONTRASEÑA',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '*****',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Botón para entrar al catálogo
                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CatalogoPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: azulMarino,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '¿No tienes una cuenta?',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        'Regístrate aquí.',
                        style: TextStyle(
                          color: Color(0xFF536DFF),
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
              color: azulMarino,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menú desplegable
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onSelected: (opcion) {
                      if (opcion == 'cerrar_sesion') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InicioPage(),
                          ),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem<String>(
                        value: 'cerrar_sesion',
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: azulMarino),
                            SizedBox(width: 10),
                            Text('Cerrar sesión'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Text(
                    'Movie Archive',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
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
                    'TODAS LAS PELÍCULAS QUE PUEDES IMAGINAR',
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

  const PeliculaCard({super.key, required this.titulo, required this.imagen});

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
                      meGusta ? Icons.favorite : Icons.favorite_border,
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
