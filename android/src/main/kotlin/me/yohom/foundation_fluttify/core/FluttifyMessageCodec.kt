package me.yohom.foundation_fluttify.core

import io.flutter.plugin.common.StandardMessageCodec
import me.yohom.foundation_fluttify.HEAP
import java.io.ByteArrayOutputStream
import java.math.BigInteger
import java.nio.ByteBuffer
import java.nio.charset.Charset
import java.util.*

@Suppress("PrivatePropertyName")
class FluttifyMessageCodec: StandardMessageCodec() {
    private val UTF8 = Charset.forName("UTF8")

    private val NULL: Byte = 0
    private val TRUE: Byte = 1
    private val FALSE: Byte = 2
    private val INT: Byte = 3
    private val LONG: Byte = 4
    private val BIGINT: Byte = 5
    private val DOUBLE: Byte = 6
    private val STRING: Byte = 7
    private val BYTE_ARRAY: Byte = 8
    private val INT_ARRAY: Byte = 9
    private val LONG_ARRAY: Byte = 10
    private val DOUBLE_ARRAY: Byte = 11
    private val LIST: Byte = 12
    private val MAP: Byte = 13
    private val ARRAY: Byte = 125
    private val ENUM: Byte = 126
    private val REF: Byte = 127

    override fun writeValue(stream: ByteArrayOutputStream, value: Any?) {
        if (value == null) {
            stream.write(NULL.toInt())
        } else if (value == true) {
            stream.write(TRUE.toInt())
        } else if (value == false) {
            stream.write(FALSE.toInt())
        } else if (value is Number) {
            if (value is Int || value is Short || value is Byte) {
                stream.write(INT.toInt())
                writeInt(stream, value.toInt())
            } else if (value is Long) {
                stream.write(LONG.toInt())
                writeLong(stream, value)
            } else if (value is Float || value is Double) {
                stream.write(DOUBLE.toInt())
                writeAlignment(stream, 8)
                writeDouble(stream, value.toDouble())
            } else if (value is BigInteger) {
                stream.write(BIGINT.toInt())
                writeBytes(stream, value.toString(16).toByteArray(UTF8))
            } else {
                throw IllegalArgumentException("Unsupported Number type: " + value.javaClass)
            }
        } else if (value is String) {
            stream.write(STRING.toInt())
            writeBytes(stream, value.toByteArray(UTF8))
        } else if (value is ByteArray) {
            stream.write(BYTE_ARRAY.toInt())
            writeBytes(stream, value as ByteArray?)
        } else if (value is IntArray) {
            stream.write(INT_ARRAY.toInt())
            writeSize(stream, value.size)
            writeAlignment(stream, 4)
            for (n in value) {
                writeInt(stream, n)
            }
        } else if (value is LongArray) {
            stream.write(LONG_ARRAY.toInt())
            writeSize(stream, value.size)
            writeAlignment(stream, 8)
            for (n in value) {
                writeLong(stream, n)
            }
        } else if (value is DoubleArray) {
            stream.write(DOUBLE_ARRAY.toInt())
            writeSize(stream, value.size)
            writeAlignment(stream, 8)
            for (d in value) {
                writeDouble(stream, d)
            }
        } else if (value is List<*>) {
            stream.write(LIST.toInt())
            writeSize(stream, value.size)
            for (o in value) {
                writeValue(stream, o)
            }
        } else if (value is Array<*>) {
            stream.write(ARRAY.toInt())
            writeSize(stream, value.size)
            for (o in value) {
                writeValue(stream, o)
            }
        } else if (value is Map<*, *>) {
            stream.write(MAP.toInt())
            writeSize(stream, value.size)
            for ((key, value1) in value) {
                writeValue(stream, key)
                writeValue(stream, value1)
            }
        }
        // 枚举值传索引
        else if (value is Enum<*>) {
            stream.write(ENUM.toInt())
            writeInt(stream, value.ordinal)
        }
        // 其他类型传哈希值
        else {
            // 放入HEAP
            HEAP[System.identityHashCode(value).toString()] = value

            stream.write(REF.toInt())
            writeInt(stream, System.identityHashCode(value))
        }
    }

    override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
        val result: Any?
        when (type) {
            NULL -> result = null
            TRUE -> result = true
            FALSE -> result = false
            INT -> result = buffer.int
            LONG -> result = buffer.long
            BIGINT -> {
                val hex = readBytes(buffer)
                result = BigInteger(String(hex, UTF8), 16)
            }
            DOUBLE -> {
                readAlignment(buffer, 8)
                result = buffer.double
            }
            STRING -> {
                val bytes = readBytes(buffer)
                result = String(bytes, UTF8)
            }
            BYTE_ARRAY -> {
                result = readBytes(buffer)
            }
            INT_ARRAY -> {
                val length = readSize(buffer)
                val array = IntArray(length)
                readAlignment(buffer, 4)
                buffer.asIntBuffer()[array]
                result = array
                buffer.position(buffer.position() + 4 * length)
            }
            LONG_ARRAY -> {
                val length = readSize(buffer)
                val array = LongArray(length)
                readAlignment(buffer, 8)
                buffer.asLongBuffer()[array]
                result = array
                buffer.position(buffer.position() + 8 * length)
            }
            DOUBLE_ARRAY -> {
                val length = readSize(buffer)
                val array = DoubleArray(length)
                readAlignment(buffer, 8)
                buffer.asDoubleBuffer()[array]
                result = array
                buffer.position(buffer.position() + 8 * length)
            }
            ARRAY -> {
                val size = readSize(buffer)
                val list: MutableList<Any> = ArrayList(size)
                var i = 0
                while (i < size) {
                    list.add(readValue(buffer))
                    i++
                }
                result = list.toTypedArray()
            }
            LIST -> {
                val size = readSize(buffer)
                val list: MutableList<Any> = ArrayList(size)
                var i = 0
                while (i < size) {
                    list.add(readValue(buffer))
                    i++
                }
                result = list
            }
            MAP -> {
                val size = readSize(buffer)
                val map: MutableMap<Any, Any> = HashMap()
                var i = 0
                while (i < size) {
                    map[readValue(buffer)] = readValue(buffer)
                    i++
                }
                result = map
            }
            ENUM -> result = buffer.int
            REF -> {
                val bytes = readBytes(buffer)
                result = HEAP[String(bytes, UTF8)]
            }
            else -> throw java.lang.IllegalArgumentException("Message corrupted")
        }
        return result
    }
}