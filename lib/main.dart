import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //1. add Provider Scope
  runApp(const ProviderScope(child: MainApp()));
}

//2. Provider Initialization
final opikProvider = Provider((_) => "Assalamu'alaikum");
final opikCounter = StateProvider<int>((ref) {
  return 0;
});

//3. extends Cunsomer Widget for View Class
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //4. Listen to provider changes and save to variable
    final String val = ref.watch(opikProvider);
    final int counterVal = ref.watch(opikCounter);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            //5. Show state value
            children: [Text(val), Text("Counter : " + counterVal.toString())],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //6. Read & Modify State value
              FloatingActionButton(
                onPressed: () => ref.read(opikCounter.notifier).state++,
                child: const Icon(Icons.add),
              ),
              const SizedBox(),
              FloatingActionButton(
                onPressed: () => ref.read(opikCounter.notifier).state--,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
