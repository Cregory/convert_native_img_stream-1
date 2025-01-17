import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:convert_native_img_stream/convert_native_img_stream_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelConvertNativeImgStream platform = MethodChannelConvertNativeImgStream();
  const MethodChannel channel = MethodChannel('convert_native_img_stream');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
