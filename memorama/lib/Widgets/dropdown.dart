import 'package:flutter/material.dart';

class SlidingOptionsButton extends StatefulWidget {
  const SlidingOptionsButton({super.key});

  @override
  State<SlidingOptionsButton> createState() => _SlidingOptionsButtonState();
}

class _SlidingOptionsButtonState extends State<SlidingOptionsButton>
    with SingleTickerProviderStateMixin {
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
    // 💡 Corrección: Usamos un Stack para superponer el menú sobre el AppBar
    // y Align y OverflowBox para que el menú se salga de los límites del AppBar.
    // Wrap con Align para mantenerlo a la derecha del AppBar.
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        // Tamaño fijo para evitar el error de RenderBox
        width: 120, // Ancho suficiente para el botón y el menú
        height: kToolbarHeight, // Altura del AppBar
        child: Stack(
          children: [
            // El menú animado debe ir en la parte superior del Stack,
            // y usamos Positioned/Align para colocarlo correctamente.
            // OverflowBox permite que el contenido se extienda fuera de los límites del Container/Stack.
            Align(
              alignment: Alignment.topCenter,
              child: OverflowBox(
                minHeight: 0.0,
                maxHeight: 200.0, // Altura máxima para el menú desplegable
                minWidth: 0.0,
                maxWidth: 150.0, // Ancho máximo del menú desplegable
                alignment: Alignment.topRight, // Alineación del menú desplegable
                child: SizeTransition(
                  sizeFactor: _expandAnimation,
                  axisAlignment: -1.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: kToolbarHeight), // Desplazar bajo el botón
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Importante
                        children: [
                          _buildOption('Activar volumen'),
                          _buildOption('Mutear'),
                          _buildOption('Silenciar'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Botón principal (Siempre visible)
            Align(
              alignment: Alignment.center, // Centrar el botón dentro del Container/Stack
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _toggleMenu,
                icon: Icon(_isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                label: const Text("Opciones"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String title) {
    // El InkWell es correcto para el hit-testing de las opciones
    return InkWell(
      onTap: () => _selectOption(title),
      child: Container(
        width: 150.0, // Ancho explícito para las opciones del menú
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        alignment: Alignment.centerLeft,
        child: Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}