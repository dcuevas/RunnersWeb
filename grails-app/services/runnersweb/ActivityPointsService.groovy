package runnersweb

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ActivityPointsService {

    static distanceDivisor = 1000

    def addActivityPoints(Activity activity) {
        Point pointsPerDistance = addPointsPerDistance(activity)
        activity.addToPoints(pointsPerDistance)
        return pointsPerDistance.value
    }

    private addPointsPerDistance(Activity activity) {
        Point pointsPerDistance = new Point()
        pointsPerDistance.activity = activity
        pointsPerDistance.type = PointType.findByName(ConfigurationHolder.config.puntosPorKmName)
        pointsPerDistance.value = calculatePointsFromDistance(activity.distance)

        return pointsPerDistance
    }

    private calculatePointsFromDistance(Double distance) {
        return  distance /distanceDivisor
    }
}
