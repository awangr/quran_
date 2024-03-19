class AllSurah {
  int? number;
  int? numberOfAyahs;
  String? name;
  String? translation;
  String? revelation;
  String? description;
  String? audio;
  String? condition;

  AllSurah(
      {this.number,
      this.numberOfAyahs,
      this.name,
      this.translation,
      this.revelation,
      this.description,
      this.audio,
      this.condition = 'stop'});

  AllSurah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberOfAyahs = json['numberOfAyahs'];
    name = json['name'];
    translation = json['translation'];
    revelation = json['revelation'];
    description = json['description'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['numberOfAyahs'] = this.numberOfAyahs;
    data['name'] = this.name;
    data['translation'] = this.translation;
    data['revelation'] = this.revelation;
    data['description'] = this.description;
    data['audio'] = this.audio;
    data['condition'] = this.condition;
    return data;
  }
}
