package runnersweb

class Point {

    PointType type
    Integer value
    Date dateCreated
    Date lastUpdated

    static belongsTo = [activity: Activity]

    static constraints = {
        type nullable: false
        value blank:true, nullable: false
        dateCreated display: false
        lastUpdated display: false
    }

    String toString() {
        "$type => Total: $value pts"
    }
}
