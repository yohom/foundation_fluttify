package me.yohom.foundation_fluttify.android.location

import android.location.Location
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun LocationHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.location.Location::create" -> {
            val args = rawArgs as Map<String, Any>

            val provider = args["provider"] as String

            val location = Location(provider)

            HEAP[System.identityHashCode(location)] = location

            methodResult.success(System.identityHashCode(location))
        }
        "android.location.Location::getLatitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.latitude)
        }
        "android.location.Location::getLongitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.longitude)
        }
        "android.location.Location::getBearing" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.bearing)
        }
        "android.location.Location::getAltitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.altitude)
        }
        "android.location.Location::getAccuracy" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.accuracy)
        }
        "android.location.Location::getSpeed" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val location = HEAP[refId] as Location

            methodResult.success(location.speed)
        }
        "android.location.Location::setLatitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val latitude = args["latitude"] as Double

            val location = HEAP[refId] as Location
            location.latitude = latitude

            methodResult.success("success")
        }
        "android.location.Location::setLongitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val longitude = args["longitude"] as Double

            val location = HEAP[refId] as Location

            location.longitude = longitude

            methodResult.success("success")
        }
        "android.location.Location::setBearing" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val bearing = args["bearing"] as Double

            val location = HEAP[refId] as Location

            location.bearing = bearing.toFloat()

            methodResult.success("success")
        }
        "android.location.Location::setAltitude" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val altitude = args["altitude"] as Double

            val location = HEAP[refId] as Location

            location.altitude = altitude

            methodResult.success("success")
        }
        "android.location.Location::setAccuracy" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val accuracy = args["accuracy"] as Double

            val location = HEAP[refId] as Location

            location.accuracy = accuracy.toFloat()

            methodResult.success("success")
        }
        "android.location.Location::setSpeed" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val speed = args["speed"] as Double

            val location = HEAP[refId] as Location

            location.speed = speed.toFloat()

            methodResult.success("success")
        }
        else -> methodResult.notImplemented()
    }
}