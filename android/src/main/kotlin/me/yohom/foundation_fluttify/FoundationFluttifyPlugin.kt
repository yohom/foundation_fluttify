package me.yohom.foundation_fluttify

import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import me.yohom.foundation_fluttify.android.app.ActivityHandler
import me.yohom.foundation_fluttify.android.content.IntentHandler
import me.yohom.foundation_fluttify.android.graphics.BitmapHandler
import me.yohom.foundation_fluttify.android.graphics.PointHandler
import me.yohom.foundation_fluttify.android.location.LocationHandler
import me.yohom.foundation_fluttify.android.util.PairHandler

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
val STACK = mutableMapOf<String, Any>()
// Container for Dart side random access objects
val HEAP = mutableMapOf<Int, Any>()
// whether enable log or not
var enableLog: Boolean = true
// channel for foundation
lateinit var gMethodChannel: MethodChannel
lateinit var gBroadcastEventChannel: EventChannel

class FoundationFluttifyPlugin(private val registrar: Registrar) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            gMethodChannel = MethodChannel(registrar.messenger(), "com.fluttify/foundation_method")
            gMethodChannel.setMethodCallHandler(FoundationFluttifyPlugin(registrar))

            gBroadcastEventChannel = EventChannel(registrar.messenger(), "com.fluttify/foundation_broadcast_event")
        }
    }

    override fun onMethodCall(methodCall: MethodCall, methodResult: Result) {
        val args = methodCall.arguments as? Map<String, Any> ?: mapOf()
        methodCall.method.run {
            when {
                startsWith("android.location.Location") -> LocationHandler(methodCall.method, args, methodResult)
                startsWith("android.util.Pair") -> PairHandler(methodCall.method, args, methodResult)
                startsWith("android.graphics.Bitmap") -> BitmapHandler(methodCall.method, args, methodResult)
                startsWith("android.graphics.Point") -> PointHandler(methodCall.method, args, methodResult)
                startsWith("android.app.Activity") -> ActivityHandler(methodCall.method, args, methodResult)
                startsWith("android.content.Intent") -> IntentHandler(methodCall.method, args, methodResult)
                startsWith("Platform") -> PlatformFactory(methodCall.method, args, methodResult, registrar)
                else -> methodResult.notImplemented()
            }
        }
    }
}

fun <T> T.jsonable(): Boolean {
    return when (this) {
        is Byte, is Short, is Int, is Long, is Float, is Double -> true
        is String -> true
        is List<*> -> true
        is Map<*, *> -> true
        else -> false
    }
}