[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
Chinese Poker
## Group Info
Period 4
Members: Constanza Shore Coloni & Jady Lei
Group Name: Poker, I hardly even know her
## Overview
We want to create a game of Chinese Poker on Processing. A deck of cards is split amongst 4 players, and the first person to get rid of their cards wins. Each card has a strength (int associated with it), with 3 of diamonds being the weakest and the 2 of spades being the strongest. The person with the 3 of diamonds goes first, and can choose the type of cards that can be placed that round. The next person has to play the same combination of cards that are stronger. They keep taking turns until someone places a strong enough card, and the rest of the players fold and the next round starts.
## Instructions
Keybinds:
Enter -> progresses game
d -> displays cards of all decks

Basic Game Loop
Select Cards to play by clicking on them.
Only place valid sets
Singles: 1 card
Doubles: 2 cards with the same value
Sets: 5 cards that either set up a straight(5 consecutive value cards), flush(5 cards of the same suit), house(3 cards of the same value with a Double), or 4 of a kind(self explanatory).
Those are from weakest to strongest and above that would be a straight flush(self explanatory) that would be stronger than the others.
Plays have to be stronger than the previous play
This can be obtained by playing stronger sets or with stronger values or even stronger suits, with spades being the strongest followed by hearts, clovers, and diamonds.
Cycle through turns and play cards at your turn.

## Major Bugs
Occasionally the cards are not removed properly and can be placed twice.
Very occasionally, there is an index out of bounds for the player. A majority of the games do not encounter this error.

## Video Presentation
https://drive.google.com/file/d/1C5WfFh1L-ydR0PuW_tMv0ImeX9loLciK/view?usp=drive_link
