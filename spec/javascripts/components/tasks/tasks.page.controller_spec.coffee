#= require angular_spec_helper

describe 'TasksPageCtrl', ->
  Tasks = null
  task = null
  currentUser = {}
  tasks = [
      name: "Task 1"
      done: false
    ,
      name: "Task 2"
      done: true
  ]

  beforeEach ->
    Tasks = @injector.get('Tasks')
    task = name: "Foo task", done: false
    @sandbox.stub(Tasks, 'query').returns(tasks)

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
    promise = null

    beforeEach ->
      @initController()
      promise = @fakeResourceResponse(Tasks, 'update')

    it "saves changes to task", ->
      @scope.updateTask(task)
      expect(Tasks.update).toHaveBeenCalledWith(task)

