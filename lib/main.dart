import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_squid_game/presentation/home/screens/HomeScreen.dart';

void main()async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://gklitwmeksdgkdecyqnr.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrbGl0d21la3NkZ2tkZWN5cW5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgxNTYyNzcsImV4cCI6MjA1MzczMjI3N30.iWwwIjq3jmeCG2UMwxGfR9teEdmqRQXNOCFVpAoiyPA",
  );
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

