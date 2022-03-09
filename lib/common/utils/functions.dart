class Funs {
  static String imageResize(
    String url, {
    double width = 300,
    double? maxHeight,
  }) {
    var crop = '';
    int _width = width.toInt();
    int? _maxHeight = maxHeight?.toInt();

    if (maxHeight != null) {
      crop = '/crop,h_$_maxHeight,g_center';
    }
    return url + '?x-oss-process=image/resize,w_$_width,m_lfit$crop';
  }
}
