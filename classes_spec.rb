require 'rspec'
require './classes.rb'
require './module.rb'



describe Animal do
      describe '#initialize' do
        subject { Animal.new(
            name: 'Cow')
        }
        it { is_expected.to have_attributes(name: 'Cow')}
      end

    describe '#info=>message' do
        subject { Animal.new(
            name: 'Rat')
        }
        it { subject.info; is_expected.to have_attributes(message: 'Животное: Rat,') }
    end
    describe '#info=>nil' do
        subject { Animal.new(
            name: 'Rat')
        }
        it { is_expected.to have_attributes(message: nil) }
    end

end
describe Cat do
      describe '#initialize' do
        subject { Cat.new(
            name: 'Cat')
        }
        it { is_expected.to have_attributes(name: 'Cat')}
    end

    describe '#info' do
        subject { Cat.new(
            name: 'Garfield')
        }
        it { subject.info; is_expected.to have_attributes(message: 'Животное: Garfield, кот') }
    end

    describe '#meow' do
        subject { Cat.new
        }
        it {subject.send(:meow); is_expected.to have_attributes(message: 'Делает мяу') }
    end
end
describe Dog do
      describe '#initialize' do
        subject { Dog.new(
            name: 'Dog')
        }
        it { is_expected.to have_attributes(name: 'Dog')}
    end

    describe '#info' do
        subject { Dog.new(
            name: 'Goofy',
            breed: 'Labrador')
        }
        it { subject.info; is_expected.to have_attributes(message: 'Животное: Goofy, порода: Labrador') }
    end

    describe '#sing' do
        subject { Dog.new
        }
        it {subject.send(:sing); is_expected.to have_attributes(message: 'Делает гав') }
    end
end
describe Bird do
      describe '#initialize' do
        subject { Bird.new(name: 'Bird') }
        it { is_expected.to have_attributes(name: 'Bird')}
    end

    describe '#info' do
        subject { Bird.new(
            name: 'Karych',
            can_fly: true)
        }
        it { subject.info; is_expected.to have_attributes(message: 'Животное: Karych, птица, летает,') }
    end
end

class OneClass
    include Inspectable
    def kk
    end
end
class TwoClass < OneClass
    def mkk
    end
    private
    def kk
    end
end
class ThreeClass < TwoClass
    def kk
    end
    private
    def mkk
    end
end
describe Inspectable do
 
    let(:instance) { OneClass.new }
    
    describe '#method_origin' do
    
        it { expect(instance.method_origin(:kk)).to eq('OneClass#kk: публичный, определен TwoClass#kk: приватный, переопределен ThreeClass#kk: публичный, переопределен')}
    end
end


