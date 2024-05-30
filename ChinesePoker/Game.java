import java.util.*;

public class Game{
  ArrayList<Player> players;
  public Hand deck;
 // ArrayList<PImage> cardImgs;

  public Game(){
    this.players = new ArrayList<Player>(4);
    deck = new Hand();
		deck.addCards(createDeck());

  }
  
  public Player getPlayer(int index){
    return players.get(index);
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

  public void start(){
    shuffleDeck();
    deal();
	int active = 0;
	Card diamond3 = new Card("diamond3", 1, "diamond");
	if (players.get(1).getDeck().getHand().contains(diamond3)) {
		active = 1;
	} else if (players.get(2).getDeck().getHand().contains(diamond3)) {
		active = 2;
	} else if (players.get(3).getDeck().getHand().contains(diamond3)) {
		active = 3;
	}
	while (!end()) {
		active %= 4;
		active ++;
	}
  }

  //public void displayCards(){
  // for(int i = 0; i < 13; i++){
  //    Card card = players.get(i).getDeck().getCard(i);
  //    cardImgs.add(loadImage(card.cardimage()));
  //  }
  //}

  public void deal(){
    ArrayList<Card> cards = new ArrayList<Card>(13);
    for(int i = 0; i < 13; i++){
      cards.add(deck.getCard(i));
    }
    players.add(new Player("You", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
    for(int i = 13; i< 26; i++){
      cards.add(deck.getCard(i));
    }
    players.add(new Player("Opponent 1", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
    for(int i = 26; i< 39; i++){
      cards.add(deck.getCard(i));
    }
    players.add(new Player("Opponent 2", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
    for(int i = 39; i< 52; i++){
      cards.add(deck.getCard(i));
    }
    players.add(new Player("Opponent 3", new Hand(cards)));
  }

  public boolean end(){
    for(int i = 0; i < 4; i++){
      if(players.get(i).getDeck().size() == 0){
        return true;
      }
    }
    return false;
  }
/*	public static void main(String[] args){
		ArrayList<Player> people = new ArrayList<Player>();
		Game test = new Game(people);
		test.shuffleDeck();
		System.out.println(test.toString());
	}
*/
}
