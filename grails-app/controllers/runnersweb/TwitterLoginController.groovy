package runnersweb

import twitter4j.*

class TwitterLoginController {

    def twitterService

    def index() {}

    def login() {
        redirect url: twitterService.authenticate("http://localhost:8080/RunnersWeb/twitterLogin/callback") // [1]
    }

    def callback () {
        if (params.denied){
            flash.message = "Permiso denegado"

        } else {
            def runner = checkTwitterUser(twitterService.verifyCredentials(params.oauth_verifier))

            session.user = runner
        }
        redirect(action:'index')
    }

    def logout() {
        session.invalidate()

        redirect(controller:'twitterLogin', action:'index')
    }

    private checkTwitterUser(User twitterUser) {
        Runner user = Runner.findByTwitterId(twitterUser.id)

        if (!user) {
            user = new Runner(twitterId: twitterUser.id)
        }

        user.name = twitterUser.name
        user.screenName = twitterUser.screenName
        user.profileImg = twitterUser.profileImageURL.toString()

        user.save()

        return user
    }
}
