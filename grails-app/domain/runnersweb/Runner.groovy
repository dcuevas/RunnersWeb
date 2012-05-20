package runnersweb

class Runner {

    String username
    String password
    String fullName
    Date birthday
    String mail
    Date dateCreated
    Date lastUpdated
    Long twitterId
    String screenName
    String profileImg
    String name
    Integer points = 0

    static hasMany = [activities:Activity]

    static constraints = {
        username blank: false, nullable: false, unique: true
        password blank: false, nullable: false, size: 6..24
        fullName blank: false, nullable: false
        birthday nullable: true
        mail blank: false, nullable: false, email: true
        activities nullable: true
        dateCreated display: false
        lastUpdated display: false
        name nullable: true
        profileImg nullable: true
        twitterId nullable: true
        screenName nullable: true
        points nullable: true
    }

    String toString() {
        fullName
    }
}
