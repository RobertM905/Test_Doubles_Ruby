describe 'missile launcher' do
    it 'launches a missile' do
        dummy_missile = nil
        missile_launcher = MissileLauncher.new(dummy_missile)

        expect(missile_launcher.launch).to eq(true)
    end
end


class MissileLauncher
    def initialize(missile)
    
    end

    def launch
        true
    end
end