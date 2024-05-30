import java.util.*;

public class Player{
  String name;
  Hand deck;
  Hand selectedHand;

  public Player(String name, Hand deck){
    this.name = name;
    this.deck = deck;
    selectedHand = new Hand();
  }

  public String getName(){
    return name;
  }

  public Hand getDeck(){
    return deck;
  }

  public Hand getSelectedHand(){
    return selectedHand;
  }
  
  public void play(){
   // if(){
 //     deck.remove(selectedHand.getHand());
 //   }
  }
  
  public void select(Card card){
    selectedHand.addCard(card);
  }

}
