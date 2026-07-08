import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/recipe_state.dart';
import 'recipe_providers.dart'; 
import '../../domain/usecases/search_recipes.dart';

part 'recipe_notifier.g.dart';


@riverpod
class RecipeNotifier extends _$RecipeNotifier {
  @override
  RecipeState build() {
    return RecipeState.initial();
  }

  Future<void> search(  { required String query,
    required String sort,
    required String category,
    }) async //Essa função é responsável por buscar receitas com base em uma consulta fornecida. Ela atualiza o estado para indicar que a busca está em andamento, realiza a busca usando o caso de uso SearchRecipes, e atualiza o estado com os resultados ou uma mensagem de erro, se houver.
  {
  state = state.copyWith(isLoading: true, errorMessage: null);

  try {//pegar o repositório de receitas usando o provider recipeRepositoryProvider. Isso permite que o notifier acesse os métodos do repositório para buscar receitas.
    final repository = ref.read(recipeRepositoryProvider);
    final useCase = SearchRecipes(repository);

    final results = await useCase(
      query: query,
      sort: sort,
      category: category,
      );

    state = state.copyWith(isLoading: false, recipes:results); //Atualiza o estado para indicar que a busca foi concluída e armazena os resultados obtidos na lista de receitas.



  } catch (e) {// tentou e se der errado:
  state = state.copyWith( isLoading: false, errorMessage: 'Não foi possível encontrar receitas: $e'); //Atualiza o estado para indicar que a busca foi concluída, mas ocorreu um erro. A mensagem de erro é armazenada no estado para que possa ser exibida na interface do usuário.
  }
  }
  
  
}  