package me.yohom.foundation_fluttify.android.widget

import android.app.Activity
import android.graphics.Bitmap
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.__this__
import me.yohom.foundation_fluttify.core.get

fun ImageViewHandler(
    method: String,
    rawArgs: Any,
    methodResult: MethodChannel.Result,
    context: Activity?
) {
    when (method) {
        "android.widget.ImageView::createWithBitmap" -> {
            if (context == null) {
                methodResult.error("activity cannot be null", "activity cannot be null", "activity cannot be null")
            } else {
                val bitmap = rawArgs["bitmap"] as Bitmap
                val imageView = ImageView(context)
                imageView.setImageBitmap(bitmap)

                methodResult.success(imageView)
            }
        }
        else -> methodResult.notImplemented()
    }
}