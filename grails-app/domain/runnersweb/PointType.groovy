package runnersweb

class PointType {

    String name
    String description
    Integer pointsGiven
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name blank: false, nullable: null, unique: true
        pointsGiven blank:false, nullable: false
        description nullable:true, blank:true, maxSize:5000
        dateCreated display: false
        lastUpdated display: false
    }

    String toString() {
        name
    }
}
