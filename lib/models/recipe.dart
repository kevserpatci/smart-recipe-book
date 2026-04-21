class Recipe {
  final String id;
  final String title;
  final String category;
  final String description;
  final String ingredients;
  final String steps;
  final String preparationTime;
  final String difficulty;
  final String imageUrl;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.preparationTime,
    required this.difficulty,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Recipe copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    String? ingredients,
    String? steps,
    String? preparationTime,
    String? difficulty,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      preparationTime: preparationTime ?? this.preparationTime,
      difficulty: difficulty ?? this.difficulty,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
