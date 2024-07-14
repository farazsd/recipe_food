class RecipeDetailsModel {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  // int? weightWatcherSmartPoints;
  // String? gaps;
  // int? aggregateLikes;
  // int? healthScore;
  // String? creditsText;
  // String? sourceName;
  // double? pricePerServing;
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  String? readyInMinutes;
  String? servings;
  // String? sourceUrl;
  String? image;
  // String? imageType;
  String? summary;
  // List<String>? dishTypes;
  String? instructions;
  List<AnalyzedInstructions>? analyzedInstructions;
  // double? spoonacularScore;
  // String? spoonacularSourceUrl;

  RecipeDetailsModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    // this.weightWatcherSmartPoints,
    // this.gaps,
    // this.aggregateLikes,
    // this.healthScore,
    // this.creditsText,
    // this.sourceName,
    // this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    // this.sourceUrl,
    this.image,
    // this.imageType,
    this.summary,
    // this.dishTypes,
    this.instructions,
    this.analyzedInstructions,
    // this.spoonacularScore,
    // this.spoonacularSourceUrl
  });

  RecipeDetailsModel.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    // weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    // gaps = json['gaps'];
    // aggregateLikes = json['aggregateLikes'];
    // healthScore = json['healthScore'];
    // creditsText = json['creditsText'];
    // sourceName = json['sourceName'];
    // pricePerServing = json['pricePerServing'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = <ExtendedIngredients>[];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients!.add(ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'].toString();
    servings = json['servings'].toString();
    // sourceUrl = json['sourceUrl'];
    image = json['image'];
    // imageType = json['imageType'];
    summary = json['summary'];
    // dishTypes = json['dishTypes'].cast<String>();
    instructions = json['instructions'];
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = <AnalyzedInstructions>[];
      json['analyzedInstructions'].forEach((v) {
        analyzedInstructions!.add(AnalyzedInstructions.fromJson(v));
      });
    }
    // spoonacularScore = json['spoonacularScore'];
    // spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vegetarian'] = vegetarian;
    data['vegan'] = vegan;
    data['glutenFree'] = glutenFree;
    data['dairyFree'] = dairyFree;
    data['veryHealthy'] = veryHealthy;
    data['cheap'] = cheap;
    data['veryPopular'] = veryPopular;
    data['sustainable'] = sustainable;
    data['lowFodmap'] = lowFodmap;
    // data['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    // data['gaps'] = gaps;
    // data['aggregateLikes'] = aggregateLikes;
    // data['healthScore'] = healthScore;
    // data['creditsText'] = creditsText;
    // data['sourceName'] = sourceName;
    // data['pricePerServing'] = pricePerServing;
    if (extendedIngredients != null) {
      data['extendedIngredients'] =
          extendedIngredients!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['title'] = title;
    data['readyInMinutes'] = readyInMinutes;
    data['servings'] = servings;
    // data['sourceUrl'] = sourceUrl;
    data['image'] = image;
    // data['imageType'] = imageType;
    data['summary'] = summary;
    // data['dishTypes'] = dishTypes;
    data['instructions'] = instructions;
    if (analyzedInstructions != null) {
      data['analyzedInstructions'] =
          analyzedInstructions!.map((v) => v.toJson()).toList();
    }
    // data['spoonacularScore'] = spoonacularScore;
    // data['spoonacularSourceUrl'] = spoonacularSourceUrl;
    return data;
  }
}

class ExtendedIngredients {
  int? id;
  String? aisle;
  // String? image;
  // String? consistency;
  String? name;
  // String? nameClean;
  // String? original;
  // String? originalName;
  // double? amount;
  String? unit;
  // List<String>? meta;
  // Measures? measures;

  ExtendedIngredients({
    this.id,
    this.aisle,
    // this.image,
    // this.consistency,
    this.name,
    // this.nameClean,
    // this.original,
    // this.originalName,
    // this.amount,
    this.unit,
    // this.meta,
    // this.measures
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aisle = json['aisle'];
    // image = json['image'];
    // consistency = json['consistency'];
    name = json['name'];
    // nameClean = json['nameClean'];
    // original = json['original'];
    // originalName = json['originalName'];
    // amount = json['amount'];
    unit = json['unit'];
    // meta = json['meta'].cast<String>();
    // measures =
    //     json['measures'] != null ? Measures.fromJson(json['measures']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['aisle'] = aisle;
    // data['image'] = image;
    // data['consistency'] = consistency;
    data['name'] = name;
    // data['nameClean'] = nameClean;
    // data['original'] = original;
    // data['originalName'] = originalName;
    // data['amount'] = amount;
    data['unit'] = unit;
    // data['meta'] = meta;
    // if (measures != null) {
    //   data['measures'] = measures!.toJson();
    // }
    return data;
  }
}

class Measures {
  Us? us;
  Metric? metric;

  Measures({this.us, this.metric});

  Measures.fromJson(Map<String, dynamic> json) {
    us = json['us'] != null ? Us.fromJson(json['us']) : null;
    metric = json['metric'] != null ? Metric.fromJson(json['metric']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (us != null) {
      data['us'] = us!.toJson();
    }
    if (metric != null) {
      data['metric'] = metric!.toJson();
    }
    return data;
  }
}

class Us {
  double? amount;
  String? unitShort;
  String? unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  Us.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['unitShort'] = unitShort;
    data['unitLong'] = unitLong;
    return data;
  }
}

class Metric {
  int? amount;
  String? unitShort;
  String? unitLong;

  Metric({this.amount, this.unitShort, this.unitLong});

  Metric.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['unitShort'] = unitShort;
    data['unitLong'] = unitLong;
    return data;
  }
}

class AnalyzedInstructions {
  String? name;
  List<Steps>? steps;

  AnalyzedInstructions({this.name, this.steps});

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  Length? length;

  Steps({this.number, this.step, this.ingredients, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    length = json['length'] != null ? Length.fromJson(json['length']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['step'] = step;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    if (length != null) {
      data['length'] = length!.toJson();
    }
    return data;
  }
}

class Ingredients {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Ingredients({this.id, this.name, this.localizedName, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['localizedName'] = localizedName;
    data['image'] = image;
    return data;
  }
}

class Length {
  int? number;
  String? unit;

  Length({this.number, this.unit});

  Length.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['unit'] = unit;
    return data;
  }
}
