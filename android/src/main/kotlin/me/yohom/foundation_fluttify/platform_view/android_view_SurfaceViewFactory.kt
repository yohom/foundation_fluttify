package me.yohom.foundation_fluttify.platform_view

import android.content.Context
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMethodCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.core.FluttifyMessageCodec

@Suppress("ClassName")
class android_view_SurfaceViewFactory(private val binaryMessenger: BinaryMessenger?)
    : PlatformViewFactory(FluttifyMessageCodec()) {
    override fun create(context: Context, id: Int, params: Any?): PlatformView {
        val view = SurfaceView(context)

        view.holder.addCallback(object : SurfaceHolder.Callback {
            private val channel = MethodChannel(
                    binaryMessenger,
                    "android.view.SurfaceHolder::addCallback::Callback",
                    StandardMethodCodec(FluttifyMessageCodec())
            )

            override fun surfaceCreated(holder: SurfaceHolder?) {
                channel.invokeMethod(
                        "Callback::android.view.SurfaceHolder.Callback::surfaceCreated",
                        mapOf("holder" to holder)
                )
            }

            override fun surfaceChanged(holder: SurfaceHolder?, format: Int, width: Int, height: Int) {
                channel.invokeMethod(
                        "Callback::android.view.SurfaceHolder.Callback::surfaceChanged",
                        mapOf("holder" to holder, "format" to format, "width" to width, "height" to height)
                )
            }

            override fun surfaceDestroyed(holder: SurfaceHolder?) {
                channel.invokeMethod(
                        "Callback::android.view.SurfaceHolder.Callback::surfaceDestroyed",
                        mapOf("holder" to holder)
                )
            }
        })

        // 同时存放viewId和refId的对象, 供后续viewId转refId使用
        HEAP[(Int.MAX_VALUE - id).toString()] = view
        HEAP["android.view.SurfaceView:${System.identityHashCode(view)}"] = view
        return object : PlatformView {
            override fun getView(): View {
                return view
            }

            override fun dispose() {}
        }
    }
}
