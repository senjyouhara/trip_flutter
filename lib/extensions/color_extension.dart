
import 'dart:math';
import 'dart:ui';

extension ColorExtension on Color {
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // 创建随机颜色
  Color get random {
    return Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1.0,
    );
  }

  // 将颜色转换为十六进制字符串
  String toHex() {
    return '#${toARGB32().toRadixString(16).padLeft(8, '0')}';
  }
}