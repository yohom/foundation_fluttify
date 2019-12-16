package me.yohom.foundation_fluttify.android.app

import io.flutter.plugin.common.MethodChannel

fun PendingIntentHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        else -> methodResult.notImplemented()
    }
}