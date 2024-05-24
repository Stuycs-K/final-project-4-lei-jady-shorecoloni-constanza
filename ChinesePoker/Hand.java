import java.util.*;

public class Hand{
  private ArrayList<Card> hand;


  public Hand(){
    hand = new ArrayList<Card>();
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

	private boolean isPossibleSet(Hand set) {
		// assumes set given is of valid lengths 1, 2, 5
		// doubles
		if (set.size() = 1) {
			return true;
		}
		if (set.size() == 2 && set.get(0).getStrength() == set.get(1).getStrength) {
			return true;
		}
		// straights
		set.sort();
		if (set.get()) {
			// 
		}
	}

	public ArrayList<Hand> possibleSets(ArrayList<Hand> sets, int size, Hand partial, Hand cardsRemaining){
		if (size == 0) {
			sets.add(partial);
		} else {
			for (Card card : cardsRemaining) {
				possibleSets()
			}
		}
		return sets;
	}	

}
