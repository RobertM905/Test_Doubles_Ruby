describe 'missile launcher' do
    it 'only fires with valid code' do
        mock_missile = MissileMock.new
        invalid_code_stub = InvalidCodeStub.new
        missile_launcher = MissileLauncher.new(mock_missile, invalid_code_stub)
        missile_launcher.launch
        mock_missile.check_if_false(self)
        
    end
end

class MissileLauncher
    def initialize(missile, code)
        @missile = missile
        @code = code
    end

    def launch
        @missile.fire if @code.isValid?
    end
end

class MissileMock
    attr_reader :fire_has_been_called
    def initialize
        @fire_has_been_called = false
    end

    def fire
        @fire_has_been_called = true
    end 

    def check_if_false(test)
        test.expect(@fire_has_been_called).to test.eq(false)
    end


end

class InvalidCodeStub
    def isValid?
        false
    end
end
