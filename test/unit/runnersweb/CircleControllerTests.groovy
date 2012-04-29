package runnersweb



import org.junit.*
import grails.test.mixin.*

@TestFor(CircleController)
@Mock(Circle)
class CircleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/circle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.circleInstanceList.size() == 0
        assert model.circleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.circleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.circleInstance != null
        assert view == '/circle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/circle/show/1'
        assert controller.flash.message != null
        assert Circle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/circle/list'


        populateValidParams(params)
        def circle = new Circle(params)

        assert circle.save() != null

        params.id = circle.id

        def model = controller.show()

        assert model.circleInstance == circle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/circle/list'


        populateValidParams(params)
        def circle = new Circle(params)

        assert circle.save() != null

        params.id = circle.id

        def model = controller.edit()

        assert model.circleInstance == circle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/circle/list'

        response.reset()


        populateValidParams(params)
        def circle = new Circle(params)

        assert circle.save() != null

        // test invalid parameters in update
        params.id = circle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/circle/edit"
        assert model.circleInstance != null

        circle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/circle/show/$circle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        circle.clearErrors()

        populateValidParams(params)
        params.id = circle.id
        params.version = -1
        controller.update()

        assert view == "/circle/edit"
        assert model.circleInstance != null
        assert model.circleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/circle/list'

        response.reset()

        populateValidParams(params)
        def circle = new Circle(params)

        assert circle.save() != null
        assert Circle.count() == 1

        params.id = circle.id

        controller.delete()

        assert Circle.count() == 0
        assert Circle.get(circle.id) == null
        assert response.redirectedUrl == '/circle/list'
    }
}
