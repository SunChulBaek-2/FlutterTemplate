import 'package:injectable/injectable.dart';

@injectable
abstract class StateXBase {
  StateXBase({
    required this.value,
  });

  final int value;

  bool get isLoading => value == 0;
  bool get isError => value == 1;
  bool get isSuccess => value == 2;

  @factoryMethod
  factory StateXBase.from() => StateXLoading();
}

class StateXLoading extends StateXBase {
  StateXLoading() : super(value: 0);
}

class StateXError extends StateXBase {
  StateXError() : super(value: 1);
}

class StateX<T> extends StateXBase {
  StateX({
    required this.data,
  }) : super(value: 2);

  final T data;
}