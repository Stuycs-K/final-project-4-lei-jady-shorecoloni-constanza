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
     for(Card card : selectedHand.getHand()){
       deck.removeCard(card);
     }
     selectedHand = new Hand();
     // deck.removeCard(selectedHand.getHand());
 //   }
  }
  
  public void select(Card card){
    selectedHand.addCard(card);
    card.changeSelect();
  }
  
  public void unselect(Card card){
    selectedHand.removeCard(card);
    card.changeSelect();
  }

}
