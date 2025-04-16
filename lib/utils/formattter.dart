import 'package:intl/intl.dart';

String formatValue(dynamic value, {bool isCurrency = false}) {
  if (isCurrency) {
    double numValue = double.tryParse(value.toString()) ?? 0;
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 2,
    ).format(numValue);
  }
  return value.toString();
}
