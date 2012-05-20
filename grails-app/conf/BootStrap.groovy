import runnersweb.*
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class BootStrap {

    def init = { servletContext ->
        log.info("Inserting default point types...")
        println "Inserting default point types..."


        PointType pointsPerDistance = new PointType(description: "Puntos por distancia. 1pt por km.",
                                                    name:  ConfigurationHolder.config.puntosPorKmName,
                                                    pointsGiven: 1)
        pointsPerDistance.save()
    }
    def destroy = {
    }
}
