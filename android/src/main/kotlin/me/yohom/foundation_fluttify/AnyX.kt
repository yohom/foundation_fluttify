package me.yohom.foundation_fluttify

fun <T> Any.__this__(): T {
    return (this as Map<String, Any>)["__this__"] as T
}

operator fun Any.get(key: String): Any? {
    return (this as Map<String, Any>)[key]
}
