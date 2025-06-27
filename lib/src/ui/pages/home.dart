import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _basic = [];
  List _intermediate = [];
  List _advanced = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final response = await rootBundle.loadString('json/categories.json');
    final data = json.decode(response);

    setState(() {
      _basic = data['basic'];
      _intermediate = data['intermediate'];
      _advanced = data['advanced'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 227, 227),
      appBar: const MyAppBar(),
      body:
          _basic.isEmpty && _intermediate.isEmpty && _advanced.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Nível Básico',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    MyGrid(items: _basic),

                    const SizedBox(height: 20),

                    Text(
                      'Nível Intermediário',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ),
                    MyGrid(items: _intermediate),

                    const SizedBox(height: 20),

                    Text(
                      'Nível Avançado',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[800],
                      ),
                    ),
                    MyGrid(items: _advanced),
                  ],
                ),
              ),
    );
  }
}

// Classes

// MyGrid
class MyGrid extends StatefulWidget {
  final List items;
  const MyGrid({super.key, required this.items});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: GridView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),
          children:
              widget.items.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Image.asset(item['image'], fit: BoxFit.cover),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

//MyAppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const ShapeDecoration(
        color: Color.fromARGB(255, 91, 147, 211),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: const AssetImage('images/german.png'),
                backgroundColor: Colors.transparent,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.light_mode,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {},
                  ),
                ],
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
