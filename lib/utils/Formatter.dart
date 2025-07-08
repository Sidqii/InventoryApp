import 'package:intl/intl.dart';

final _currencyFormat = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp. ',
  decimalDigits: 2,
);

String formatCurrency(dynamic value, {bool isCurrency = false}) {
  if (isCurrency) {
    double numValue = double.tryParse(value.toString()) ?? 0;
    return _currencyFormat.format(numValue);
  }
  return value.toString();
}

String toTitleCase(String txt) {
  return txt.replaceAll('_', ' ').split(' ').map((text) {
    return text.isEmpty
        ? ''
        : text[0].toUpperCase() + text.substring(1).toLowerCase();
  }).join();
}

String getRole(int idRole) {
  switch (idRole) {
    case 1:
      return 'Operator';
    case 2:
      return 'Staff';
    default:
      return 'Halo';
  }
}
