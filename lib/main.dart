import 'package:flutter/material.dart';

import 'models/recipe.dart';

const Color _backgroundColor = Color(0xFFF5F1EC);
const Color _surfaceColor = Color(0xFFFFFCF8);
const Color _cardColor = Color(0xFFFFFEFC);
const Color _primaryColor = Color(0xFFC46A2D);
const Color _primaryDarkColor = Color(0xFF8B4820);
const Color _primarySoftColor = Color(0xFFF6E6D8);
const Color _textColor = Color(0xFF221C17);
const Color _mutedTextColor = Color(0xFF756A61);
const Color _borderColor = Color(0xFFE9DED2);
const Color _successColor = Color(0xFF739E62);
const Color _dangerColor = Color(0xFFD66A5A);
const Color _shadowColor = Color(0x140D0A07);

void main() {
  runApp(const SmartRecipeBookApp());
}

class SmartRecipeBookApp extends StatelessWidget {
  const SmartRecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        primary: _primaryColor,
        surface: _surfaceColor,
      ).copyWith(
        surface: _surfaceColor,
        onSurface: _textColor,
        onPrimary: Colors.white,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Recipe Book',
      theme: baseTheme.copyWith(
        scaffoldBackgroundColor: _backgroundColor,
        textTheme: baseTheme.textTheme.apply(
          bodyColor: _textColor,
          displayColor: _textColor,
        ).copyWith(
          headlineMedium: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.7,
            color: _textColor,
          ),
          titleLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
            color: _textColor,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            color: _textColor,
          ),
          bodyMedium: const TextStyle(
            fontSize: 15,
            height: 1.55,
            color: _textColor,
          ),
          bodySmall: const TextStyle(
            fontSize: 13,
            height: 1.45,
            color: _mutedTextColor,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: _textColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _cardColor,
          hintStyle: const TextStyle(color: _mutedTextColor),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: _borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: _primaryColor, width: 1.2),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: _borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _textColor,
          contentTextStyle: const TextStyle(color: Colors.white),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = const [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
    'Drinks',
    'Dessert',
  ];

  final TextEditingController _searchController = TextEditingController();
  int _selectedTabIndex = 0;
  String _selectedCategory = 'All';

  late final List<Recipe> _recipes = [
    Recipe(
      id: '1',
      title: 'Spaghetti',
      category: 'Dinner',
      description:
          'Classic spaghetti with a rich tomato sauce and a cozy homemade feel.',
      ingredients:
          '100g pasta\n1 cup tomato sauce\n1 tbsp olive oil\n1 clove garlic\nSalt and pepper\nGrated cheese',
      steps:
          '1. Boil pasta in salted water.\n2. Heat oil in a pan and saute garlic.\n3. Add tomato sauce and simmer.\n4. Mix pasta with sauce.\n5. Serve with grated cheese.',
      preparationTime: '20 min',
      difficulty: 'Medium',
      imageUrl:
          'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=1200&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '2',
      title: 'Pancake',
      category: 'Breakfast',
      description:
          'Soft golden pancakes that are beginner-friendly and quick to prepare.',
      ingredients:
          '1 cup flour\n1 egg\n3/4 cup milk\n1 tbsp sugar\n1 tsp baking powder\nButter',
      steps:
          '1. Mix dry ingredients.\n2. Add egg and milk.\n3. Whisk until smooth.\n4. Cook on a buttered pan.\n5. Flip once bubbles appear.',
      preparationTime: '15 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1528207776546-365bb710ee93?auto=format&fit=crop&w=1200&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '3',
      title: 'Chicken Salad',
      category: 'Lunch',
      description:
          'Fresh lunch salad with tender chicken, crisp greens, and a light finish.',
      ingredients:
          'Chicken breast\nLettuce\nCherry tomatoes\nCucumber\nOlive oil\nLemon juice',
      steps:
          '1. Grill chicken and slice it.\n2. Wash and chop vegetables.\n3. Mix dressing ingredients.\n4. Toss everything together.\n5. Serve immediately.',
      preparationTime: '25 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1546793665-c74683f339c1?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '4',
      title: 'Chocolate Cake',
      category: 'Snack',
      description:
          'Moist and rich chocolate cake for a sweet afternoon treat.',
      ingredients:
          'Flour\nCocoa powder\nEggs\nMilk\nSugar\nButter',
      steps:
          '1. Prepare the batter.\n2. Pour into a cake pan.\n3. Bake until set.\n4. Cool completely.\n5. Slice and enjoy.',
      preparationTime: '40 min',
      difficulty: 'Medium',
      imageUrl:
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=1200&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '5',
      title: 'Iced Coffee',
      category: 'Drinks',
      description:
          'Cool and smooth iced coffee for a fast refreshing boost.',
      ingredients:
          'Brewed coffee\nIce cubes\nMilk\nSugar',
      steps:
          '1. Brew coffee.\n2. Let it cool slightly.\n3. Add ice to a glass.\n4. Pour coffee and milk.\n5. Sweeten to taste.',
      preparationTime: '5 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '6',
      title: 'Menemen',
      category: 'Breakfast',
      description:
          'A warm Turkish breakfast dish with eggs, tomatoes, and peppers cooked together in one pan.',
      ingredients:
          '2 eggs\n2 tomatoes\n2 green peppers\n1 tbsp olive oil\nSalt\nBlack pepper',
      steps:
          '1. Chop tomatoes and peppers.\n2. Heat olive oil in a pan.\n3. Cook peppers, then add tomatoes.\n4. Season and simmer.\n5. Crack in eggs and cook gently.',
      preparationTime: '15 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '7',
      title: 'Avocado Toast',
      category: 'Breakfast',
      description:
          'Creamy avocado on crisp toasted bread with a fresh and simple modern breakfast feel.',
      ingredients:
          '2 slices bread\n1 ripe avocado\nLemon juice\nSalt\nBlack pepper\nChili flakes',
      steps:
          '1. Toast the bread.\n2. Mash avocado with lemon juice.\n3. Season to taste.\n4. Spread on toast.\n5. Finish with chili flakes.',
      preparationTime: '10 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '8',
      title: 'Tuna Sandwich',
      category: 'Lunch',
      description:
          'A quick lunch sandwich with creamy tuna filling, crisp lettuce, and soft bread.',
      ingredients:
          '2 slices bread\n1 can tuna\n1 tbsp mayonnaise\nLettuce\nSalt\nBlack pepper',
      steps:
          '1. Drain the tuna.\n2. Mix tuna with mayonnaise.\n3. Season lightly.\n4. Add lettuce to bread.\n5. Fill, close, and serve.',
      preparationTime: '10 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1521390188846-e2a3a97453a0?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '9',
      title: 'Beef Steak',
      category: 'Dinner',
      description:
          'Juicy pan-seared beef steak with a rich savory flavor and a satisfying dinner presentation.',
      ingredients:
          '1 beef steak\n1 tbsp olive oil\nSalt\nBlack pepper\nButter\nGarlic',
      steps:
          '1. Season the steak well.\n2. Heat oil in a skillet.\n3. Sear both sides until browned.\n4. Add butter and garlic.\n5. Rest before serving.',
      preparationTime: '25 min',
      difficulty: 'Medium',
      imageUrl:
          'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '10',
      title: 'Rice with Chicken',
      category: 'Dinner',
      description:
          'Comforting chicken and rice cooked with simple seasoning for an easy family-style meal.',
      ingredients:
          '1 cup rice\n1 chicken breast\n2 cups water\n1 tbsp oil\nSalt\nBlack pepper',
      steps:
          '1. Cut chicken into small pieces.\n2. Saute chicken in oil.\n3. Add rice and stir briefly.\n4. Pour in water and season.\n5. Cover and cook until tender.',
      preparationTime: '30 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '11',
      title: 'Baked Salmon',
      category: 'Dinner',
      description:
          'Tender oven-baked salmon with a clean, light flavor that feels elegant but still simple.',
      ingredients:
          '1 salmon fillet\n1 tbsp olive oil\nLemon\nSalt\nBlack pepper\nHerbs',
      steps:
          '1. Place salmon on a baking tray.\n2. Drizzle with oil and lemon.\n3. Season with herbs.\n4. Bake until flaky.\n5. Serve warm.',
      preparationTime: '25 min',
      difficulty: 'Medium',
      imageUrl:
          'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '12',
      title: 'Apple Pie',
      category: 'Dessert',
      description:
          'Classic apple pie with sweet cinnamon apples and a golden baked crust.',
      ingredients:
          'Pie dough\n2 apples\nSugar\nCinnamon\nButter\nFlour',
      steps:
          '1. Slice the apples.\n2. Mix with sugar and cinnamon.\n3. Fill the pie crust.\n4. Cover and seal.\n5. Bake until golden.',
      preparationTime: '50 min',
      difficulty: 'Medium',
      imageUrl:
          'https://images.unsplash.com/photo-1568571780765-9276ac8b75a2?auto=format&fit=crop&w=1200&q=80',
      isFavorite: true,
    ),
    Recipe(
      id: '13',
      title: 'Nachos',
      category: 'Snack',
      description:
          'Crunchy nachos layered with melted cheese and bold toppings for a fun sharing snack.',
      ingredients:
          'Tortilla chips\nCheddar cheese\nTomato\nJalapeno\nSour cream\nSalsa',
      steps:
          '1. Spread chips on a tray.\n2. Add cheese and toppings.\n3. Bake until cheese melts.\n4. Add sour cream.\n5. Serve immediately.',
      preparationTime: '15 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1513456852971-30c0b8199d4d?auto=format&fit=crop&w=1200&q=80',
    ),
    Recipe(
      id: '14',
      title: 'Quinoa Chicken Salad',
      category: 'Lunch',
      description:
          'A balanced lunch bowl with quinoa, chicken, and fresh vegetables for a light but filling meal.',
      ingredients:
          '1 cup cooked quinoa\n1 chicken breast\nCucumber\nTomato\nOlive oil\nLemon juice',
      steps:
          '1. Cook quinoa and let it cool.\n2. Grill and slice the chicken.\n3. Chop the vegetables.\n4. Mix dressing ingredients.\n5. Toss everything together.',
      preparationTime: '25 min',
      difficulty: 'Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=1200&q=80',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Recipe> get _filteredRecipes {
    final query = _searchController.text.trim().toLowerCase();

    return _recipes.where((recipe) {
      final matchesCategory =
          _selectedCategory == 'All' || recipe.category == _selectedCategory;
      final matchesQuery = query.isEmpty ||
          recipe.title.toLowerCase().contains(query) ||
          recipe.category.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  List<Recipe> get _favoriteRecipes =>
      _recipes.where((recipe) => recipe.isFavorite).toList();

  void _toggleFavorite(String recipeId) {
    final index = _recipes.indexWhere((recipe) => recipe.id == recipeId);
    if (index == -1) return;

    setState(() {
      _recipes[index].isFavorite = !_recipes[index].isFavorite;
    });
  }

  void _deleteRecipe(String recipeId) {
    final index = _recipes.indexWhere((recipe) => recipe.id == recipeId);
    if (index == -1) return;

    final deletedTitle = _recipes[index].title;
    setState(() {
      _recipes.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$deletedTitle deleted')),
    );
  }

  Future<void> _openRecipeDetails(Recipe recipe) async {
    final result = await Navigator.of(context).push<_RecipeActionResult>(
      MaterialPageRoute(
        builder: (context) => RecipeDetailsScreen(
          recipe: recipe,
          onToggleFavorite: () => _toggleFavorite(recipe.id),
        ),
      ),
    );

    if (result == _RecipeActionResult.deleted) {
      _deleteRecipe(recipe.id);
    } else if (result == _RecipeActionResult.editRequested) {
      final currentRecipe = _recipes.cast<Recipe?>().firstWhere(
            (item) => item?.id == recipe.id,
            orElse: () => null,
          );
      if (currentRecipe != null) {
        await _showRecipeForm(recipe: currentRecipe);
      }
    } else if (result == _RecipeActionResult.favoriteToggled) {
      setState(() {});
    }
  }

  Future<void> _showRecipeForm({Recipe? recipe}) async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(text: recipe?.title ?? '');
    final descriptionController =
        TextEditingController(text: recipe?.description ?? '');
    final ingredientsController =
        TextEditingController(text: recipe?.ingredients ?? '');
    final stepsController = TextEditingController(text: recipe?.steps ?? '');
    final timeController =
        TextEditingController(text: recipe?.preparationTime ?? '');
    String selectedCategory = recipe?.category ?? categories.first;
    String selectedDifficulty = recipe?.difficulty ?? 'Easy';

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          recipe == null ? 'Add Recipe' : 'Edit Recipe',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        _FormField(
                          controller: titleController,
                          label: 'Recipe Name',
                        ),
                        const SizedBox(height: 12),
                        _FormField(
                          controller: descriptionController,
                          label: 'Short Description',
                          maxLines: 2,
                        ),
                        const SizedBox(height: 12),
                        _DropdownField<String>(
                          label: 'Category',
                          value: selectedCategory,
                          items: categories,
                          onChanged: (value) {
                            if (value == null) return;
                            setModalState(() => selectedCategory = value);
                          },
                        ),
                        const SizedBox(height: 12),
                        _DropdownField<String>(
                          label: 'Difficulty',
                          value: selectedDifficulty,
                          items: const ['Easy', 'Medium', 'Hard'],
                          onChanged: (value) {
                            if (value == null) return;
                            setModalState(() => selectedDifficulty = value);
                          },
                        ),
                        const SizedBox(height: 12),
                        _FormField(
                          controller: timeController,
                          label: 'Preparation Time',
                        ),
                        const SizedBox(height: 12),
                        _FormField(
                          controller: ingredientsController,
                          label: 'Ingredients',
                          maxLines: 4,
                        ),
                        const SizedBox(height: 12),
                        _FormField(
                          controller: stepsController,
                          label: 'Recipe',
                          maxLines: 5,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: _primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;

                              setState(() {
                                final updatedRecipe = (recipe ??
                                        Recipe(
                                          id: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          title: '',
                                          category: selectedCategory,
                                          description: '',
                                          ingredients: '',
                                          steps: '',
                                          preparationTime: '',
                                          difficulty: selectedDifficulty,
                                          imageUrl:
                                              'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=1200&q=80',
                                        ))
                                    .copyWith(
                                  title: titleController.text.trim(),
                                  category: selectedCategory,
                                  description:
                                      descriptionController.text.trim(),
                                  ingredients:
                                      ingredientsController.text.trim(),
                                  steps: stepsController.text.trim(),
                                  preparationTime: timeController.text.trim(),
                                  difficulty: selectedDifficulty,
                                );

                                if (recipe == null) {
                                  _recipes.add(updatedRecipe);
                                } else {
                                  final recipeIndex = _recipes.indexWhere(
                                    (item) => item.id == recipe.id,
                                  );
                                  if (recipeIndex != -1) {
                                    _recipes[recipeIndex] = updatedRecipe;
                                  }
                                }
                              });

                              Navigator.of(modalContext).pop();
                            },
                            child: Text(
                              recipe == null
                                  ? 'Save Recipe'
                                  : 'Update Recipe',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    titleController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    timeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _HomeTab(
        searchController: _searchController,
        selectedCategory: _selectedCategory,
        onSearchChanged: (_) => setState(() {}),
        onCategorySelected: (category) {
          setState(() {
            _selectedCategory = category;
          });
        },
        categories: categories,
        recipes: _filteredRecipes,
        onRecipeTap: _openRecipeDetails,
      ),
      _FavoritesTab(
        recipes: _favoriteRecipes,
        onRecipeTap: _openRecipeDetails,
      ),
      _CategoriesTab(
        categories: categories,
        recipes: _recipes,
        onCategoryTap: (category) {
          setState(() {
            _selectedTabIndex = 0;
            _selectedCategory = category;
          });
        },
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[_selectedTabIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showRecipeForm(),
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: _cardColor.withOpacity(0.96),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: _borderColor),
          boxShadow: const [
            BoxShadow(
              color: _shadowColor,
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              selected: _selectedTabIndex == 0,
              onTap: () => setState(() => _selectedTabIndex = 0),
            ),
            _NavItem(
              icon: Icons.favorite_rounded,
              label: 'Favorites',
              selected: _selectedTabIndex == 1,
              onTap: () => setState(() => _selectedTabIndex = 1),
            ),
            _NavItem(
              icon: Icons.grid_view_rounded,
              label: 'Categories',
              selected: _selectedTabIndex == 2,
              onTap: () => setState(() => _selectedTabIndex = 2),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab({
    required this.searchController,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onCategorySelected,
    required this.categories,
    required this.recipes,
    required this.onRecipeTap,
  });

  final TextEditingController searchController;
  final String selectedCategory;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onCategorySelected;
  final List<String> categories;
  final List<Recipe> recipes;
  final ValueChanged<Recipe> onRecipeTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 120),
      children: [
        Row(
          children: [
            _RoundIconButton(
              icon: Icons.dashboard_customize_rounded,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Recipe Book',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: _primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Text(
                    'Curated home cooking collection',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _mutedTextColor,
                        ),
                  ),
                ],
              ),
            ),
            _RoundIconButton(
              icon: Icons.tune_rounded,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [_primaryDarkColor, _primaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: _shadowColor,
                blurRadius: 26,
                offset: Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cook with confidence',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Elegant recipes, organized categories, and quick access to your favorites in one refined kitchen workspace.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.86),
                    ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _HeroStat(
                      value: '${recipes.length}',
                      label: 'Recipes',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _HeroStat(
                      value: '${categories.length}',
                      label: 'Categories',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        TextField(
          controller: searchController,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search recipes...',
            prefixIcon:
                const Icon(Icons.search_rounded, color: _mutedTextColor),
            suffixIcon: const Icon(
              Icons.mic_none_rounded,
              color: _mutedTextColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            Text(
              'Browse all',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 84,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _CategoryChip(
                label: 'All',
                icon: Icons.apps_rounded,
                selected: selectedCategory == 'All',
                onTap: () => onCategorySelected('All'),
              ),
              for (final category in categories) ...[
                const SizedBox(width: 10),
                _CategoryChip(
                  label: category,
                  icon: _categoryIcon(category),
                  selected: selectedCategory == category,
                  onTap: () => onCategorySelected(category),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Recipes',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            Text(
              'Most relevant',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final recipe in recipes) ...[
          _RecipeListCard(
            recipe: recipe,
            onTap: () => onRecipeTap(recipe),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _FavoritesTab extends StatelessWidget {
  const _FavoritesTab({
    required this.recipes,
    required this.onRecipeTap,
  });

  final List<Recipe> recipes;
  final ValueChanged<Recipe> onRecipeTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 120),
      children: [
        Row(
          children: [
            _RoundIconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            Text(
              'Favorites',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Your saved recipes, ready whenever you need them.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        for (final recipe in recipes) ...[
          _RecipeListCard(
            recipe: recipe,
            onTap: () => onRecipeTap(recipe),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _CategoriesTab extends StatelessWidget {
  const _CategoriesTab({
    required this.categories,
    required this.recipes,
    required this.onCategoryTap,
  });

  final List<String> categories;
  final List<Recipe> recipes;
  final ValueChanged<String> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 120),
      children: [
        Row(
          children: [
            _RoundIconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Explore recipes by meal type and kitchen mood.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        for (final category in categories) ...[
          _CategoryListTile(
            label: category,
            count:
                recipes.where((recipe) => recipe.category == category).length,
            icon: _categoryIcon(category),
            onTap: () => onCategoryTap(category),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
    required this.onToggleFavorite,
  });

  final Recipe recipe;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
          children: [
            Row(
              children: [
                _RoundIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                const SizedBox(width: 44),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: _panelDecoration(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: AspectRatio(
                          aspectRatio: 16 / 11,
                          child: Image.network(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            onToggleFavorite();
                            Navigator.of(context)
                                .pop(_RecipeActionResult.favoriteToggled);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: _cardColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              recipe.isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: recipe.isFavorite
                                  ? _dangerColor
                                  : _mutedTextColor,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe.title,
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: _mutedTextColor,
                            height: 1.5,
                          ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _MiniTag(
                          label: recipe.category,
                          color: _primaryDarkColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _MiniTag(
                          label: recipe.preparationTime,
                          color: _primaryDarkColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _MiniTag(
                          label: recipe.difficulty,
                          color: _primaryDarkColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _DetailCard(
              title: 'Ingredients',
              content: recipe.ingredients,
              accent: _primaryColor,
            ),
            const SizedBox(height: 14),
            _DetailCard(
              title: 'Steps',
              content: recipe.steps,
              accent: _dangerColor,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: _surfaceColor,
                      foregroundColor: _primaryDarkColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(color: _borderColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(_RecipeActionResult.editRequested);
                    },
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('Edit'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: _primaryDarkColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(_RecipeActionResult.deleted);
                    },
                    icon: const Icon(Icons.delete_outline_rounded),
                    label: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _RecipeActionResult {
  deleted,
  favoriteToggled,
  editRequested,
}

class _RecipeListCard extends StatelessWidget {
  const _RecipeListCard({
    required this.recipe,
    required this.onTap,
  });

  final Recipe recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: _panelDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                recipe.imageUrl,
                width: 82,
                height: 82,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _primarySoftColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          recipe.category,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _primaryDarkColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _mutedTextColor,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _TinyInfo(
                        icon: Icons.schedule_rounded,
                        label: recipe.preparationTime,
                        color: _primaryDarkColor,
                      ),
                      const SizedBox(width: 12),
                      _TinyInfo(
                        icon: Icons.bar_chart_rounded,
                        label: recipe.difficulty,
                        color: _successColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Column(
                children: [
                  Icon(
                    recipe.isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: recipe.isFavorite ? _dangerColor : _mutedTextColor,
                    size: 18,
                  ),
                  const SizedBox(height: 18),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: _mutedTextColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? _primarySoftColor : _cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? _primaryColor : _borderColor,
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: _shadowColor,
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: selected ? _primaryColor : _surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 18,
                color: selected ? Colors.white : _primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: selected ? _primaryColor : _textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    height: 1.1,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryListTile extends StatelessWidget {
  const _CategoryListTile({
    required this.label,
    required this.count,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final int count;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: _panelDecoration(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _primarySoftColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, size: 18, color: _primaryDarkColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Text(
                    '$count recipes',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _mutedTextColor,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: _surfaceColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: _mutedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? _primarySoftColor : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: selected ? _primaryDarkColor : _mutedTextColor,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: selected ? _primaryDarkColor : _mutedTextColor,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    required this.title,
    required this.content,
    required this.accent,
  });

  final String title;
  final String content;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _panelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _textColor,
                  height: 1.7,
                ),
          ),
        ],
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _borderColor),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  const _HeroStat({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.78),
                ),
          ),
        ],
      ),
    );
  }
}

class _TinyInfo extends StatelessWidget {
  const _TinyInfo({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _borderColor),
          boxShadow: const [
            BoxShadow(
              color: _shadowColor,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(icon, size: 20, color: _textColor),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

BoxDecoration _panelDecoration() {
  return BoxDecoration(
    color: _cardColor,
    borderRadius: BorderRadius.circular(26),
    border: Border.all(color: _borderColor),
    boxShadow: const [
      BoxShadow(
        color: _shadowColor,
        blurRadius: 28,
        offset: Offset(0, 12),
      ),
    ],
  );
}

IconData _categoryIcon(String category) {
  switch (category) {
    case 'Breakfast':
      return Icons.free_breakfast_rounded;
    case 'Lunch':
      return Icons.lunch_dining_rounded;
    case 'Dinner':
      return Icons.dinner_dining_rounded;
    case 'Snack':
      return Icons.bakery_dining_rounded;
    case 'Drinks':
      return Icons.local_cafe_rounded;
    default:
      return Icons.restaurant_menu_rounded;
  }
}
