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
      @astronaut_1.missions.create(title:"Capricorn 4", time_in_space:"14")
      @astronaut_1.missions.create(title:"Apollo 13", time_in_space:"26")
      @astronaut_1.missions.create(title:"Gemini 7", time_in_space:"15")
      @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age:"88", job:"Command Pilot")
      @astronaut_2.missions.create(title:"Scorpio 12 7", time_in_space:"4")
      @astronaut_2.missions.create(title:"Leo 3.5", time_in_space:"52")
    end

    it 'should calcuate average age' do
      expect(Astronaut.average_age).to eq(63)
    end

    it 'should list missions in alphabetical order' do
      expect(@astronaut_1.missions_abc).to eq(["Apollo 13","Capricorn 4", "Gemini 7"])
    end
  end
end
