package me.yohom.foundation_fluttify.android.content

import io.flutter.plugin.common.MethodChannel

class IntentHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            else -> methodResult.notImplemented()
        }
    }
}