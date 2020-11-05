package me.yohom.foundation_fluttify.platform_view

import android.content.Context
import android.view.SurfaceView
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import me.yohom.foundation_fluttify.HEAP

@Suppress("ClassName")
class android_view_SurfaceViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, params: Any?): PlatformView {
        val view = SurfaceView(context)

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
