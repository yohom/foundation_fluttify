package me.yohom.foundation_fluttify.android.view

import android.view.SurfaceView
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.get

fun SurfaceViewHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.view.SurfaceView::getHolder" -> {
            val __this__ = rawArgs["__this__"] as SurfaceView
            methodResult.success(__this__.holder)
        }
        "android.view.SurfaceView::setZOrderOnTop" -> {
            val __this__ = rawArgs["__this__"] as SurfaceView
            __this__.setZOrderOnTop(rawArgs["onTop"] as Boolean)
            methodResult.success("success")
        }
        "android.view.SurfaceView::setZOrderMediaOverlay" -> {
            val __this__ = rawArgs["__this__"] as SurfaceView
            __this__.setZOrderMediaOverlay(rawArgs["isMediaOverlay"] as Boolean)
            methodResult.success("success")
        }
        else -> methodResult.notImplemented()
    }
}