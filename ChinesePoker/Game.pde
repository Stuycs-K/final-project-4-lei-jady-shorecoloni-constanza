import java.util.*;

public class Game{
  ArrayList<Player> players;
  public Hand deck;
  private int activePlayer;
  boolean started;
  Card back = new Card("back", 0, "");

  public Game(){
    this.players = new ArrayList<Player>(4);
    deck = new Hand();
    deck.addCards(createDeck());
    activePlayer = 0;
    started = false;
  }
  
  public void displayCards(){
    if(!started){
      image((new Card("back", 0, "").getImage()), width/2, height/2, 100, 140*(337/240));
    }
    else{
      //play (bottom)
      Player display = players.get(0);
      for(int i = 0; i < 13; i++){
        if(!(display.getDeck().getCard(i).isSelected())){
          image(display.getDeck().getCard(i).getImage(), width/3 - 50 + (i*40), height - 150, 100, 140*(337/240));
         }
        else{
         image(display.getDeck().getCard(i).getImage(), width/3 - 50 + (i*40), height - 210, 100, 140*(337/240));
        }
      }
      textSize(20);
      text(getPlayer(0).getName(), width/3 - 50 + (7*40), height - 170);
      // right
      for(int i = 0; i < getPlayer(3).getDeck().size(); i++){
        image(back.getImage(), width - 220, height - 250 - (i*30), 100, 140*(337/240));
      }
      text(getPlayer(3).getName(), width - 110, height - 250 - (3*30));
      //left
      for(int i = 0; i < getPlayer(1).getDeck().size(); i++){
        image(back.getImage(), 120, height - 250 - (i*30), 100, 140*(337/240));
      }
      text(getPlayer(1).getName(), 10, height - 250 - (3*30));
      //top
      for(int i = 0; i < getPlayer(2).getDeck().size(); i++){
        image(back.getImage(), width/3 - 50 + (i*40), 50, 100, 140*(337/240));
      }
      text(getPlayer(2).getName(), width/3 - 50 + (6*40), 30);
    }
  }
  
  public Player getPlayer(int index){
    return players.get(index);
  }
  private ArrayList<Card> createDeck(){
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
    deck.addCards(shuffled);
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
  }
  
  public void started(){
    started = true;
  }
  public boolean isStarted(){
    return started;
  }
  
  public void progressGame() {
  activePlayer ++;
  activePlayer %= 4;
  }
  public Player getActivePlayer() {
  return players.get(activePlayer);
  }


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
/*  public static void main(String[] args){
    ArrayList<Player> people = new ArrayList<Player>();
    Game test = new Game(people);
    test.shuffleDeck();
    System.out.println(test.toString());
  }
*/
}
