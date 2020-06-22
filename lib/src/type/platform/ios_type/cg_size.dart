import 'package:foundation_fluttify/foundation_fluttify.dart';

class CGSize extends Ref {
  Future<double> get width {
    return kMethodChannel.invokeMethod('CGSize::getWidth', {'refId': refId});
  }

  Future<double> get height {
    return kMethodChannel.invokeMethod('CGSize::getHeight', {'refId': refId});
  }
}
