Player player1;
Player player2;
Player player3;
Player player4;

void setup(){
  size(1350, 750);
  
  Game game = new Game();
  game.start();
  player1 = game.getPlayer(0);
    player2 = game.getPlayer(1);
    player3 = game.getPlayer(2);
    player4 = game.getPlayer(3);
  
    for(int i = 0; i < 13; i++){
      Card card = player1.getDeck().getCard(i);
      image(loadImage(card.cardimage()), width/3 - 50+ (i*40), height - 200, 100, 100*337/240);
    }
  
  //if(keyPressed){
  //  if(key == CODED){
  //    if(keyCode == ENTER || keyCode== RETURN){
  //      image(loadImage("diamond1.png"), 0, 0);
  //    }
  //  }
  //}
}
