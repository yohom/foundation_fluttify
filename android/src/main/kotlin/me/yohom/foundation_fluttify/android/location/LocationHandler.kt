package me.yohom.foundation_fluttify.android.location

import android.location.Location
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

class LocationHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            // android.location.Location latitude
            "android.location.Location::getLatitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.latitude)
            }
            // android.location.Location longitude
            "android.location.Location::getLongitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.longitude)
            }
            else -> methodResult.notImplemented()
        }
    }
}