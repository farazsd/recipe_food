class SearchByIngredientsModel {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<MissedIngredients>? missedIngredients;
  List<UsedIngredients>? usedIngredients;
  int? likes;

  SearchByIngredientsModel(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.usedIngredientCount,
      this.missedIngredientCount,
      this.missedIngredients,
      this.usedIngredients,
      this.likes});

  SearchByIngredientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    usedIngredientCount = json['usedIngredientCount'];
    missedIngredientCount = json['missedIngredientCount'];
    if (json['missedIngredients'] != null) {
      missedIngredients = <MissedIngredients>[];
      json['missedIngredients'].forEach((v) {
        missedIngredients!.add(MissedIngredients.fromJson(v));
      });
    }
    if (json['usedIngredients'] != null) {
      usedIngredients = <UsedIngredients>[];
      json['usedIngredients'].forEach((v) {
        usedIngredients!.add(UsedIngredients.fromJson(v));
      });
    }
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['imageType'] = imageType;
    data['usedIngredientCount'] = usedIngredientCount;
    data['missedIngredientCount'] = missedIngredientCount;
    if (missedIngredients != null) {
      data['missedIngredients'] =
          missedIngredients!.map((v) => v.toJson()).toList();
    }
    if (usedIngredients != null) {
      data['usedIngredients'] =
          usedIngredients!.map((v) => v.toJson()).toList();
    }
    data['likes'] = likes;
    return data;
  }
}

class MissedIngredients {
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? extendedName;
  String? image;

  MissedIngredients(
      {this.id,
      this.amount,
      this.unit,
      this.unitLong,
      this.unitShort,
      this.aisle,
      this.name,
      this.original,
      this.originalName,
      this.meta,
      this.extendedName,
      this.image});

  MissedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    meta = json['meta'].cast<String>();
    extendedName = json['extendedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['unit'] = unit;
    data['unitLong'] = unitLong;
    data['unitShort'] = unitShort;
    data['aisle'] = aisle;
    data['name'] = name;
    data['original'] = original;
    data['originalName'] = originalName;
    data['meta'] = meta;
    data['extendedName'] = extendedName;
    data['image'] = image;
    return data;
  }
}

class UsedIngredients {
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? image;

  UsedIngredients(
      {this.id,
      this.amount,
      this.unit,
      this.unitLong,
      this.unitShort,
      this.aisle,
      this.name,
      this.original,
      this.originalName,
      this.meta,
      this.image});

  UsedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    meta = json['meta'].cast<String>();
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['unit'] = unit;
    data['unitLong'] = unitLong;
    data['unitShort'] = unitShort;
    data['aisle'] = aisle;
    data['name'] = name;
    data['original'] = original;
    data['originalName'] = originalName;
    data['meta'] = meta;
    data['image'] = image;
    return data;
  }
}
