package me.yohom.foundation_fluttify.android.util

import android.util.Pair
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.jsonable

class PairHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            // android.util.Pair first
            "android.util.Pair::getFirst" -> {
                val refId = args["refId"] as Int
                val pair = HEAP[refId] as Pair<*, *>

                if (pair.first.jsonable()) {
                    methodResult.success(pair.first)
                } else {
                    methodResult.success(pair.first?.hashCode())
                }
            }
            // android.util.Pair second
            "android.util.Pair::getSecond" -> {
                val refId = args["refId"] as Int
                val pair = HEAP[refId] as Pair<*, *>

                if (pair.second.jsonable()) {
                    methodResult.success(pair.second)
                } else {
                    methodResult.success(pair.second?.hashCode())
                }
            }
        }
    }
}