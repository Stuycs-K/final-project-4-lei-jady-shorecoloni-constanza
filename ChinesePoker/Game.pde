import java.util.*;

public class Game{
  ArrayList<Player> players;

  public Hand deck;
  public Hand prevSet;
  private int activePlayer;
  boolean started;
  Card back = new Card("back", 0, "");
  public int pass;
  public boolean passing;
  ArrayList<Player> passed;

  public Game(){
    this.players = new ArrayList<Player>(4);
    deck = new Hand();
    prevSet = new Hand();
    deck.addCards(createDeck());
  //  activePlayer = 0;
    started = false;
    passing = false;
    pass = 0;
    passed = new ArrayList<Player>();
  }
  
  public void displayCards(boolean display){
    if(!started){
      image((new Card("back", 0, "").getImage()), width/2 - 50, height/2 - 88, 100, 140*(337/240));
      textSize(20);
      text("Press ENTER/RETURN to start", width/2 - 115, height/2 - 118);
    }
    else{
      //play (bottom)
      for(int i = 0; i < getPlayer(0).getDeck().size(); i++){
        if(!(getPlayer(0).getDeck().getCard(i).isSelected())){
          image(getPlayer(0).getDeck().getCard(i).getImage(), width/3 - 50 + (i*40), height - 150, 100, 140*(337/240));
         }
        else{
         image(getPlayer(0).getDeck().getCard(i).getImage(), width/3 - 50 + (i*40), height - 210, 100, 140*(337/240));
        }
      }
      textSize(20);
      if(activePlayer != 0)
        text(game.getActivePlayer().getName()+"'s turn",15,30);
      else
        text("Your turn", 15, 30);

      text(getPlayer(0).getName(), width/3 - 50 + (7*40), height - 170);
      for(int i = 0; i < passed.size(); i++){
        if(passed.get(i).equals(getPlayer(0)))
          text("Pass", width/3 -50 + (13*40), height - 170);
      }
      // right
      if(display){
        for(int i = getPlayer(3).getDeck().size() - 1; i >= 0; i--){
          image(getPlayer(3).getDeck().getCard(i).getImage(), width - 220, height - 250 - (i*30), 100, 140*(337/240));
        }
      }
      else{
        for(int i = getPlayer(3).getDeck().size() - 1; i >= 0; i--){
          image(back.getImage(), width - 220, height - 250 - (i*30), 100, 140*(337/240));
        }
      }
      text(getPlayer(3).getName(), width - 110, height - 250 - (3*30));
      for(int i = 0; i < passed.size(); i++){
        if(passed.get(i).equals(getPlayer(3)))
          text("Pass", width - 110, height - 250 - (5*30));
      }
      //left
      if(display){
        for(int i = getPlayer(1).getDeck().size() - 1; i >= 0; i--){
          image(getPlayer(1).getDeck().getCard(i).getImage(), 120, height - 250 - (i*30), 100, 140*(337/240));
        }
      }
      else{  
        for(int i = getPlayer(1).getDeck().size() - 1; i >= 0; i--){
          image(back.getImage(), 120, height - 250 - (i*30), 100, 140*(337/240));
        }
      }
      text(getPlayer(1).getName(), 10, height - 250 - (3*30));
      for(int i = 0; i < passed.size(); i++){
        if(passed.get(i).equals(getPlayer(1)))
          text("Pass", 10, height - 250 - (5*30));
      }
      //top
      if(display){
        for(int i = 0; i < getPlayer(2).getDeck().size(); i++){
          image(getPlayer(2).getDeck().getCard(i).getImage(), width/3 - 50 + (i*40), 50, 100, 140*(337/240));
        }
      }
      else{
        for(int i = 0; i < getPlayer(2).getDeck().size(); i++){
          image(back.getImage(), width/3 - 50 + (i*40), 50, 100, 140*(337/240));
        }
      }
      text(getPlayer(2).getName(), width/3 - 50 + (6*40), 30);
      for(int i = 0; i < passed.size(); i++){
        if(passed.get(i).equals(getPlayer(2)))
          text("Pass", width/3 -50 + (13*40), 30);
      }      
      //cards on table
      for(int i = 0; i < prevSet.size(); i++){
   //     image(prevSet.getCard(i).getImage(), width/3 - 5 + (i*100), height/2, 100, 140*(337/240));
        image(prevSet.getCard(i).getImage(), width / 2 - (i * 20), height / 2, 100, 140*(337/240));
      }
    }

    if(passing == false){
          delay(400);
      passed = new ArrayList<Player>();
    }
  }
  
  public Hand getPrevSet(){
    return prevSet;
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
    Card diamond3 = new Card("diamond3", 1, "diamond");
    if (players.get(1).getDeck().getHand().contains(diamond3)) {
      activePlayer = 1;
    } else if (players.get(2).getDeck().getHand().contains(diamond3)) {
      activePlayer = 2;
    } else if (players.get(3).getDeck().getHand().contains(diamond3)) {
      activePlayer = 3;
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
  public int getActivePlayerIndex() {
    return activePlayer;
  }
  
  public void setCurrHand(Hand hand){
    prevSet = hand;
  }
  public boolean play(Player player){
    ArrayList<Hand> sets = new ArrayList<Hand>();
   if(prevSet.size() > 0){
     sets = (player.getDeck()).possibleSets(prevSet.size());
   } else{
    ArrayList<Hand> possible = (player.getDeck()).possibleSets(1);
    for(Hand possibility: possible){
      sets.add(possibility);
    }

    possible = (player.getDeck()).possibleSets(2);
    for(Hand possibility: possible){
      sets.add(possibility);
    }
    possible = (player.getDeck()).possibleSets(5);
    for(Hand possibility: possible){
      sets.add(possibility);
    }
   }
    if(sets.size() > 0){
      Hand best = new Hand();//sets.get(0);
      int max = 0;
      int min = -1;
      for(int i = 0; i < sets.size();i++){
        if(sets.get(i).deckStrength() > best.deckStrength() && sets.get(i).deckStrength() > prevSet.deckStrength() && (sets.get(i).size() == prevSet.size() || prevSet.size() == 0)){
          best = sets.get(i);
          max = i;
          if (min == -1) {
            min = i;
          }
        }
      }
      best = sets.get((max + min) / 2);
      // int i = 0;
      // while (i < sets.size() && best.deckStrength() > 0) {
      //   if (sets.get(i).deckStrength() > prevSet.deckStrength()) {
      //     best = sets.get(i);
      //   }
      //   i++;
      // }
      if(!best.playable(prevSet)){
      //  text("HIIIIII", width/2, 300);
      //  delay(2000);
        pass();
        progressGame();
        return false;  
      }
      prevSet = best;
      for (Card c : best.getHand()) {
       // System.out.println(c.getName());
        player.getDeck().removeCard(c);
      }
      passing = false;
      progressGame();
      return true;
    }
    pass();
    progressGame();
    return false;
  }
  
  public void deal(){
    ArrayList<Card> cards = new ArrayList<Card>(13);
    for(int i = 0; i < 13; i++){
      cards.add(deck.getCard(i));
    }
    cards.sort(null);
    players.add(new Player("You", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
    for(int i = 13; i< 26; i++){
      cards.add(deck.getCard(i));
    }
    cards.sort(null);
    players.add(new Player("Opponent 1", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
    for(int i = 26; i< 39; i++){
      cards.add(deck.getCard(i));
    }
    cards.sort(null);
    players.add(new Player("Opponent 2", new Hand(cards)));
    
    cards = new ArrayList<Card>(13);
      for(int i = 39; i< 52; i++){
        cards.add(deck.getCard(i));
      }
    cards.sort(null);
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
  
  
  public void pass(){
    if(passing){
      pass++;
      passed.add(getActivePlayer());
    }
    else{
      pass = 1;
      passing = true;
      passed.add(getActivePlayer());

    }
    if(pass == 3){
      passed.add(getActivePlayer());
      pass = 0;
      passing = false;
      prevSet = new Hand();
 //     passed = new ArrayList<Player>();
    }
  }
}
