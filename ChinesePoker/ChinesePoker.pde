Game game;

void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
  Player player1 = game.getPlayer(0);

  
    for(int i = 0; i < 13; i++){
      Card card = player1.getDeck().getCard(i);
      image(loadImage(card.cardimage()), width/3 - 50+ (i*40), height - 200, 100, 100*337/240);
    }
    
  ///  image(loadImage(""));
  
  //if(keyPressed){
  //  if(key == CODED){
  //    if(keyCode == ENTER || keyCode== RETURN){
  //      image(loadImage("diamond1.png"), 0, 0);
  //    }
  //  }
  //}
}

void draw(){
 fill(204, 120);
 rect(0, 0, 10, 10);
//display cards (?)
  /*while(game.end() != true){
    for(int i = 0; i < 4; i++){
      game.getPlayer(i).play();  //only move on if key pressed?
    }
  }*/
}

void mouseClicked(){
  int test = (mouseX+ 50 - (width/3)) / 40;
  text(""+test, 50, 50);
  rect(0, 0, width, height);

}
