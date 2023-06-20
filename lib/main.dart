import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {"home": (context) => Home()},
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 25,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            NombreCuadranteHor(
              nombre: 'Urgente',
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            NombreCuadranteHor(
              nombre: 'No Urgente',
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
          ],
        ),
        Row(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: NombreCuadranteVert(
                nombre: 'Importante',
              ),
            ),
            SizedBox(width: 10),
            Cuadrante(
              size: size,
              color: Colors.purple,
              importante: true,
              urgente: true,
            ),
            SizedBox(width: 10),
            Cuadrante(
              size: size,
              color: Colors.red,
              importante: true,
              urgente: false,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Row(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: NombreCuadranteVert(
                nombre: 'No Importante',
              ),
            ),
            SizedBox(width: 10),
            Cuadrante(
              size: size,
              color: Colors.green,
              importante: false,
              urgente: true,
            ),
            SizedBox(width: 10),
            Cuadrante(
              size: size,
              color: Colors.blue,
              importante: false,
              urgente: false,
            ),
          ],
        ),
      ],
    ));
  }
}

class Cuadrante extends StatelessWidget {
  const Cuadrante({
    super.key,
    required this.size,
    required this.color,
    required this.importante,
    required this.urgente,
  });

  final Size size;
  final Color color;
  final bool importante;
  final bool urgente;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // String valor1 = filtro(importante, 1);
        // String valor2 = filtro(urgente, 2);
        // print("Ver tarea $valor1 y $valor2");
        Map nota = {"importante": importante, "urgente": urgente};
      },
      onLongPress: () {
        String valor1 = filtro(importante, 1);
        String valor2 = filtro(urgente, 2);
        print("Crear tarea $valor1 y $valor2");
      },
      child: Container(
        height: size.height * 0.4,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class NombreCuadranteHor extends StatelessWidget {
  final String nombre;
  const NombreCuadranteHor({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.4,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(nombre)));
  }
}

class NombreCuadranteVert extends StatelessWidget {
  final String nombre;
  const NombreCuadranteVert({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.height * 0.4,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(nombre)));
  }
}

String filtro(bool nombre, int valor) {
  if (valor == 1) {
    if (nombre) {
      return "Importante";
    } else {
      return "No Importante";
    }
  } else {
    if (nombre) {
      return "Urgente";
    } else {
      return "No Urgente";
    }
  }
}
