package runnersweb

import org.codehaus.groovy.grails.commons.*
import twitter4j.*
import twitter4j.auth.*

class TwitterService {

    static transactional = false
    static scope = 'session'

    Twitter twitter
    RequestToken requestToken

    String authenticate(String returnUrl) {
        twitter = new TwitterFactory().getInstance()
        twitter.setOAuthConsumer(ConfigurationHolder.config.consumerKey, ConfigurationHolder.config.consumerSecret)
        requestToken = twitter.getOAuthRequestToken(returnUrl)
        return requestToken.getAuthenticationURL()
    }

    User verifyCredentials(String oauth_verifier) {
        AccessToken accessToken = twitter.getOAuthAccessToken(requestToken, oauth_verifier)
        return twitter.verifyCredentials()
    }
}
