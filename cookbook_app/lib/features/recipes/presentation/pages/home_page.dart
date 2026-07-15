import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/recipe_notifier.dart';
import 'recipe_details_page.dart';
import 'favorites_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _controller = TextEditingController();// guarda texto no campo de texto
  String _sort = 'none'; // sem ordenação
  String _category = 'all'; //todas as categorias

  @override
  void dispose() { //serve para liberar o campo de de texro dps de usar
  //perde a memoria para nao ficar ocupando memoria
    _controller.dispose();
    super.dispose();
  }

void _search() {//literalmente leva oq foi escrito no campo de texto para a função de busca
    final query = _controller.text.trim(); // oq foi escrito, mesmo com espaços no inicio e no final, ele vai tirar esses espaços

    ref.read(recipeProvider.notifier).search(//finalmente chama a função de busca, passando os parametros de busca
      query: query,
      sort: _sort,
      category: _category,
    );
  }

  @override
  Widget build(BuildContext context) {// a tela comeca a ter um corpo apartir daqui.
    final state = ref.watch(recipeProvider);// mostra qual o estado atual da tela.

    return Scaffold(//estrutura basica da tela
      appBar: AppBar(//barra de titulo da tela
        backgroundColor: Colors.green,//fundo
        foregroundColor: Colors.white,//texto
        title: const Text('Our recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: Column(// content da pagina
      //coluna vertical, onde os elementos vao ser colocados um embaixo do outro
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(//campo de pesquisa)
              controller: _controller,// 
              decoration: const InputDecoration(//aparencia
                labelText: 'Search recipes',//texto do campo
                border: OutlineInputBorder(),//borda
                prefixIcon: Icon(Icons.search),//icone
              ),
              onSubmitted: (_) => _search(),// enviar = rodar
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(//menu de escolhas em dropdown
              value: _sort,// escolha a ordenação
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sort by',
              ),
              items: const [// opções do menu de escolhas
                DropdownMenuItem(
                  value: 'none',
                  child: Text('No sorting'),
                ),
                DropdownMenuItem(
                  value: 'title',
                  child: Text('Name A-Z'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _sort = value ?? 'none';
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
              items: const [// mesma coisa do menu de escolhas, mas agora para categorias
                DropdownMenuItem(
                  value: 'all',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'soup',
                  child: Text('Soups'),
                ),
                DropdownMenuItem(
                  value: 'dessert',
                  child: Text('Desserts'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _category = value ?? 'all';
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: 
              ElevatedButton(//botao, mas se quiser pode so apertar o enter
                onPressed: _search,
                child: const Text('Search'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(// expande para o resto da tela
            child: state.isLoading// se estiver carregando vai mostrar um circulo girando
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null// houve erro? mostra a mensagem 
                    ? Center(child: Text(state.errorMessage!))
                    : ListView.builder( //nao houve erro? mostra a lista e cada receita 'e um item
                        itemCount: state.recipes.length,//quantidade de itens na lista
                        itemBuilder: (context, index) {//construtor de cada item da lista
                          final recipe = state.recipes[index];
                          return  Card(// caixa visual
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: ListTile(
                              onTap: (){// quando tocar no item, fara algo
                                Navigator.push(// abre uma nova janela
        context,
        MaterialPageRoute(//rota de navegacao, usa o visual do material design
          builder: (context) => RecipeDetailsPage(recipe: recipe), // va a pagina RecipeDetailsPage e leva as informacoes
        ),
      );
    }, //layout de cada item da lista
                              leading: recipe.image.isNotEmpty//lado esquerdo
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
            child: Image.network(//imagem da internet
              recipe.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          )
        : const Icon(Icons.restaurant),
    title: Text(recipe.title),
    subtitle: Text(//tempo de preparo
      recipe.readyInMinutes > 0
          ? '${recipe.readyInMinutes} min'
          : 'Time not provided',
    ),
  ),
);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}