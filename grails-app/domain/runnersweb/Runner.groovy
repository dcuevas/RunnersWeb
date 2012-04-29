package runnersweb

class Runner {

    String username
    String password
    String fullName
    Date birthday
    String mail
    Date dateCreated
    Date lastUpdated

    static hasMany = [activities:Activity ,circles:Circle]

    static constraints = {
        username blank: false, nullable: false, unique: true
        password blank: false, nullable: false
        fullName blank: false, nullable: false
        birthday nullable: true
        mail blank: false, nullable: false, email: true
        activities nullable: true
        circles nullable: true
        dateCreated display: false
        lastUpdated display: false
    }

    String toString() {
        fullName
    }
}
