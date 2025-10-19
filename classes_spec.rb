require 'rspec'
require './classes.rb'
describe Temperature do

    describe '#fahrenheit' do
        subject { Temperature.new(celsius: 10).fahrenheit }
        it { is_expected.to eq(50.0) }
    end

    describe '#celsius' do
        subject { Temperature.new(fahrenheit: 50).celsius }
        it { is_expected.to eq(10) }
    end
end