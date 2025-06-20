import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconImageProvider extends ImageProvider<IconImageProvider> {
  final IconData icon;
  final double scale;
  final int size;
  final Color color;

  IconImageProvider(this.icon, {this.scale = 1.0, this.size = 48, this.color = Colors.white});

  @override
  Future<IconImageProvider> obtainKey(ImageConfiguration configuration) => SynchronousFuture<IconImageProvider>(this);

  @override
  ImageStreamCompleter load(IconImageProvider key, Future<ui.Codec> Function(Uint8List, {bool? allowUpscaling}) decode) => OneFrameImageStreamCompleter(_loadAsync(key));

  Future<ImageInfo> _loadAsync(IconImageProvider key) async {
    assert(key == this);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.scale(scale, scale);
    final textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: size.toDouble(),
        fontFamily: icon.fontFamily,
        color: color,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);
    final image = await recorder.endRecording().toImage(size, size);
    return ImageInfo(image: image, scale: key.scale);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final IconImageProvider typedOther = other;
    return icon == typedOther.icon && scale == typedOther.scale && size == typedOther.size && color == typedOther.color;
  }

  @override
  int get hashCode => Object.hash(icon, scale, size, color);

  @override
  String toString() => '$runtimeType(${describeIdentity(icon)}, scale: $scale, size: $size, color: $color)';
}