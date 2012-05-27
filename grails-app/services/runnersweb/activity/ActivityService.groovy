package runnersweb.activity

import runnersweb.Activity

import org.springframework.beans.factory.annotation.Autowired

import runnersweb.activity.rule.PointRuleService

class ActivityService {

    private List<PointRuleService> pointRules;

    @Autowired
    ActivityService(List<PointRuleService> pointRules) {
        this.pointRules = pointRules
    }

    def addActivityPoints(Activity activity) {
        pointRules.each { rule ->
            activity.addToPoints(rule.buildPoint(activity))
        }

        addTotalPointsToRunner(activity)
    }

    private addTotalPointsToRunner(Activity activity) {
        Integer totalPoints = 0

        activity.points.each { point ->
            totalPoints += point.value
        }

        activity.getRunner().points = totalPoints
    }


}
