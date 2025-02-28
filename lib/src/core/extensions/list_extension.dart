extension ListX<T> on List<T> {
  List<T> replaceWhere({
    required bool Function(T element) test,
    required T Function(T element) replace,
  }) {
    return map((element) => test(element) ? replace(element) : element).toList();
  }

  void replaceWhereInPlace({
    required bool Function(T element) test,
    required T Function(T element) replace,
  }) {
    for (var i = 0; i < length; i++) {
      if (test(this[i])) {
        this[i] = replace(this[i]);
      }
    }
  }
}