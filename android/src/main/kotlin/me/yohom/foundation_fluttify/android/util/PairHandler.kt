package me.yohom.foundation_fluttify.android.util

import android.util.Pair
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.__this__

fun PairHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.util.Pair::getFirst" -> {
            val pair: Pair<*, *> = rawArgs.__this__()

            methodResult.success(pair.first)
        }
        "android.util.Pair::getSecond" -> {
            val pair: Pair<*, *> = rawArgs.__this__()

            methodResult.success(pair.second)
        }
        else -> methodResult.notImplemented()
    }
}