class AllSurah {
  String? name;
  NameTranslations? nameTranslations;
  int? numberOfAyah;
  int? numberOfSurah;
  String? place;
  String? recitation;
  String? type;

  AllSurah(
      {this.name,
      this.nameTranslations,
      this.numberOfAyah,
      this.numberOfSurah,
      this.place,
      this.recitation,
      this.type});

  AllSurah.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameTranslations = json['name_translations'] != null
        ? new NameTranslations.fromJson(json['name_translations'])
        : null;
    numberOfAyah = json['number_of_ayah'];
    numberOfSurah = json['number_of_surah'];
    place = json['place'];
    recitation = json['recitation'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.nameTranslations != null) {
      data['name_translations'] = this.nameTranslations!.toJson();
    }
    data['number_of_ayah'] = this.numberOfAyah;
    data['number_of_surah'] = this.numberOfSurah;
    data['place'] = this.place;
    data['recitation'] = this.recitation;
    data['type'] = this.type;
    return data;
  }
}

class NameTranslations {
  String? ar;
  String? en;
  String? id;

  NameTranslations({this.ar, this.en, this.id});

  NameTranslations.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    data['id'] = this.id;
    return data;
  }
}
