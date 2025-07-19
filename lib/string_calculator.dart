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

    final nums = parts.map(int.parse).toList();
    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw FormatException('negative numbers not allowed: ${negatives.join(',')}');
    }
    return nums.reduce((a, b) => a + b);
  }
}
