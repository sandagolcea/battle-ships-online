Feature: Place the Ships from an initiated fleet
	In order to place ships we need a fleet
	We need each player to have their own fleet 
	We need each player to place each of the ships on their board

	Scenario: Registering
    Given I am on the homepage
    When I press "New Game"
    Then I should see "What's your name?"