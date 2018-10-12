require 'rails_helper'


describe 'astronaut index' do

  before(:each) do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstong', age:"38", job:"Commander")
    @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age:"88", job:"Command Pilot")

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
end
