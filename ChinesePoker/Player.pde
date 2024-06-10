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
  
  public void setSelectedHand(Hand h) {
    selectedHand = h;
  }


  public boolean play(Hand prevSet) {
    if (selectedHand.playable(prevSet) && selectedHand.isPossibleSet()) {
      game.prevSet = selectedHand;
      for (Card c : selectedHand.getHand()) {
        System.out.println(c.getName());
        deck.removeCard(c);
      }
     // selectedHand.getHand().clear();
      selectedHand = new Hand();
      game.passing = false;
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

 /* public boolean ask(){
    ArrayList<Hand> sets = new ArrayList<Hand>();
    if(game.prevSet.size() > 0){
      sets = (getDeck()).possibleSets(game.prevSet.size());
     }else{
       ArrayList<Hand> possible = (getDeck()).possibleSets(1);
       for(Hand possibility: possible){
         sets.add(possibility);
       }
       possible = (getDeck()).possibleSets(2);
       for(Hand possibility: possible){
         sets.add(possibility);
       }
       possible = (getDeck()).possibleSets(5);
       for(Hand possibility: possible){
         sets.add(possibility);
       }
     }
     if(sets.size() == 0)
       return true;
    rect(width/2, height/2, 30, 40);
    text("sure?", width/2, height/2);
    delay(1000);
    return true;
  }*/
 /* 
  void keyPressed(){
    if(key == 'y'){
      
    }
  }
  */
}
