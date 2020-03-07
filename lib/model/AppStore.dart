
import 'package:education/model/store/CategoryStore.dart';

class AppStore {

  static AppStore _singleton = new AppStore._();

  factory AppStore() => _singleton;

  AppStore._();

  CategoryStore categoryStore = CategoryStore(null);

  init() {
    categoryStore.init();
  }
}
