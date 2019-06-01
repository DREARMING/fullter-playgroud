import 'dart:math';

void main(List<String> args) {
  final random = Random();
  final Set<int> cache = Set();
  for (var i = 0; i < 100; i++) {
    final r = random.nextInt(100);
    if (cache.contains(r)) {
      print("Had genrate $r");
    }
    cache.add(r);
  }
  final a = cache.toList();
  a.sort();
  print(a);
}
