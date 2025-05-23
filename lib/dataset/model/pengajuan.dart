class PengajuanModels {
  final int id;
  final int idPengguna;
  final String kode;
  final String username;
  final String instansi;
  final String hal;
  final String namaBarang;
  final int jumlah;
  final String tglKembali;

  PengajuanModels({
    required this.id,
    required this.idPengguna,
    required this.kode,
    required this.username,
    required this.instansi,
    required this.hal,
    required this.namaBarang,
    required this.jumlah,
    required this.tglKembali,
  });

  factory PengajuanModels.fromJson(Map<String, dynamic> json) {
    return PengajuanModels(
      id: int.tryParse(json['id'].toString()) ?? 0,
      idPengguna: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      kode: json['kode'] ?? '',
      username: json['username'] ?? '',
      instansi: json['instansi'] ?? '',
      hal: json['hal'] ?? '',
      namaBarang: json['nama_barang'] ?? '',
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      tglKembali: json['tgl_kembali'] ?? '',
    );
  }
}
