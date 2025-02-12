//Validator Email
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email tidak boleh kosong';
  }
  final emailRegex =
      RegExp(r'^[a-zA-z0-9._%+-]+@[a-zA-z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Masukkan email yang valid';
  }
  return null;
}
//Validator Password
String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password tidak boleh kosong';
  }
  if (value.length < 6) {
    return 'Password minimal 6 karakter';
  }
  return null;
}
//Validator Tanggal
String? dateValidator(String? value){
  if (value == null || value.isEmpty) {
    return 'Tanggal tidak boleh kosong';
  }
  final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegex.hasMatch(value)) {
    return 'Input format dd/MM/yyyy';
  }
  return null;
}