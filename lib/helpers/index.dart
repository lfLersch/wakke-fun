import 'package:mobx/mobx.dart';

part 'index.g.dart';

// ignore: library_private_types_in_public_api
class Index = _Index with _$Index;

abstract class _Index with Store {
  @observable
  int value = 0;

  @action
  void setValue(int value) {
    this.value = value;
  }
}