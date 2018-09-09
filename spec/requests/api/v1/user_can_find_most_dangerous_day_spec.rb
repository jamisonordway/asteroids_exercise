require 'rails_helper'


# Background:
# * This story should use the Asteroids Neo - Feed: https://api.nasa.gov/api.html#neows-feed

feature 'Visitor navigates to root page and enters a start/end date to find most dangerous day' do
  
  scenario 'user submits valid start and end dates' do
    # it 'displays correct most dangerous day with associated asteroids' do
      visit '/'

      fill_in :start_date, with: '1 January, 2018'
      fill_in :end_date, with: '7 January, 2018'
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq('/most_dangerous_day')
    
      expect(page).to have_content("Most Dangerous Day")
      expect(page).to have_content('January 1, 2018 - January 7, 2018')
    
      # And I should see a heading for the most dangerous day in that range "January 1, 2018"
      # And I should see 3 asteroids in that list
      
      # And I should see "Name: (2014 KT76)"
      # And I should see "NEO Reference ID: 3672906"
      
      # And I should see "Name: (2001 LD)"
      # And I should see "NEO Reference ID: 3078262"
      
      # And I should see "Name: (2017 YR1)"
      # And I should see "NEO Reference ID: 3794979"
    end
#   end 
end


# most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.

# As a guest user
# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"

# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"