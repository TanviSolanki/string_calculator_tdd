class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    if (numbers.startsWith('//')) {
      final delimiterLineEnd = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterLineEnd);
      numbers = numbers.substring(delimiterLineEnd + 1);
    }

    final normalized = numbers.replaceAll('\n', delimiter == ',' ? ',' : '\n');
    final parts = normalized.split(RegExp('[,\n$delimiter]')).where((e) => e.isNotEmpty);
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
