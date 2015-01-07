Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I press "New Game"
    Then I should see "What's your name?"

  Scenario: Register your name
  	Given I am on the newgame page
  	When I fill in "first" with "Johnny"
  	And I press "GO!"
  	Then I should see "Welcome Johnny, good hunting"

   Scenario: Register your name
  	Given I am on the newgame page
  	When I fill in "second" with "Sanda"
  	And I fill in "first" with "Johnny"
  	And I press "GO!"
  	Then I should see "Welcome Sanda, good hunting"
  	