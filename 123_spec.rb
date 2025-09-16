require 'rspec'
require './123.rb'

describe Student do
    let(:student) {
        Student.new(
            first_name: 'Max', 
            last_name: 'Gelwich', 
            middle_name: 'Viktorovich')
        }
    describe '#initialize' do
        it 'def initialize' do
            expect(student.first_name).to eq('Max')
            expect(student.last_name).to eq('Gelwich')
            expect(student.middle_name).to eq('Viktorovich')
        end
    end

    describe '#full_name' do
        it 'def full_name' do
            expect(student.full_name).to eq('Gelwich Max Viktorovich')
        end
    end

    describe '#student_id' do
        it 'def student_id' do
            expect(student.student_id).to eq('ST28386958')
        end
    end
    describe '#generate_student_id' do
        it 'def generate_student_id' do
            expect(student.generate_student_id(
                'Max', 
                'Gelwich', 
                'Viktorovich')).to eq('ST28386958')
        end
    end
end