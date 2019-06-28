describe 'missile launcher' do
    it 'only fires with valid code' do
        spy_missile = MissileSpy.new
        invalid_code_stub = InvalidCodeStub.new
        missile_launcher = MissileLauncher.new(spy_missile, invalid_code_stub)
        missile_launcher.launch
        expect(spy_missile.fire_has_been_called).to eq(false)
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

class MissileSpy
    attr_reader :fire_has_been_called
    def initialize
        @fire_has_been_called = false
    end

    def fire
        @fire_has_been_called = true
    end 
end

class InvalidCodeStub
    def isValid?
        false
    end
end
