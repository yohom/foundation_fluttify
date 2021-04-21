import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

Map<String, Uint8List> _cache = {};

extension ImageProviderX on ImageProvider {
  Future<Uint8List> toImageData(ImageConfiguration config) async {
    final completer = Completer<Uint8List>();
    final key = await obtainKey(config);
    if (_cache.containsKey(key.toString())) {
      debugPrint('命中缓存');
      completer.complete(_cache[key.toString()]);
    } else {
      late ImageStreamListener listener;
      ImageStream stream = resolve(config); //获取图片流
      listener = ImageStreamListener((imageInfo, sync) async {
        final byteData =
            await imageInfo.image.toByteData(format: ImageByteFormat.png);
        final result = byteData?.buffer.asUint8List();
        if (result != null) {
          _cache[key.toString()] = result;
        }

        if (!completer.isCompleted) completer.complete(result);

        stream.removeListener(listener); //移除监听
      });
      stream.addListener(listener);
    }

    return completer.future;
  }
}
