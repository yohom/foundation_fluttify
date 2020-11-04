package me.yohom.foundation_fluttify.android.view

import android.view.View
import android.view.ViewGroup
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.__this__
import me.yohom.foundation_fluttify.core.get

fun ViewGroupHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.view.ViewGroup::addView" -> {
            val viewGroup: ViewGroup = rawArgs.__this__()
            val child: View = rawArgs["child"] as View

            viewGroup.addView(child)

            methodResult.success("success")
        }
        else -> methodResult.notImplemented()
    }
}