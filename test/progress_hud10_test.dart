import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
 

void main() {
  const MethodChannel channel = MethodChannel('progress_hud10');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

   
}