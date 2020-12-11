package me.yohom.foundation_fluttify.android.os

import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.__this__
import me.yohom.foundation_fluttify.core.get

fun BundleHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.os.Bundle::create" -> {
            val target = Bundle()
            methodResult.success(target)
        }
        "android.os.Bundle::putString" -> {
            val key = rawArgs["key"] as String
            val value = rawArgs["value"] as String

            val bundle: Bundle = rawArgs.__this__()

            bundle.putString(key, value)

            methodResult.success("success")
        }
        "android.os.Bundle::putInt" -> {
            val key = rawArgs["key"] as String
            val value = rawArgs["value"] as String

            val bundle: Bundle = rawArgs.__this__()

            bundle.putInt(key, value)

            methodResult.success("success")
        }
        "android.os.Bundle::getString" -> {
            val key = rawArgs["key"] as String

            val bundle: Bundle = rawArgs.__this__()

            methodResult.success(bundle.getString(key))
        }
        "android.os.Bundle::getInt" -> {
            val key = rawArgs["key"] as String

            val bundle: Bundle = rawArgs.__this__()

            methodResult.success(bundle.getInt(key))
        }
        else -> methodResult.notImplemented()
    }
}