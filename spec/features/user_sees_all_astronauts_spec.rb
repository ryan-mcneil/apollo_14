require 'rails_helper'


describe 'astronaut index' do

  before(:each) do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstong', age:"38", job:"Commander")
    @astronaut_1.missions.create(title:"Capricorn 4s", time_in_space:"14")
    @astronaut_1.missions.create(title:"Apollo 13", time_in_space:"26")
    @astronaut_1.missions.create(title:"Gemini 7", time_in_space:"15")
    @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age:"88", job:"Command Pilot")
    @astronaut_2.missions.create(title:"Scorpio 12", time_in_space:"4")
    @astronaut_2.missions.create(title:"Leo 3.5", time_in_space:"52")

  end

  it 'should show all astronauts' do
    visit '/astronauts'

    expect(page).to have_content("All Astronauts")
    expect(page).to have_content(@astronaut_1.name)
    expect(page).to have_content("Age: #{@astronaut_1.age}")
    expect(page).to have_content("Job: #{@astronaut_1.job}")
    expect(page).to have_content(@astronaut_2.name)
    expect(page).to have_content("Age: #{@astronaut_2.age}")
    expect(page).to have_content("Job: #{@astronaut_2.job}")
  end

  it 'should show average age' do
    visit '/astronauts'

      within ("#stats") do
        expect(page).to have_content(Astronaut.average_age)
      end

  end

  it 'should show all missions for an astronaut' do
    visit '/astronauts'

    expect(page).to have_content("Missions: Apollo 13, Capricorn 4, Gemini 7")
    expect(page).to have_content("Missions: Leo 3.5, Scorpio 12")
  end
end
