import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/recipe_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final state = ref.watch(recipeProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Nossas Receitas'),
        actions: [
          IconButton(icon: const Icon (Icons.search), onPressed: (){
            ref.read(recipeProvider.notifier).search('pasta');
          })
        ]
        
      ),
      body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Pesquisar receita',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onSubmitted: (value) {
          ref.read(recipeProvider.notifier).search(value);
        },
      ),
    ),
    Expanded(
      child: ListView.builder(
        itemCount: state.visibleRecipes.length,
        itemBuilder: (context, index) {
          final recipe = state.visibleRecipes[index];
          return ListTile(
            title: Text(recipe.title),
          );
        },
      ),
    ),
  ],
)
  }
}