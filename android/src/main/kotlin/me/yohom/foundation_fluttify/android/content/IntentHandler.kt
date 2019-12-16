package me.yohom.foundation_fluttify.android.content

import io.flutter.plugin.common.MethodChannel

fun IntentHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        else -> methodResult.notImplemented()
    }
}