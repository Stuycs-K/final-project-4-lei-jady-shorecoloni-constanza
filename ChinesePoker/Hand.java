import java.util.*;

public class Hand{
  ArrayList<Card> hand;


  public Hand(){
    hand = new ArrayList<Card>();
  }

  public void addCards(Card card){
    hand.add(card);
  }
  public Card getCard(int index){
    return hand.get(index);
  }
  public ArrayList<Card> removeCards(ArrayList<Integer> indexes){
    ArrayList<Card> removed = new ArrayList<Card>(indexes.size());
    for(int i = indexes.size() - 1; i >= 0; i++){
      removed.add(removed.size(), hand.remove(indexes.get(i)));
    }
  }

}
