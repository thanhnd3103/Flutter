extension StringUtils on String{
  String toUpperCaseFirstChar() => this[0].toUpperCase() + substring(1, length);
}