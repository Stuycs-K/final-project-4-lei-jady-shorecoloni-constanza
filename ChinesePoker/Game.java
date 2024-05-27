import java.util.*;

public class Game{
  ArrayList<Player> players;
  Hand deck;

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
			cards.add(new Card(suit+num, j-2, suit));
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
			cards.add(new Card(suit+num, j- 2, suit));
		}
		 suit = "spade";
		for(int j = 3; j < 16; j++){
			int num = j;
			if(num>13)
				num -= 13;
			cards.add(new Card(suit+num, j- 2, suit));
		}
		return cards;
	}
	
	public static void main(String[] args){
		ArrayList<Card> test = createDeck();
		for(int i = 0; i < test.size(); i++){
			System.out.println(test.get(i).getName() + ", " + test.get(i).getStrength());
		}
	}
}
