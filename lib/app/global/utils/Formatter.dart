import 'package:intl/intl.dart';

final _currencyFormat = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp. ',
  decimalDigits: 2,
);

class Formatter {
  static String formatCurrency(dynamic value, {bool isCurrency = false}) {
    if (isCurrency) {
      double numValue = double.tryParse(value.toString()) ?? 0;
      return _currencyFormat.format(numValue);
    }
    return value.toString();
  }

  static String toTitleCase(String txt) {
    return txt
        .replaceAll('_', ' ')
        .split(' ')
        .map((text) {
          return text.isEmpty
              ? ''
              : text[0].toUpperCase() + text.substring(1).toLowerCase();
        })
        .join(' ');
  }

  static String getRole(int idRole) {
    switch (idRole) {
      case 1:
        return 'Operator';
      case 2:
        return 'Staff';
      default:
        return 'Halo';
    }
  }

  static String GetStatus(int id) {
    switch (id) {
      case 1:
        return 'Tersedia';
      case 2:
        return 'Dipinjam';
      case 3:
        return 'Rusak';
      default:
        return 'Tidak Diketahui';
    }
  }

  static String GetLokasi(int id) {
    switch (id) {
      case 1:
        return 'Gudang A';
      case 2:
        return 'Gudang B';
      default:
        return 'Lokasi Tidak Dikenal';
    }
  }

  static String dateID(String isoDate) {
    try {
      if (isoDate.isEmpty) return '-';
      final dt = DateTime.parse(isoDate);
      return DateFormat('dd MMMM yyyy', 'id_ID').format(dt);
    } catch (e) {
      return '-';
    }
  }
}
