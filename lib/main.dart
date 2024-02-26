import 'package:firebase_analytics/f.irebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/init/pages/init.dart';
import 'package:ishibashi/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAnalytics.instance.logEvent(
    name: 'アプリ起動',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '石橋ごはんルーレット',
        theme: ThemeData(
          fontFamily: 'MPLUS',
          useMaterial3: false,
        ),
        home: const HomePage(),
      );
}
