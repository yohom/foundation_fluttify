package me.yohom.foundation_fluttify.android.location

import android.location.Location
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

class LocationHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            "android.location.Location::getLatitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.latitude)
            }
            "android.location.Location::getLongitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.longitude)
            }
            "android.location.Location::getBearing" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.bearing)
            }
            "android.location.Location::getAltitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.altitude)
            }
            "android.location.Location::getAccuracy" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.accuracy)
            }
            "android.location.Location::getSpeed" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as Location

                methodResult.success(location.speed)
            }
            else -> methodResult.notImplemented()
        }
    }
}