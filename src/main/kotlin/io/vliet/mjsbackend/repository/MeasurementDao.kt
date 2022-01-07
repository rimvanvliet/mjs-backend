package io.vliet.mjsbackend.repository


import io.vliet.mjsbackend.domain.DatasetOrder
import io.vliet.mjsbackend.domain.Measurement
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional
import javax.persistence.EntityManager
import javax.persistence.PersistenceContext
import javax.persistence.TypedQuery

@Component
class MeasurementDao {

    @PersistenceContext
    lateinit var entityManager: EntityManager


    @Transactional
    fun fetchDatasetOrder(datasetOrder: DatasetOrder): List<Measurement> {

        val parameterMap = mutableMapOf<String, Any>()
        val query = StringBuilder(
            "SELECT m FROM Measurement m " +
                    "JOIN Variable v on m.variable = v.id " +
                    "JOIN Device d on m.device = d.id "
        )

        if (datasetOrder.variables.isNotEmpty() || datasetOrder.devices.isNotEmpty()) {
            val selectionQuery = mutableListOf<String>()
            if (datasetOrder.startDate != null) {
                selectionQuery.add("m.dateTime >= :startDate")
                parameterMap["startDate"] = datasetOrder.startDate
            }
            if (datasetOrder.endDate != null) {
                selectionQuery.add("m.dateTime <= :endDate")
                parameterMap["endDate"] = datasetOrder.endDate
            }
            if (datasetOrder.variables.isNotEmpty()) {
                selectionQuery.add("v in (:variables)")
                parameterMap["variables"] = datasetOrder.variables
            }
            if (datasetOrder.devices.isNotEmpty()) {
                selectionQuery.add("d in (:devices)")
                parameterMap["devices"] = datasetOrder.devices
            }
            query.append(selectionQuery.joinToString(" AND ", prefix = " WHERE "))
        }

        query.append(" ORDER BY m.dateTime, m.device")

        val q: TypedQuery<Measurement> =
            entityManager
                .createQuery(query.toString(), Measurement::class.java)
                .setHint(org.hibernate.jpa.QueryHints.HINT_FETCH_SIZE, "1000")
        parameterMap.forEach { q.setParameter(it.key, it.value) }

        return q.resultList
    }
}
