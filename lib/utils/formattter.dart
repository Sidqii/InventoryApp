import 'package:intl/intl.dart';

final _currencyFormat = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp. ',
  decimalDigits: 2,
);

String formatValue(dynamic value, {bool isCurrency = false}) {
  if (isCurrency) {
    double numValue = double.tryParse(value.toString()) ?? 0;
    return _currencyFormat.format(numValue);
  }
  return value.toString();
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
