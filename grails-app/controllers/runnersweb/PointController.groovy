package runnersweb

import org.springframework.dao.DataIntegrityViolationException

class PointController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pointInstanceList: Point.list(params), pointInstanceTotal: Point.count()]
    }

    def create() {
        [pointInstance: new Point(params)]
    }

    def save() {
        def pointInstance = new Point(params)
        if (!pointInstance.save(flush: true)) {
            render(view: "create", model: [pointInstance: pointInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'point.label', default: 'Point'), pointInstance.id])
        redirect(action: "show", id: pointInstance.id)
    }

    def show() {
        def pointInstance = Point.get(params.id)
        if (!pointInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "list")
            return
        }

        [pointInstance: pointInstance]
    }

    def edit() {
        def pointInstance = Point.get(params.id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "list")
            return
        }

        [pointInstance: pointInstance]
    }

    def update() {
        def pointInstance = Point.get(params.id)
        if (!pointInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pointInstance.version > version) {
                pointInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'point.label', default: 'Point')] as Object[],
                          "Another user has updated this Point while you were editing")
                render(view: "edit", model: [pointInstance: pointInstance])
                return
            }
        }

        pointInstance.properties = params

        if (!pointInstance.save(flush: true)) {
            render(view: "edit", model: [pointInstance: pointInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'point.label', default: 'Point'), pointInstance.id])
        redirect(action: "show", id: pointInstance.id)
    }

    def delete() {
        def pointInstance = Point.get(params.id)
        if (!pointInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pointInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'point.label', default: 'Point'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
