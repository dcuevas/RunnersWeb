package runnersweb

class Circle {

    String groupName
    Runner owner
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [Runner]
    static hasMany = [runners:Runner]

    static constraints = {
        groupName blank: false, nullable: false, unique: true
        owner nullable: false
        description nullable:true, blank:true, maxSize:5000
        runners nullable: true
        dateCreated display: false
        lastUpdated display: false
    }

    String toString() {
        groupName
    }
}
