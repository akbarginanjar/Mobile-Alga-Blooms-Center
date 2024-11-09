class NilaiIndex {
  int? id;
  int? idPengaturan;
  String? tanggal;
  String? waktu;
  double? nilai;
  String? createdAt;
  String? updatedAt;
  Pengaturan? pengaturan;

  NilaiIndex(
      {this.id,
      this.idPengaturan,
      this.tanggal,
      this.waktu,
      this.nilai,
      this.createdAt,
      this.updatedAt,
      this.pengaturan});

  NilaiIndex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPengaturan = json['id_pengaturan'];
    tanggal = json['tanggal'];
    waktu = json['waktu'];
    nilai = json['nilai'] is int
        ? (json['nilai'] as int).toDouble()
        : json['nilai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pengaturan = json['pengaturan'] != null
        ? Pengaturan.fromJson(json['pengaturan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_pengaturan'] = idPengaturan;
    data['tanggal'] = tanggal;
    data['waktu'] = waktu;
    data['nilai'] = nilai;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pengaturan != null) {
      data['pengaturan'] = pengaturan!.toJson();
    }
    return data;
  }
}

class Pengaturan {
  int? id;
  double? nilaiAwal;
  double? nilaiAkhir;
  String? warna;
  String? kodeWarna;
  String? keterangan;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;

  Pengaturan(
      {this.id,
      this.nilaiAwal,
      this.nilaiAkhir,
      this.warna,
      this.kodeWarna,
      this.keterangan,
      this.deskripsi,
      this.createdAt,
      this.updatedAt});

  Pengaturan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nilaiAwal = json['nilai_awal'] is int
        ? (json['nilai_awal'] as int).toDouble()
        : json['nilai_awal'];
    nilaiAkhir = json['nilai_akhir'] is int
        ? (json['nilai_akhir'] as int).toDouble()
        : json['nilai_akhir'];
    warna = json['warna'];
    kodeWarna = json['kode_warna'];
    keterangan = json['keterangan'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nilai_awal'] = nilaiAwal;
    data['nilai_akhir'] = nilaiAkhir;
    data['warna'] = warna;
    data['kode_warna'] = kodeWarna;
    data['keterangan'] = keterangan;
    data['deskripsi'] = deskripsi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
