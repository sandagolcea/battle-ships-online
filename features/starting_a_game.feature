Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Register your name
  	Given I am on newgame
  	When I submit my name as "Johnny"
  	Then I should see "Welcome Johnny, good hunting"