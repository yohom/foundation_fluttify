package me.yohom.foundation_fluttify.android.os

import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun BundleHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        "android.os.Bundle::create" -> {
            methodResult.success(Bundle().apply { HEAP[hashCode()] = this }.hashCode())
        }
        else -> methodResult.notImplemented()
    }
}