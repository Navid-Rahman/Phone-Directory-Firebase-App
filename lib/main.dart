import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contacts App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: thisAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: [
                myChip("[ALL]", Colors.indigo),
                const SizedBox(width: 10),
                myChip("Engineer", Colors.orange),
                const SizedBox(width: 10),
                myChip("Driver", Colors.red),
                const SizedBox(width: 10),
                myChip("Doctor", Colors.teal),
                const SizedBox(width: 10),
                myChip("Supervisor", Colors.green),
                const SizedBox(width: 10),
                myChip("People", Colors.pink),
                const SizedBox(width: 10),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  contact(),
                  contact(),
                  contact(),
                  contact(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar thisAppBar() {
    return AppBar(
      title: Column(
        children: [
          const Text('Contacts App'),
          locationDropdown(),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: null,
          child: const Icon(Icons.help_outlined),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: null,
          child: const Icon(Icons.info_sharp),
        ),
      ],
    );
  }

  Widget locationDropdown() {
    return DropdownButton<String>(
      items: <String>[
        '[ALL]',
        'Dhaka',
        'Chittagong',
        'Cumilla',
        'Rajshahi',
        'Noakhali',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {});

        print("Selected Location: $newValue");
      },
    );
  }

  Widget myChip(String label, Color color) {
    return GestureDetector(
      child: Chip(
        label: Text(label),
        labelPadding: const EdgeInsets.only(left: 8, right: 8),
        backgroundColor: color,
        elevation: 6,
        shadowColor: Colors.grey[60],
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget contact() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Row(
          children: [
            Flexible(
              flex: 4,
              child: GestureDetector(
                child: Column(
                  children: [
                    const Text(
                      'name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'position',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'location',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          color: Colors.black87,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: const Text(
                            'category',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Column(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.call),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.sms_rounded),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.whatshot),
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
