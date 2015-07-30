#= require angular_spec_helper

describe 'HomePageCtrl', ->
  auth = null
  state = null

  beforeEach ->
    auth = @injector.get('Auth')
    state = @injector.get('$state')
    @initController = =>
      @controller('HomePageCtrl',
        $scope: @scope
        Auth: auth
        $state: state
        currentUser: {}
      )

  it "shows no error message", ->
    @initController()
    expect(@scope.authError).not.toBeTruthy()

  describe "when logged in", ->
    beforeEach ->
      @sandbox.stub(auth, 'isAuthenticated').returns(true)

    it "redirects to 'next' page", ->
      @sandbox.spy(state, 'go')
      @initController()
      expect(state.go).toHaveBeenCalledWith('next')

  describe "when not logged in", ->
    beforeEach ->
      @sandbox.stub(auth, 'isAuthenticated').returns(false)

    it "does not redirect to 'next' page", ->
      @sandbox.spy(state, 'go')
      @initController()
      expect(state.go).not.toHaveBeenCalledWith('next')

  describe "when user tries to login", ->
    form = null
    creds = null

    describe "with okay credentials ", ->
      beforeEach ->
        form = $valid: true
        creds = email: "foo@somewhere.com", password: "secret"
        @initController()

      it "sends credentials to Auth", ->
        @sandbox.spy(auth, 'login')
        @scope.login(form, creds)
        expect(auth.login).toHaveBeenCalledWith(creds, interceptAuth: false)

      describe "login result", ->
        promise = null
        beforeEach ->
          promise = @sandbox.stub(auth, 'login').returnsPromise()
          @sandbox.spy(state, 'go')

        describe "when login succeeds", ->
          beforeEach ->
            promise.resolves({name: "John Doe"})
            @scope.login(form, creds)

          it "redirects to 'next' page", ->
            expect(state.go).toHaveBeenCalledWith('next')

        describe "when login fails", ->
          beforeEach ->
            promise.rejects({})
            @scope.login(form, creds)

          it "does not redirect", ->
            expect(state.go).not.toHaveBeenCalled()

          it "shows error message", ->
            expect(@scope.authError).toBeTruthy()


