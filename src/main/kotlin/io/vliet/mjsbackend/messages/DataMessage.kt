package io.vliet.mjsbackend.domain


data class DataMessage (
    val device: String,
    val timeStamp: String?,
    val dataPoints: Set<DataPoint>
)
data class DataPoint (
    val variableKey: String,
    val value: String
)
