import 'package:flutter/material.dart';

import '../Pages/memory_match_page.dart';
import '../Widgets/game_button.dart';
import '../Widgets/dropdown.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  State<StartupPage> createState() => StartupPageState();

}

class StartupPageState extends State<StartupPage> with SingleTickerProviderStateMixin {

  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
  super.initState();
  _controller = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 250),
  );
  _expandAnimation = CurvedAnimation(
  parent: _controller,
  curve: Curves.easeInOut,
  );
  }

  void _toggleMenu() {
  setState(() {
  _isOpen = !_isOpen;
  if (_isOpen) {
  _controller.forward();
  } else {
  _controller.reverse();
  }
  });
  }

  void _selectOption(String option) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Seleccionaste: $option')),
  );
  _toggleMenu(); // Cierra el menú al seleccionar
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.dark_mode_outlined), // Icono principal
              onSelected: (String result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Seleccionaste: $result')),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Activar volumen',
                  child: Text('Activar volumen'),
                ),
                const PopupMenuItem<String>(
                  value: 'Mutear',
                  child: Text('Mutear'),
                ),
                const PopupMenuItem<String>(
                  value: 'Silenciar',
                  child: Text('Silenciar'),
                ),
              ],
            ),

          ],
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text('MEMORAMA', style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
              GameButton(
                  title: 'Empezar Partida',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context){
                        return const MemoryMatchPage();
                      })
                    );
                  }
              ),
            ],
          ),
      ),
    );

  }
}

