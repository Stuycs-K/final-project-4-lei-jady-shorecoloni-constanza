import java.util.*;

public class Hand {
  private ArrayList<Card> hand;

  public Hand() {
    hand = new ArrayList<Card>();
  }

  public Hand(ArrayList<Card> newHand) {
    hand = new ArrayList<Card>();
    for (Card c : newHand) {
        hand.add(c);
      }
  }

  public int size() {
    return hand.size();
  }

  public boolean addCard(Card card){
    return hand.add(card);
  }

  public boolean addCards(ArrayList<Card> cards) {
    boolean successful = true;
    for (Card card : cards) {
      successful = successful && addCard(card);
    }
    return successful;
  }

  public Card getCard(int index) {
    return hand.get(index);
  }

  public ArrayList<Card> getHand() {
    return hand;
  }

  public Card removeCard(int index) {
    return hand.remove(index);
  }
  public Card removeCard(Card c) {
    hand.remove(c);
    return c;
  }

  public void removeCard(ArrayList<Card> cards){
    for(int i = 0; i < cards.size(); i++){
      hand.remove(cards.get(i));
    }
 //   return card;
  }



  public ArrayList<Card> removeCards(ArrayList<Integer> indexes){
    ArrayList<Card> removed = new ArrayList<Card>(indexes.size());
    for (int i = indexes.size() - 1; i >= 0; i--) {
      int index = indexes.get(i);
      Card remove = hand.get(index);
      removed.add(remove);
    }
    for (int i = 0; i < removed.size(); i++) {
      hand.remove(removed.get(i));
    }
    return removed;
  }

  public String toString() {
    String result = "[";
    for (int i = 0; i < hand.size(); i++) {
      result += (hand.get(i)).getStrength();
      if (i < hand.size() - 1)
        result += ", ";
    }
    return result + "]";
  }

  public boolean isPossibleSet() { //static
    // assumes set given is of valid lengths 1, 2, 5
    // 1
    ArrayList<Card> set = this.getHand();
    if (set.size() == 0) {
      return true;
    }
    boolean single = false, pair = false, straight = false, flush = false, house = false, four = false;
    if (set.size() == 1) {
      single = true;
    }
    // 2
    else if (set.size() == 2 && set.get(0).getStrength() == set.get(1).getStrength()) {
      pair = true;
    }
    // 5
    else if (set.size() == 5) {
      // straights
      int[] strengths = { set.get(0).getStrength(), set.get(1).getStrength(), set.get(2).getStrength(),
          set.get(3).getStrength(), set.get(4).getStrength() };
      Arrays.sort(strengths);
      if (strengths[4] - strengths[3] == 1 && strengths[3] - strengths[2] == 1 && strengths[2] - strengths[1] == 1
          && strengths[1] - strengths[0] == 1) {
        straight = true;
      }
      // flush
      if ((set.size() == 5) && (set.get(0).getSuit().equals(set.get(1).getSuit())) &&
          (set.get(1).getSuit().equals(set.get(2).getSuit())) &&
          (set.get(2).getSuit().equals(set.get(3).getSuit())) &&
          (set.get(3).getSuit().equals(set.get(4).getSuit()))) {
        flush = true;
      }
      // house
      if ((strengths[0] == strengths[2] && strengths[3] == strengths[4])
          || (strengths[0] == strengths[1] && strengths[2] == strengths[4])) {
        house = true;
      }
      // four
      if (strengths[0] == strengths[3] || strengths[1] == strengths[4]) {
        four = true;
      }
    }

    return (single || pair || straight || flush || house || four);
  }

  public ArrayList<Hand> possibleSets(int i, ArrayList<Hand> sets, int size, Hand partial, ArrayList<Card> cardsRemaining) {
    if ( size <= 0 ) {
      if (partial.isPossibleSet()) {
        sets.add(new Hand(partial.getHand()));
      }
    } else {
      cardsRemaining.sort(null);
      for (int j = i; j < cardsRemaining.size(); j++) {
        Card c = cardsRemaining.get(j);
        partial.addCard(c);
        possibleSets(j+1, sets, size-1, partial, cardsRemaining);
        partial.removeCard(c);
      }
    }
    return sets;
  }

  public ArrayList<Hand> possibleSets(int num) {
    ArrayList<Card> cardsRemaining = this.getHand();
    if (cardsRemaining.size() > num) {
      return possibleSets(0, new ArrayList<Hand>(), num, new Hand(), cardsRemaining);
    } else {
      return new ArrayList<Hand>();
    }
  }

  public int deckStrength(){
    ArrayList<Card> set = this.getHand();
    int thisStrength = 0;
    for(Card card: this.hand){
      int cardStrength = card.getStrength();
      if (card.getSuit().equals("clover")) {
        cardStrength += 1;
      } else if (card.getSuit().equals("heart")) {
        cardStrength += 2;
      } else if (card.getSuit().equals("spade")) {
        cardStrength += 3;
      }
      thisStrength += cardStrength;
    }
    if (this.hand.size() == 5) {
      int[] strengths = { set.get(0).getStrength(), set.get(1).getStrength(), set.get(2).getStrength(), set.get(3).getStrength(), set.get(4).getStrength() };
      Arrays.sort(strengths);
      if (isStraight(strengths)) {
        thisStrength *= 2;
      }
      if (isFlush()) {
        thisStrength *= 3;
      }
      if (isHouse(strengths)) {
        thisStrength *= 4;
      }
      if (isFour(strengths)) {
        thisStrength *= 5;
      }
    }
    return thisStrength;
  }
  // testing for particular sets (redundant, i know, but it should work)
  private boolean isStraight(int[] strengths) {
    return (strengths[4] - strengths[3] == 1 && strengths[3] - strengths[2] == 1 && strengths[2] - strengths[1] == 1 && strengths[1] - strengths[0] == 1);
  }
  private boolean isFlush() {
    return ((hand.size() == 5) && (hand.get(0).getSuit().equals(hand.get(1).getSuit())) &&
          (hand.get(1).getSuit().equals(hand.get(2).getSuit())) &&
          (hand.get(2).getSuit().equals(hand.get(3).getSuit())) &&
          (hand.get(3).getSuit().equals(hand.get(4).getSuit())));
  }
  private boolean isHouse(int[] strengths) {
    return ((strengths[0] == strengths[2] && strengths[3] == strengths[4]) || (strengths[0] == strengths[1] && strengths[2] == strengths[4]));
  }
  private boolean isFour(int[] strengths) {
    return (strengths[0] == strengths[3] || strengths[1] == strengths[4]);
  }


  public int compareStrength(Hand other){
    return this.deckStrength() - other.deckStrength();
  }
//diamond clover heart spades
  public boolean playable(Hand other) {
    if (this.size() == 1 && other.size() == 1) {
      return this.getCard(0).compareTo(other.getCard(0)) > 0;
    }
    return (other.size() == 0 || this.compareStrength(other) > 0 && this.size() == other.size());
  }
}
