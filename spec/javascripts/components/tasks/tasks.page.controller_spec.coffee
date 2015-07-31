#= require angular_spec_helper

describe 'TasksPageCtrl', ->
  Tasks = null
  task = null
  currentUser = {}
  tasks = [
      id: 1
      name: "Task 1"
      done: false
    ,
      id: 2
      name: "Task 2"
      done: true
  ]

  beforeEach ->
    Tasks = @injector.get('Tasks')
    task = name: "Foo task", done: false
    @sandbox.stub(Tasks, 'query').returns(tasks.slice())

    @initController = =>
      @controller('TasksPageCtrl',
        $scope: @scope
        currentUser: currentUser
        Tasks: Tasks
      )

  describe "defaults", ->
    beforeEach ->
      @initController()

    it "starts with empty new task", ->
      expect(@scope.newTask.name).toEqual("")

    it "populates tasks list", ->
      expect(@scope.tasks).toEqual(tasks)

  describe "newTaskReset", ->
    it "resets new task to empty", ->
      @initController()
      @scope.newTask.name = "Do this"
      @scope.newTaskReset()
      expect(@scope.newTask.name).toEqual("")

  describe "createTask", ->
    form = null
    promise = null

    beforeEach ->
      form = $valid: true
      @initController()
      promise = @fakeResourceResponse(Tasks, 'save')

    it "sends task for creation", ->
      @scope.createTask(form, task)
      expect(Tasks.save).toHaveBeenCalledWith(task)

    it "adds new task to tasks when successful", ->
      @scope.createTask(form, task)
      promise.resolve(task)
      expect(@scope.tasks[0]).toEqual(task)

  describe "updateTask", ->
    beforeEach ->
      @initController()
      @fakeResourceResponse(Tasks, 'update')

    it "saves changes to task", ->
      @scope.updateTask(task)
      expect(Tasks.update).toHaveBeenCalledWith(task)

  describe "deleteTask", ->
    promise = null
    beforeEach ->
      @initController()
      promise = @fakeResourceResponse(Tasks, 'delete')
      @scope.deleteTask(tasks[0])

    it "deletes task", ->
      expect(Tasks.delete).toHaveBeenCalledWith(tasks[0])

    it "also removes tasks from tasks list", ->
      promise.resolve(tasks[0])
      expect(@scope.tasks).not.toContain(tasks[0])

