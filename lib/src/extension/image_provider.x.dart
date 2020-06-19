import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

Map<String, Uint8List> _cache = {};

extension ImageProviderX on ImageProvider {
  Future<Uint8List> toImageData(ImageConfiguration config) async {
    final completer = Completer<Uint8List>();
    final key = this.obtainKey(config);
    if (_cache.containsKey(key.toString())) {
      debugPrint('命中缓存');
      completer.complete(_cache[key.toString()]);
    } else {
      this
          .resolve(config)
          .addListener(ImageStreamListener((imageInfo, sync) async {
        final byteData =
            await imageInfo.image.toByteData(format: ImageByteFormat.png);
        final result = byteData.buffer.asUint8List();
        _cache[key.toString()] = result;
        completer.complete(result);
      }));
    }

    return completer.future;
  }
}
