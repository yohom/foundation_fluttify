package me.yohom.foundation_fluttify.android.os

import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun BundleHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.os.Bundle::create" -> {
            val target = Bundle()
            val hash = System.identityHashCode(Bundle())
            HEAP[hash] = target
            methodResult.success(hash)
        }
        "android.os.Bundle::putString" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val key = args["key"] as String
            val value = args["value"] as String

            val bundle = HEAP[refId] as Bundle

            bundle.putString(key, value)

            methodResult.success("success")
        }
        "android.os.Bundle::getString" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val key = args["key"] as String

            val bundle = HEAP[refId] as Bundle

            methodResult.success(bundle.getString(key))
        }
        else -> methodResult.notImplemented()
    }
}