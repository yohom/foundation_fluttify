//typedef NS_OPTIONS(NSUInteger, AVAudioSessionCategoryOptions)
//{
//	/* MixWithOthers is only valid with AVAudioSessionCategoryPlayAndRecord, AVAudioSessionCategoryPlayback, and  AVAudioSessionCategoryMultiRoute */
//	AVAudioSessionCategoryOptionMixWithOthers			= 0x1,
//	/* DuckOthers is only valid with AVAudioSessionCategoryAmbient, AVAudioSessionCategoryPlayAndRecord, AVAudioSessionCategoryPlayback, and AVAudioSessionCategoryMultiRoute */
//	AVAudioSessionCategoryOptionDuckOthers				= 0x2,
//	/* AllowBluetooth is only valid with AVAudioSessionCategoryRecord and AVAudioSessionCategoryPlayAndRecord */
//	AVAudioSessionCategoryOptionAllowBluetooth	API_UNAVAILABLE(tvos, watchos, macos) = 0x4,
//	/* DefaultToSpeaker is only valid with AVAudioSessionCategoryPlayAndRecord */
//	AVAudioSessionCategoryOptionDefaultToSpeaker API_UNAVAILABLE(tvos, watchos, macos) = 0x8,
//	/* InterruptSpokenAudioAndMixWithOthers is only valid with AVAudioSessionCategoryPlayAndRecord, AVAudioSessionCategoryPlayback, and AVAudioSessionCategoryMultiRoute */
//	AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers API_AVAILABLE(ios(9.0), watchos(2.0), tvos(9.0)) API_UNAVAILABLE(macos)  = 0x11,
//	/* AllowBluetoothA2DP is only valid with AVAudioSessionCategoryPlayAndRecord */
//	AVAudioSessionCategoryOptionAllowBluetoothA2DP API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0)) API_UNAVAILABLE(macos) = 0x20,
//	/* AllowAirPlay is only valid with AVAudioSessionCategoryPlayAndRecord */
//	AVAudioSessionCategoryOptionAllowAirPlay API_AVAILABLE(ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos, macos) = 0x40,
//};
enum AVAudioSessionCategoryOptions {
  AVAudioSessionCategoryOptionMixWithOthers,
  AVAudioSessionCategoryOptionDuckOthers,
  AVAudioSessionCategoryOptionAllowBluetooth,
  AVAudioSessionCategoryOptionDefaultToSpeaker,
  AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers,
  AVAudioSessionCategoryOptionAllowBluetoothA2DP,
  AVAudioSessionCategoryOptionAllowAirPlay
}
