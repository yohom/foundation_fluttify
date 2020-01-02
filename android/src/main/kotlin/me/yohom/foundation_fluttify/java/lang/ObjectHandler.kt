package me.yohom.foundation_fluttify.java.lang

import io.flutter.plugin.common.MethodChannel

fun ObjectHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        else -> methodResult.notImplemented()
    }
}