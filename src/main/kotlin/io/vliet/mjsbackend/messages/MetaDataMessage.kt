package io.vliet.mjsbackend.domain

data class MetaDataMessage(
    val operation: MetaDataOperation,
    val device: String,
    val metaData: List<MetaDataPoint>
)

data class MetaDataPoint(
    val variable: String?,
    val metaDataKey: String,
    val metaDataValue: String
)

enum class MetaDataOperation (val key: Int) {
    createDevice(1),
    updateDevice(2),
    deleteDevice(3),
    updateDeviceMetaData(4),
    createDeviceVariable(5),
    updateDeviceVariable(6),
    deleteDeviceVariable(7),
    updateDeviceVariableMetaData(8)
}
