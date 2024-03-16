class Doa {
  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  Doa({this.id, this.doa, this.ayat, this.latin, this.artinya});

  Doa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doa = json['doa'];
    ayat = json['ayat'];
    latin = json['latin'];
    artinya = json['artinya'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doa'] = this.doa;
    data['ayat'] = this.ayat;
    data['latin'] = this.latin;
    data['artinya'] = this.artinya;
    return data;
  }
}

//////////////////////////////////////////////////
class Sholat {
  String? imsyak;
  String? shubuh;
  String? dzuhur;
  String? tanggal;
  String? terbit;
  String? magrib;
  String? isya;
  String? dhuha;
  String? ashr;

  Sholat(
      {this.imsyak,
      this.shubuh,
      this.dzuhur,
      this.tanggal,
      this.terbit,
      this.magrib,
      this.isya,
      this.dhuha,
      this.ashr});

  Sholat.fromJson(Map<String, dynamic> json) {
    imsyak = json['imsyak'];
    shubuh = json['shubuh'];
    dzuhur = json['dzuhur'];
    tanggal = json['tanggal'];
    terbit = json['terbit'];
    magrib = json['magrib'];
    isya = json['isya'];
    dhuha = json['dhuha'];
    ashr = json['ashr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imsyak'] = this.imsyak;
    data['shubuh'] = this.shubuh;
    data['dzuhur'] = this.dzuhur;
    data['tanggal'] = this.tanggal;
    data['terbit'] = this.terbit;
    data['magrib'] = this.magrib;
    data['isya'] = this.isya;
    data['dhuha'] = this.dhuha;
    data['ashr'] = this.ashr;
    return data;
  }
}
