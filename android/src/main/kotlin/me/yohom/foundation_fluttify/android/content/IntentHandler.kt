package me.yohom.foundation_fluttify.android.content

import android.content.Intent
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.__this__

fun IntentHandler(method: String, args: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.Intent::getBundle" -> {
            val intent: Intent = args.__this__()

            val bundle = intent.extras ?: Bundle.EMPTY

            val result: MutableMap<String, java.io.Serializable?> = mutableMapOf()
            for (key in bundle.keySet()) {
                result[key] = bundle.getSerializable(key)
            }

            methodResult.success(result)
        }
        "android.content.Intent::getAction" -> {
            val intent: Intent = args.__this__()

            val action = intent.action

            methodResult.success(action)
        }
        else -> methodResult.notImplemented()
    }
}