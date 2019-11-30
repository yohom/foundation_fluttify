package me.yohom.foundation_fluttify.android.graphics

import android.graphics.Point
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

class PointHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            "android.graphics.Point::getX" -> {
                val refId = args["refId"] as Int
                val point = HEAP[refId] as Point

                methodResult.success(point.x)
            }
            "android.graphics.Point::getY" -> {
                val refId = args["refId"] as Int
                val point = HEAP[refId] as Point

                methodResult.success(point.y)
            }
            else -> methodResult.notImplemented()
        }
    }
}