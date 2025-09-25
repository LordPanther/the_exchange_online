
extension DoubleExtensions on double {
  String toPrice() {
    return '\$${toStringAsFixed(2)}';
  }
}
