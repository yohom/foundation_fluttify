package me.yohom.foundation_fluttify.android.os

import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun BundleHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        "android.os.Bundle::create" -> {
            val target = Bundle()
            val hash = System.identityHashCode(Bundle())
            HEAP[hash] = target
            methodResult.success(hash)
        }
        else -> methodResult.notImplemented()
    }
}