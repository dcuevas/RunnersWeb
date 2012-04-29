package runnersweb

import org.springframework.dao.DataIntegrityViolationException

class CircleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [circleInstanceList: Circle.list(params), circleInstanceTotal: Circle.count()]
    }

    def create() {
        [circleInstance: new Circle(params)]
    }

    def save() {
        def circleInstance = new Circle(params)
        if (!circleInstance.save(flush: true)) {
            render(view: "create", model: [circleInstance: circleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'circle.label', default: 'Circle'), circleInstance.id])
        redirect(action: "show", id: circleInstance.id)
    }

    def show() {
        def circleInstance = Circle.get(params.id)
        if (!circleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "list")
            return
        }

        [circleInstance: circleInstance]
    }

    def edit() {
        def circleInstance = Circle.get(params.id)
        if (!circleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "list")
            return
        }

        [circleInstance: circleInstance]
    }

    def update() {
        def circleInstance = Circle.get(params.id)
        if (!circleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (circleInstance.version > version) {
                circleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'circle.label', default: 'Circle')] as Object[],
                          "Another user has updated this Circle while you were editing")
                render(view: "edit", model: [circleInstance: circleInstance])
                return
            }
        }

        circleInstance.properties = params

        if (!circleInstance.save(flush: true)) {
            render(view: "edit", model: [circleInstance: circleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'circle.label', default: 'Circle'), circleInstance.id])
        redirect(action: "show", id: circleInstance.id)
    }

    def delete() {
        def circleInstance = Circle.get(params.id)
        if (!circleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "list")
            return
        }

        try {
            circleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'circle.label', default: 'Circle'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
