package me.yohom.foundation_fluttify.android.content

import android.content.Intent
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun IntentHandler(method: String, args: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.Intent::getBundle" -> {
            val refId = (args as Map<String, Any>)["refId"] as Int
            val intent = HEAP[refId] as Intent

            val bundle = intent.extras ?: Bundle.EMPTY

            val result: MutableMap<String, java.io.Serializable?> = mutableMapOf()
            for (key in bundle.keySet()) {
                when (val value = bundle.getSerializable(key)) {
                    is Number, is String, is List<*>, is Map<*, *> -> result[key] = value
                    else -> {
                        HEAP[System.identityHashCode(value)] = value!!
                        result[key] = System.identityHashCode(value)
                    }
                }
            }

            methodResult.success(result)
        }
        "android.content.Intent::getAction" -> {
            val refId = (args as Map<String, Any>)["refId"] as Int
            val intent = HEAP[refId] as Intent

            val action = intent.action

            methodResult.success(action)
        }
        else -> methodResult.notImplemented()
    }
}