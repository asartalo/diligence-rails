#= require angular_spec_helper

describe 'TasksPageCtrl', ->
  Tasks = null
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

