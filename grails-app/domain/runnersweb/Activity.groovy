package runnersweb

class Activity {

    String type
    Double distance
    Double duration
    Date startTime
    String notes
    Date dateCreated
    Date lastUpdated

    static belongsTo = [runner: Runner]
    static hasMany = [points:Point]

    static constraints = {
        type blank:false, inList:["Running", "Walking", "Swimming", "Trekking"]
        points  nullable: true
        notes nullable:true, blank:true, maxSize:5000
        dateCreated display: false
        lastUpdated display: false
    }

    String toString() {
        type
    }
}
