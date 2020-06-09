package me.yohom.foundation_fluttify.android.view

import io.flutter.plugin.common.MethodChannel

fun ViewHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        else -> methodResult.notImplemented()
    }
}