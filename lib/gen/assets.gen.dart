/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/reload.svg
  SvgGenImage get reload => const SvgGenImage('assets/images/reload.svg');

  /// File path: assets/images/wifi_1.svg
  SvgGenImage get wifi1 => const SvgGenImage('assets/images/wifi_1.svg');

  /// File path: assets/images/wifi_1_lock.svg
  SvgGenImage get wifi1Lock =>
      const SvgGenImage('assets/images/wifi_1_lock.svg');

  /// File path: assets/images/wifi_2.svg
  SvgGenImage get wifi2 => const SvgGenImage('assets/images/wifi_2.svg');

  /// File path: assets/images/wifi_2_lock.svg
  SvgGenImage get wifi2Lock =>
      const SvgGenImage('assets/images/wifi_2_lock.svg');

  /// File path: assets/images/wifi_3.svg
  SvgGenImage get wifi3 => const SvgGenImage('assets/images/wifi_3.svg');

  /// File path: assets/images/wifi_3_lock.svg
  SvgGenImage get wifi3Lock =>
      const SvgGenImage('assets/images/wifi_3_lock.svg');

  /// File path: assets/images/wifi_4.svg
  SvgGenImage get wifi4 => const SvgGenImage('assets/images/wifi_4.svg');

  /// File path: assets/images/wifi_4_lock.svg
  SvgGenImage get wifi4Lock =>
      const SvgGenImage('assets/images/wifi_4_lock.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        logo,
        reload,
        wifi1,
        wifi1Lock,
        wifi2,
        wifi2Lock,
        wifi3,
        wifi3Lock,
        wifi4,
        wifi4Lock
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
