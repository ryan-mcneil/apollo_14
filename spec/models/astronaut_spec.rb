require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Statistics' do

    before(:each) do
      @astronaut_1 = Astronaut.create(name: 'Neil Armstong', age:"38", job:"Commander")
      @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age:"88", job:"Command Pilot")

    end

    it 'should calcuate average age' do
      expect(Astronaut.average_age).to eq(63)
    end
  end
end
