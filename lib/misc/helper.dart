import 'package:rxdart/rxdart.dart';

class Helper {
  static reset(List<Subject> sb) {
    sb.forEach((element) {
      element.drain();
      element.close();
    });
  }
}
