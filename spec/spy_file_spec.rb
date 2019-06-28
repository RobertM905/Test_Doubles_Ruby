describe 'missile launcher' do
    it 'calls the fire method on the missile' do
        spy_missile = MissileSpy.new
        missile_launcher = MissileLauncher.new(spy_missile)
        missile_launcher.launch
        expect(spy_missile.fire_has_been_called).to eq(true)
    end
end


class MissileLauncher
    def initialize(missile)
        @missile = missile
    end

    def launch
        @missile.fire
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