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
    if (selectedHand.isPossibleSet()) {
   //   println(""+selectedHand.getHand());
      for (Card c : selectedHand.getHand()) {
        System.out.println(c.getName());
        deck.removeCard(c);
      }
      selectedHand.getHand().clear();
      return true;
    }
    return false;
  }

  public void select(Card card) {
    //println(card.getStrength());
    selectedHand.addCard(card);
    card.changeSelect();
  }

  public void unselect(Card card){
    //println(card.getStrength();
    selectedHand.removeCard(card);
    card.changeSelect();
  }

}
