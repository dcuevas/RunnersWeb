package runnersweb



import org.junit.*
import grails.test.mixin.*

@TestFor(PointTypeController)
@Mock(PointType)
class PointTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pointType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pointTypeInstanceList.size() == 0
        assert model.pointTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pointTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pointTypeInstance != null
        assert view == '/pointType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pointType/show/1'
        assert controller.flash.message != null
        assert PointType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pointType/list'


        populateValidParams(params)
        def pointType = new PointType(params)

        assert pointType.save() != null

        params.id = pointType.id

        def model = controller.show()

        assert model.pointTypeInstance == pointType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pointType/list'


        populateValidParams(params)
        def pointType = new PointType(params)

        assert pointType.save() != null

        params.id = pointType.id

        def model = controller.edit()

        assert model.pointTypeInstance == pointType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pointType/list'

        response.reset()


        populateValidParams(params)
        def pointType = new PointType(params)

        assert pointType.save() != null

        // test invalid parameters in update
        params.id = pointType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pointType/edit"
        assert model.pointTypeInstance != null

        pointType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pointType/show/$pointType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pointType.clearErrors()

        populateValidParams(params)
        params.id = pointType.id
        params.version = -1
        controller.update()

        assert view == "/pointType/edit"
        assert model.pointTypeInstance != null
        assert model.pointTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pointType/list'

        response.reset()

        populateValidParams(params)
        def pointType = new PointType(params)

        assert pointType.save() != null
        assert PointType.count() == 1

        params.id = pointType.id

        controller.delete()

        assert PointType.count() == 0
        assert PointType.get(pointType.id) == null
        assert response.redirectedUrl == '/pointType/list'
    }
}
