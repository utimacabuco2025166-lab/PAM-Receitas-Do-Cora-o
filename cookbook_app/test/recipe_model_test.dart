import 'package:flutter_test/flutter_test.dart';
import 'package:cookbook_app/features/recipes/data/models/recipe_model.dart';

void main() {
  test('RecipeModel.fromJson deve converter JSON corretamente', () {
    final json = {
      'id': 123,
      'title': 'Chicken Soup',
      'image': 'https://example.com/image.jpg',
      'readyInMinutes': 30,
      'servings': 4,
      'summary': '<b>Tasty soup</b>',
      'extendedIngredients': [
        {'original': '2 cups water'},
        {'original': '1 chicken breast'},
      ],
    };

    final model = RecipeModel.fromJson(json);

    expect(model.id, 123);
    expect(model.title, 'Chicken Soup');
    expect(model.image, 'https://example.com/image.jpg');
    expect(model.readyInMinutes, 30);
    expect(model.servings, 4);
    expect(model.summary, '<b>Tasty soup</b>');
    expect(model.ingredients.length, 2);
    expect(model.ingredients.first, '2 cups water');
  });
}