import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/recipe_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossas Receitas'),
        actions: [
          IconButton(icon: const Icon (Icons.search), onPressed: (){
            ref.read(recipeNotifierProvider.notifier).search('pasta');
          })
        ]
        
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null
              ? Center(child: Text(state.errorMessage!))
              : ListView.builder(
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.recipes[index];
                    return ListTile(
                      leading: Image.network(recipe.image, width: 50, errorBuilder: (_, __, ___) => const Icon(Icons.fastfood)),
                      title: Text(recipe.title),
                      subtitle: Text('Pronto em ${recipe.readyInMinutes} min'),
                    );
                  },
                ),
    );
  }
}