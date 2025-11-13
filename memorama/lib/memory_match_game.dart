import 'package:flutter/material.dart';

import '../Pages/startup_page.dart';





class MemoryMatchGame extends StatelessWidget{
  const MemoryMatchGame({
    Key? key
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartupPage(),
      title: 'Memorama',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
