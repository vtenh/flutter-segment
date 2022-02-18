import 'dart:io';

import 'package:flutter_segment/src/segment_config.dart';
import 'package:flutter_segment/src/segment_default_options.dart';
import 'package:flutter_segment/src/segment_platform_interface.dart';

export 'package:flutter_segment/src/segment_default_options.dart';
export 'package:flutter_segment/src/segment_observer.dart';

class Segment {
  const Segment._();
  static SegmentPlatform get _segment => SegmentPlatform.instance;

  static Future<void> identify({
    String? userId,
    Map<String, dynamic>? traits,
    Map<String, dynamic>? options,
  }) {
    return _segment.identify(
      userId: userId,
      traits: traits ?? {},
      options: options ?? SegmentDefaultOptions.instance.options ?? {},
    );
  }

  static Future<void> config({
    required SegmentConfig options,
  }) {
    return _segment.config(
      options: options,
    );
  }

  static Future<void> track({
    required String eventName,
    Map<String, dynamic>? properties,
    Map<String, dynamic>? options,
  }) {
    return _segment.track(
      eventName: eventName,
      properties: properties ?? {},
      options: options ?? SegmentDefaultOptions.instance.options ?? {},
    );
  }

  static Future<void> screen({
    required String screenName,
    Map<String, dynamic>? properties,
    Map<String, dynamic>? options,
  }) {
    return _segment.screen(
      screenName: screenName,
      properties: properties ?? {},
      options: options ?? SegmentDefaultOptions.instance.options ?? {},
    );
  }

  static Future<void> group({
    required String groupId,
    Map<String, dynamic>? traits,
    Map<String, dynamic>? options,
  }) {
    return _segment.group(
      groupId: groupId,
      traits: traits ?? {},
      options: options ?? SegmentDefaultOptions.instance.options ?? {},
    );
  }

  static Future<void> alias({
    required String alias,
    Map<String, dynamic>? options,
  }) {
    return _segment.alias(
      alias: alias,
      options: options ?? SegmentDefaultOptions.instance.options ?? {},
    );
  }

  static Future<String?> get getAnonymousId {
    return _segment.getAnonymousId;
  }

  static Future<void> reset() {
    return _segment.reset();
  }

  static Future<void> disable() {
    return _segment.disable();
  }

  static Future<void> enable() {
    return _segment.enable();
  }

  static Future<void> flush() {
    return _segment.flush();
  }

  static Future<void> debug(bool enabled) {
    if (Platform.isAndroid) {
      throw Exception(
        'Debug flag cannot be dynamically set on Android.\n'
        'Add to AndroidManifest and avoid calling this method when Platform.isAndroid.',
      );
    }

    return _segment.debug(enabled);
  }

  static Future<void> setContext(Map<String, dynamic> context) {
    return _segment.setContext(context);
  }
}
