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

            val bundle = intent.extras?: Bundle.EMPTY

            // bundle转为map 暂时不考虑非jsonable的类型, 一律认为可以直接传递
            val result: MutableMap<String, java.io.Serializable?> = mutableMapOf()
            for (key in bundle.keySet()) {
                result[key] = bundle.getSerializable(key)
            }

            methodResult.success(result)
        }
        else -> methodResult.notImplemented()
    }
}