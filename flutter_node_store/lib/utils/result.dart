class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  const Result._(this.data, this.error, this.isSuccess);

  factory Result.success(T data) =>
      Result._(data, null, true);
  factory Result.error(String error) =>
      Result._(null, error, false);

  bool get isError => !isSuccess;
  String get errorMessage => error ?? 'Unknown error';
}
