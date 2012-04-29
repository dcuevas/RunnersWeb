package runnersweb

import org.springframework.dao.DataIntegrityViolationException

class PointTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pointTypeInstanceList: PointType.list(params), pointTypeInstanceTotal: PointType.count()]
    }

    def create() {
        [pointTypeInstance: new PointType(params)]
    }

    def save() {
        def pointTypeInstance = new PointType(params)
        if (!pointTypeInstance.save(flush: true)) {
            render(view: "create", model: [pointTypeInstance: pointTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pointType.label', default: 'PointType'), pointTypeInstance.id])
        redirect(action: "show", id: pointTypeInstance.id)
    }

    def show() {
        def pointTypeInstance = PointType.get(params.id)
        if (!pointTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "list")
            return
        }

        [pointTypeInstance: pointTypeInstance]
    }

    def edit() {
        def pointTypeInstance = PointType.get(params.id)
        if (!pointTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "list")
            return
        }

        [pointTypeInstance: pointTypeInstance]
    }

    def update() {
        def pointTypeInstance = PointType.get(params.id)
        if (!pointTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pointTypeInstance.version > version) {
                pointTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pointType.label', default: 'PointType')] as Object[],
                          "Another user has updated this PointType while you were editing")
                render(view: "edit", model: [pointTypeInstance: pointTypeInstance])
                return
            }
        }

        pointTypeInstance.properties = params

        if (!pointTypeInstance.save(flush: true)) {
            render(view: "edit", model: [pointTypeInstance: pointTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pointType.label', default: 'PointType'), pointTypeInstance.id])
        redirect(action: "show", id: pointTypeInstance.id)
    }

    def delete() {
        def pointTypeInstance = PointType.get(params.id)
        if (!pointTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pointTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pointType.label', default: 'PointType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
