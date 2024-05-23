import java.util.*;

public class Hand{
  ArrayList<Card> hand;


  public Hand(){
    hand = new ArrayList<Card>();
  }

  private boolean addCard(Card card){
    return hand.add(card);
  }
  public boolean addCards(ArrayList<Card> cards){
    boolean successful = true;
    for (Card card : cards) {
      successful = successful && addCard(card);
    }
    return successful;
  }
  public Card getCard(int index){
    return hand.get(index);
  }
  private Card removeCard(int index){
    return hand.remove(index);
  }
  public ArrayList<Card> removeCards(ArrayList<Integer> indexes){
    ArrayList<Card> removed = new ArrayList<Card>(indexes.size());
    for(int i = indexes.size() - 1; i >= 0; i++){
      removed.add(removed.size(), hand.remove(indexes.get(i)));
    }
  }

}
