package me.yohom.foundation_fluttify.android.location

import android.location.Location
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.__this__
import me.yohom.foundation_fluttify.get

fun LocationHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.location.Location::create" -> {
            val provider = rawArgs["provider"] as String

            val location = Location(provider)

            methodResult.success(location)
        }
        "android.location.Location::getLatitude" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.latitude)
        }
        "android.location.Location::getLongitude" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.longitude)
        }
        "android.location.Location::getBearing" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.bearing)
        }
        "android.location.Location::getAltitude" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.altitude)
        }
        "android.location.Location::getAccuracy" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.accuracy)
        }
        "android.location.Location::getSpeed" -> {
            val location: Location = rawArgs.__this__()

            methodResult.success(location.speed)
        }
        "android.location.Location::setLatitude" -> {
            val latitude = rawArgs["latitude"] as Double

            val location: Location = rawArgs.__this__()
            location.latitude = latitude

            methodResult.success("success")
        }
        "android.location.Location::setLongitude" -> {
            val longitude = rawArgs["longitude"] as Double

            val location: Location = rawArgs.__this__()

            location.longitude = longitude

            methodResult.success("success")
        }
        "android.location.Location::setBearing" -> {
            val bearing = rawArgs["bearing"] as Double

            val location: Location = rawArgs.__this__()

            location.bearing = bearing.toFloat()

            methodResult.success("success")
        }
        "android.location.Location::setAltitude" -> {
            val altitude = rawArgs["altitude"] as Double

            val location: Location = rawArgs.__this__()

            location.altitude = altitude

            methodResult.success("success")
        }
        "android.location.Location::setAccuracy" -> {
            val accuracy = rawArgs["accuracy"] as Double

            val location: Location = rawArgs.__this__()

            location.accuracy = accuracy.toFloat()

            methodResult.success("success")
        }
        "android.location.Location::setSpeed" -> {
            val speed = rawArgs["speed"] as Double

            val location: Location = rawArgs.__this__()

            location.speed = speed.toFloat()

            methodResult.success("success")
        }
        else -> methodResult.notImplemented()
    }
}