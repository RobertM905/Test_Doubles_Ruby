
require 'webmock/rspec'
describe 'yes no getter' do
   it 'can print a yes' do
    stub_request(:get, "https://yesno.wtf/api").
    to_return(status: 200, body: '{"answer": "yes"}')

        yes_no_getter = YesNoGetter.new
        response = yes_no_getter.execute
        expect(response).to eq('YES')
   end
end


class YesNoGetter
    def execute
        url = URI.parse('https://yesno.wtf/api')
        response = Net::HTTP.get(url)
        response_parsed = JSON.parse response, symbolize_names: true
        response_parsed[:answer].upcase
        
    end
end