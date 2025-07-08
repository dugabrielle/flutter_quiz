import 'package:flutter/material.dart';

class PerfildoUsuario extends StatefulWidget {
  const PerfildoUsuario({super.key});

  @override
  State<PerfildoUsuario> createState() => _PerfildoUsuarioState();
}

class _PerfildoUsuarioState extends State<PerfildoUsuario> {
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 235, 240),
      appBar: PerfilAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2, 0.5, 1.0],
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.red,
                    Colors.yellow,
                  ],
                ),
              ),
              child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Configurações',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(radius: 80, backgroundColor: Colors.grey),
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: const AssetImage('images/german.png'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: TextField(
                  controller: _nomeController,
                  maxLines: 1,
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 91, 147, 211),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 222, 222),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final nome = _nomeController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Nome salvo: $nome')),
                      );
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PerfilAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 91, 147, 211),
        border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              const Text(
                'Meu Perfil',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
