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
  private Card removeCard(int index){
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
		// doubles
		boolean single=false, pair=false, straight=false, flush=false, house=false;
		if (set.size() == 1) {
			single = true;
		}
		if (set.size() == 2 && set.get(0).getStrength() == set.get(1).getStrength()) {
			pair = true;
		}
		// straights
		// set.sort();
		if ((set.size() == 5) && (set.get(4).getStrength() - set.get(3).getStrength() == 1) && 
							(set.get(3).getStrength() - set.get(2).getStrength() == 1) && 
							(set.get(2).getStrength() - set.get(1).getStrength() == 1) && 
							(set.get(1).getStrength() - set.get(0).getStrength() == 1) ) {
			straight = true;
		}
        if ((set.size() == 5) && (set.get(0).getSuit() == set.get(1).getSuit()) &&
                                (set.get(1).getSuit() == set.get(2).getSuit()) &&
                                (set.get(2).getSuit() == set.get(3).getSuit()) &&
                                (set.get(3).getSuit() == set.get(4).getSuit())) {
            // 
        }

        return (single || pair || straight || flush || house);
	}

	public ArrayList<Hand> possibleSets(ArrayList<Hand> sets, int size, ArrayList partial, Hand cardsRemaining){
		if (size == 0) {
                if (isPossibleSet(hand)) {

                }
			    sets.add(new Hand(partial));
		} else {
			for (Card card : cardsRemaining.getHand()) {
				// possibleSets()
			}
		}
		return sets;
	}	

}
