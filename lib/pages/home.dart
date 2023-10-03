import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
// import '../utils/fire_auth.dart';

class MyHomePage extends StatefulWidget {
  final User user;

  const MyHomePage({required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late final DatabaseReference _counterRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;

  late User _currentUser;
  late String _userId;

  @override
  void initState() {
    _currentUser = widget.user;
    _userId = _currentUser.uid;

    super.initState();
    init();
  }

  void init() async {
    _counterRef = FirebaseDatabase.instance.ref('counters/$_userId');
    
    try {
      final counterSnapshot = await _counterRef.get();
      _counter = (counterSnapshot.value ?? 0) as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    _counterSubscription = _counterRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _counter = (event.snapshot.value ?? 0) as int;
      });
    });
  }

  void _incrementCounter() async {
    await _counterRef.set(ServerValue.increment(1));
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _counterSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, ${_currentUser.displayName} \nQuantidade pressionada: $_counter',
            ),
            
            const SizedBox(height: 16.0),
            Text('EMAIL: ${_currentUser.email}'),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signOut,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 45, 59, 70),
                foregroundColor: Colors.white,
              ),
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
