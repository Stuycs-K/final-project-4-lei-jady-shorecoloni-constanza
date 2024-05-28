import java.util.*;

public class Hand{
  private ArrayList<Card> hand;


  public Hand(){
    hand = new ArrayList<Card>();
  }
  public Hand(ArrayList<Card> hand){
    this.hand = hand;
  }

  public int size() {
	   return hand.size();
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
  public ArrayList<Card> getHand(){
    return hand;
  }
  public Card removeCard(int index){
    return hand.remove(index);
  }
  public ArrayList<Card> removeCards(ArrayList<Integer> indexes){
    ArrayList<Card> removed = new ArrayList<Card>(indexes.size());
    for(int i = indexes.size() - 1; i >= 0; i--){
			int index = indexes.get(i);
			Card remove = hand.get(index);
      removed.add(remove);
    }
		for(int i = 0; i < removed.size(); i++){
			hand.remove(removed.get(i));
		}
		return removed;
  }

	public String toString(){
		String result = "[";
		for(int i = 0; i < hand.size(); i++){
			result += (hand.get(i)).getStrength();
			if(i < hand.size() -1)
				result += ", ";
		}
		return result +"]";
	}


	public static void main(String[] args){
		Hand test = new Hand();
		test.addCard(new Card("", 1, ""));
		ArrayList<Card> toAdd = new ArrayList<Card>();
		toAdd.add(new Card("", 1, ""));
		toAdd.add(new Card("", 2, ""));
		test.addCards(toAdd);
		System.out.println(test.toString());


		ArrayList<Integer> indexes = new ArrayList<Integer>();
		indexes.add(2);
		indexes.add(1);
		indexes.add(0);

		test.removeCards(indexes);

		System.out.println(test.toString());

	}

	private boolean isPossibleSet(ArrayList<Card> set) {
		// assumes set given is of valid lengths 1, 2, 5
		// 1
		boolean single=false, pair=false, straight=false, flush=false, house=false, four=false;
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
            int[] strengths = {set.get(0).getStrength(), set.get(1).getStrength(), set.get(2).getStrength(), set.get(3).getStrength(), set.get(4).getStrength()};
            Arrays.sort(strengths);
            if (strengths[4] - strengths[3] == 1 && strengths[3] - strengths[2] == 1 && strengths[2] - strengths[1] == 1 && strengths[1] - strengths[0] == 1) {
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
            if ((strengths[0] == strengths[2] && strengths[3] == strengths[4]) || (strengths[0] == strengths[1] && strengths[2] == strengths[4])) {
                house = true;
            }
            // four
            if (strengths[0] == strengths[3] || strengths[1] == strengths[4]) {
                four = true;
            }
        }

        return (single || pair || straight || flush || house || four);
	}

	public ArrayList<Hand> possibleSets(ArrayList<Hand> sets, int size, ArrayList<Card> partial, ArrayList<Card> cardsRemaining){
		if (size == 0) {
                if (isPossibleSet(hand)) {
                    sets.add(new Hand(partial));
                }
		} else {
			for (Card card : cardsRemaining) {
                partial.add(card);
                cardsRemaining.remove(card);
				possibleSets(sets, size-1, partial, cardsRemaining);
                cardsRemaining.add(card);
			}
		}
		return sets;
	}

  public int deckStrength(){
    int thisStrength = 0;
    for(Card card: this.hand){
      thisStrength += card.getStrength();
    }
    return thisStrength;
  }

  public Hand compareStrength(Hand other){
    int thisStrength = 0;
    for(Card card: this.hand){
      thisStrength += card.getStrength();
    }
    int otherStrength = 0;
    for(Card card: other.hand){
      otherStrength += card.strength();
    }
    if(thisStrength > otherStrength)
      return this;
    return other;
  }
//diamond clover heart spades
}
