describe 'missile launcher' do
    it 'only fires with valid code' do
        mock_missile1 = MissileMock.new
        mock_missile2 = MissileMock.new
        launch_code = FakeLaunchCode.new
        missile_launcher = MissileLauncher.new(mock_missile1, launch_code)
        missile_launcher.launch
        expect(mock_missile1.fire_has_been_called).to eq(true)
        missile_launcher = MissileLauncher.new(mock_missile2, launch_code)
        missile_launcher.launch
        expect(mock_missile2.fire_has_been_called).to eq(false)

        
        
    end
end

class MissileLauncher
    def initialize(missile, code)
        @missile = missile
        @code = code
    end

    def launch
        if @code.isValid?
            @missile.fire 
            @code.retire
        end
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
end

class FakeLaunchCode
    attr_reader :valid_code
    def initialize
        @valid_code = true
    end
    def isValid?
        @valid_code
    end

    def retire
        @valid_code = false
    end
end
