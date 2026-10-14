import 'package:flutter/material.dart';

// Widget que representa la barra de navegación personalizada
class NavBar extends StatelessWidget {
  const NavBar({required this.title, super.key}); // constructor que recibe un widget title

  final Widget title; // propiedad que representa el título de la barra de navegación

  @override
  // Barra de navegación
  Widget build(BuildContext context) {
    return Container(
      height: 56, // altura de la barra de navegación
      padding: const EdgeInsets.symmetric(horizontal: 8),   // padding
      decoration: BoxDecoration(color: const Color.fromARGB(255, 2, 18, 31)), // color
      // Row es un layout horizontal
      child: Row(
        children: [
          Expanded(child: title,) // el título ocupa todo el espacio disponible
        ],
      ),
    );
  }
}

// Widget que representa la estructura principal de la aplicación
class MiEstructura extends StatelessWidget {
  const MiEstructura({super.key});

  @override
  Widget build(BuildContext context) {
    // Material es un widgwet que representa un pedazo de material visual
    return Material(
      child: Column(
        children: [
          NavBar(
            title: Text(
              'Welcome to Flutter',
              style:
                  Theme.of(context)
                      .primaryTextTheme
                      .titleLarge,
            ),
          ),
          const Expanded(child: Center(child: Text('Hello World'))),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'Catalogo de Películas',
      home: SafeArea(child: MiEstructura()),
    ),
  );
}