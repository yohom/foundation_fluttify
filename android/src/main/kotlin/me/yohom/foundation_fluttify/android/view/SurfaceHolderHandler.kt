package me.yohom.foundation_fluttify.android.view

import android.view.SurfaceHolder
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.get

fun SurfaceHolderHandler(messenger: BinaryMessenger?, method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.view.SurfaceHolder::addCallback" -> {
            val __this__ = rawArgs["__this__"] as SurfaceHolder

            __this__.addCallback(object : SurfaceHolder.Callback {
                private val channel = MethodChannel(messenger, "android.view.SurfaceHolder::addCallback::Callback")

                override fun surfaceCreated(p0: SurfaceHolder?) {
                    print("kotlin: onSurfaceCreated");
                    channel.invokeMethod(
                            "Callback::android.view.SurfaceHolder.Callback::surfaceCreated",
                            mapOf("var1" to p0)
                    )
                }

                override fun surfaceChanged(p0: SurfaceHolder?, p1: Int, p2: Int, p3: Int) {
                    print("kotlin: surfaceChanged");
                    channel.invokeMethod(
                            "Callback::android.view.SurfaceHolder.Callback::surfaceChanged",
                            mapOf("var1" to p0, "var2" to p1, "var3" to p2, "var4" to p3)
                    )
                }

                override fun surfaceDestroyed(p0: SurfaceHolder?) {
                    print("kotlin: surfaceDestroyed");
                    channel.invokeMethod(
                            "Callback::android.view.SurfaceHolder.Callback::surfaceDestroyed",
                            mapOf("var1" to p0)
                    )
                }
            })

            methodResult.success("success")
        }
        else -> methodResult.notImplemented()
    }
}