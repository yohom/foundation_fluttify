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
        else -> methodResult.notImplemented()
    }
}