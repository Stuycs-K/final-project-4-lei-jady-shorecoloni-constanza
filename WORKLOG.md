# Work Log

## Constanza Shore Coloni

### May 22, 2024

tested branches and created Card class

### May 23, 2024

created Hand class - wrote constructor/accessors, started on add/removeCards and tested Hand methods

### May 24, 2024

Created Player and Game classes

### May 27, 2024

Continued working on Game class. Added helper method to create deck of cards for constructor, wrote shuffleDeck(), and tested them

### May 28, 2024

Hand function that returns deck strength, played around with display of card images in Processing and added Game start() method

### May 29, 2024

Work on/tried (but did not succeed) to make 'play' button and mouseClicked(), started working on setup and draw

### May 30, 2024

Wrote mouseClicked() and keyPressed() - when cards are selected, they move up and when return/enter is pressed (plays selected hand), the cards are removed from hand
Got images of cards to work (replaced rectangles), added picture of the back of the card for opponents' cards and deck
Actually when return/enter is pressed the selected hand is not removed, but the cards at the end of the deck are

### May 31, 2024

Changed all java files to pde, got image display to work (each card has a PImage variable now).

### June 1 & 2, 2024

Added display method to game class to display everyone's hands, and cards on the table. Draw runs every 70 frames to make game visible

### June 3 (& 4), 2024

Found out why cards weren't displaying, worked on allowing players to pass and restarting round when everyone passes. Edited play methods with working isPossibleSets

### June 5 (& 6), 2024

Spent lots of time fixing merge conflicts, trying to find out why player's cards don't display when put down. Worked on getting passing to work smoothly

### June 7 - 9, 2024

Still trying to figure out why cards don't display (edit: fixed display!), made option for opponent's cards to be shown, edited how passing works.

## Jady Lei

### May 22, 2024

took APUSH!!

### May 23, 2024

worked on writing Hand class add/remove methods and added all of the card faces from Playing Cards on Demand.

### May 24, 2024

Started work creating a function that would return if a set was valid. 

### May 27, 2024

Fixed some errors and wrote out rest of function that would return if a set was valid. Also wrote function that was meant to return all valid sets.

### May 28, 2024

Working on fixing functions in Hand.

### May 29, 2024

- got possibleSets to actually return proper sets and trimmed down the amount of sets it returned. (still needs work)
- wrote and which means hopefully finished the strength functions as they seem to work properly on the sets that were properly returned.
- Prev means I also wrote the boolean functions to test for each individual set.

### May 30, 2024

- Another day, another chance to stare at possibleSets and cry.
- started working on the game loop in the java files using the Game and Player classes so there's less clutter in the pde.
  - wrote play function for Player and tossed out idea of making the for loop in a game class. replaced with better accessors that can be called by the processing sketch.

### May 31, 2024

- clear selectedHand when played.
- allow for sets of 0 length
- worked together in class to figure out one of the errors in the displayed cards.
- got the sort working

### June 2, 2024

- display activePlayer and fixed the starting player.
- draw the previously played hand at the center
- various fixes to other functions to get the prev 2 working.

### June 3, 2024
Worked on Oponent actions
### June 4, 2024
Fixed some stuff in another branch and finally got possibleSets to work.
### June 5, 2024
Fixed compareStrength and wrote boolean playable() 
### June 6, 2024
- Merged GameLoop to Main or something similar enough.
### June 7, 2024
- Final plans for the weekend discussed in class. Dealt with some merge conflicts and identified the biggest bugs.
### June 9, 2024
- Created FinalChanges branch to work on final touches
- Fixed deck strength issues and added minor graphical changes to make the displayed cards read better.
### June 10, 2024
- Wrote presentation script and instructions. Polished the game as best we could.
