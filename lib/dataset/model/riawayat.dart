class RiwayatModels {
  final int id;
  final int isUser;
  final int idStat;
  final int jumlah;
  final String hal;
  final String username;
  final String nmBarang;
  final String instansi;
  final String tanggal;
  final String hasil;

  RiwayatModels({
    required this.id,
    required this.isUser,
    required this.idStat,
    required this.jumlah,
    required this.hal,
    required this.username,
    required this.nmBarang,
    required this.instansi,
    required this.tanggal,
    required this.hasil,
  });

  factory RiwayatModels.fromJson(Map<String, dynamic> json) {
    return RiwayatModels(
      isUser: int.tryParse(json['id_pengguna'].toString()) ?? 0,
      idStat: int.tryParse(json['id_status'].toString()) ?? 0,
      jumlah: int.tryParse(json['jumlah'].toString()) ?? 0,
      id: int.tryParse(json['id'].toString()) ?? 0,
      nmBarang: json['nama_barang'] ?? '',
      tanggal: json['tgl_kembali'] ?? '',
      username: json['username'] ?? '',
      instansi: json['instansi'] ?? '',
      hasil: json['hasil'] ?? '',
      hal: json['hal'] ?? '',
    );
  }
}
