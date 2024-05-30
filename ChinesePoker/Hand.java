import java.util.*;

public class Hand {
  private ArrayList<Card> hand;

  public Hand() {
    hand = new ArrayList<Card>();
  }

  public Hand(ArrayList<Card> newHand) {
    hand = new ArrayList<Card>();
    hand = (ArrayList<Card>) newHand.clone();
    // hand.addAll(newHand.size(), newHand);
    // this.hand = ArrayList.addAll(hand.size(), hand);
  }

  public int size() {
    return hand.size();
  }

  private boolean addCard(Card card) {
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

  public ArrayList<Card> removeCards(ArrayList<Integer> indexes) {
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

  // public static void main(String[] args){
  // Hand test = new Hand();
  // test.addCard(new Card("", 1, ""));
  // ArrayList<Card> toAdd = new ArrayList<Card>();
  // toAdd.add(new Card("", 1, ""));
  // toAdd.add(new Card("", 2, ""));
  // test.addCards(toAdd);
  // System.out.println(test.toString());

  // ArrayList<Integer> indexes = new ArrayList<Integer>();
  // indexes.add(2);
  // indexes.add(1);
  // indexes.add(0);

  // test.removeCards(indexes);

  // System.out.println(test.toString());

  // }

  private boolean isPossibleSet(ArrayList<Card> set) {
    // assumes set given is of valid lengths 1, 2, 5
    // 1
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

  public ArrayList<Hand> possibleSets(int i, ArrayList<Hand> sets, int size, ArrayList<Card> partial, ArrayList<Card> cardsRemaining) {
    // if (size > cardsRemaining.size()) {
    // return sets;
    // }
    if ( size <= 0 || cardsRemaining.size() == 0) {
      // print testing
          System.out.print("[");
          for (Card c : partial) {
          System.out.print(c.getStrength());
          System.out.print(", ");
          }
          System.out.println("]");
      // end of print testing

      if (isPossibleSet(partial) && partial.size() > 0) {
                      // System.out.print("[");
                      // for (Card c : partial) {
                      //   System.out.print(c.getStrength());
                      //   System.out.print(", ");
                      // }
                      // System.out.println("]");

        sets.add(new Hand(partial));
      }
    } else {
      cardsRemaining.sort(null);
      for (int j = i; j < cardsRemaining.size(); j++) {
        Card c = cardsRemaining.get(j);
        partial.add(c);
        cardsRemaining.remove(j);
        // ArrayList<Card> newPartial = (ArrayList<Card>)partial.clone();
        possibleSets(i + j, sets, size-1, partial, cardsRemaining);
        cardsRemaining.add(j, c);
        partial.remove(c);
      }
    }
    return sets;
  }

  public ArrayList<Hand> possibleSets(ArrayList<Card> cardsRemaining) {
    ArrayList<Hand> all = new ArrayList<Hand>();
    ArrayList<Hand> singles = possibleSets(0, new ArrayList<Hand>(), 1, new ArrayList<Card>(), cardsRemaining);
    // System.out.println(singles.toString());
    for (Hand h : singles) {
      all.add(h);
    }
    if (cardsRemaining.size() >= 2) {
      ArrayList<Hand> doubles = possibleSets(0, new ArrayList<Hand>(), 2, new
      ArrayList<Card>(), cardsRemaining);
      // System.out.println(doubles.toString());
      for (Hand h : doubles) {
      all.add(h);
      }
    }
    if (cardsRemaining.size() >= 5) {
      ArrayList<Hand> sets = possibleSets(0, new ArrayList<Hand>(), 5, new ArrayList<Card>(), cardsRemaining);
      // System.out.println(sets.toString());
      for (Hand h : sets) {
        all.add(h);
      }
    }
    return all;
  }

  public static void main(String[] args) {
    Hand test1 = new Hand();
    test1.addCard(new Card("1", 1, "diamond"));
    test1.addCard(new Card("2", 2, "diamond"));
    test1.addCard(new Card("2", 2, "clover"));
    // test1.addCard(new Card("2", 2, "heart"));
    test1.addCard(new Card("2", 2, "spade"));
    test1.addCard(new Card("3", 3, "spade"));
    test1.addCard(new Card("3", 3, "heart"));
    ArrayList<Hand> testSets = test1.possibleSets(test1.getHand());
    // for (Hand h : testSets) {
    //   System.out.println(h.deckStrength());
    // }
    System.out.println(testSets.toString());
  }

  public int deckStrength(){
    ArrayList<Card> set = this.getHand();
    int thisStrength = 0;
    for(Card card: this.hand){
      int cardStrength = card.getStrength();
      if (card.getSuit().equals("clover")) {
        cardStrength *= 2;
      } else if (card.getSuit().equals("heart")) {
        cardStrength *= 3;
      } else if (card.getSuit().equals("spade")) {
        cardStrength *= 4;
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


  public Hand compareStrength(Hand other){
    if(this.deckStrength() > other.deckStrength())
      return this;
    return other;
  }
//diamond clover heart spades
}
