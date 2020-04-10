package me.yohom.foundation_fluttify.android.app

import io.flutter.plugin.common.MethodChannel

fun PendingIntentHandler(method: String, args: Any, methodResult: MethodChannel.Result) {
    when (method) {
        else -> methodResult.notImplemented()
    }
}