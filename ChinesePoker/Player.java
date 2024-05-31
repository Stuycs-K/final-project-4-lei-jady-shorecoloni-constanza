import java.util.*;

public class Player {
  String name;
  Hand deck;
  Hand selectedHand;

  public Player(String name, Hand deck) {
    this.name = name;
    this.deck = deck;
    selectedHand = new Hand();
  }

  public String getName() {
    return name;
  }

  public Hand getDeck() {
    return deck;
  }

  public Hand getSelectedHand() {
    return selectedHand;
  }

  public boolean play() {
    if (Hand.isPossibleSet(selectedHand.getHand())) {
      for (Card c : selectedHand.getHand()) {
        deck.removeCard(c);
      }
      return true;
    }
    return false;
  }

  public void select(Card card) {
    selectedHand.addCard(card);
  }

}
