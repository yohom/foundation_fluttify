package me.yohom.foundation_fluttify.android.app

import io.flutter.plugin.common.MethodChannel

class PendingIntentHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            else -> methodResult.notImplemented()
        }
    }
}