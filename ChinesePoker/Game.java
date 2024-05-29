import java.util.*;

public class Game{
  ArrayList<Player> players;
  public Hand deck;

  public Game(ArrayList<Player> players){
    this.players = players;
    deck = new Hand();
		deck.addCards(createDeck());

  }

	private static ArrayList<Card> createDeck(){
		ArrayList<Card> cards = new ArrayList<Card>(52);
		String suit = "clover";
		for(int j = 3; j < 16; j++){
			int num = j;
			if(num>13)
				num -= 13;
			cards.add(new Card(suit+num, (j-2), suit));
		}
		 suit = "diamond";
		for(int j = 3; j < 16; j++){
			int num = j;
			if(num>13)
				num -= 13;
			cards.add(new Card(suit+num, j- 2, suit));
		}
		 suit = "heart";
		for(int j = 3; j < 16; j++){
			int num = j;
			if(num>13)
				num -= 13;
			cards.add(new Card(suit+num, (j- 2), suit));
		}
		 suit = "spade";
		for(int j = 3; j < 16; j++){
			int num = j;
			if(num>13)
				num -= 13;
			cards.add(new Card(suit+num, (j- 2), suit));
		}
		return cards;
	}

	private void shuffleDeck(){
		ArrayList<Card> shuffled = new ArrayList<Card>();
		for(int i = 52; i >0; i--){
			int index = (int)(Math.random()*i);
			shuffled.add(deck.removeCard(index));
		}
	//	System.out.println(deck.size() == 0);
		deck.addCards(shuffled);
	//	System.out.println(deck.size());
	}

	public String toString(){
		String result = "";
		for(int i = 0; i < 52; i++){
			result += (deck.getCard(i).getName()) + ", " + deck.getCard(i).getStrength() + "\n";
		}
		return result;
	}
/*	public static void main(String[] args){
		ArrayList<Player> people = new ArrayList<Player>();
		Game test = new Game(people);
		test.shuffleDeck();
		System.out.println(test.toString());
	}
*/
}
