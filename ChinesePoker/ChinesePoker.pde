Game game;
//int hi = 12;
void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
  Player player1 = game.getPlayer(0);

  
  //  for(int i = 0; i < 13; i++){
  //    Card card = player1.getDeck().getCard(i);
  //    image(loadImage(card.cardimage()), width/3 - 50+ (i*40), height - 200, 100, 100*337/240);
  //  }
    
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
 for(int i = 0; i < 13; i++){
   if(!(game.getPlayer(0).getDeck().getCard(i).isSelected())){
     fill(250);
     rect(width/3 - 50 + (i*40), height - 150, 100, 140*(337/240), 28);
   }
   else{
     fill(250);
     rect(width/3 - 50 + (i*40), height - 210, 100, 140*(337/240), 28);
   }
 }
//display cards (?)
  /*while(game.end() != true){
    for(int i = 0; i < 4; i++){
      game.getPlayer(i).play();  //only move on if key pressed?
    }
  }*/
}
/*
void mouseClicked(){
  int test = (mouseX+ 50 - (width/3)) / 40;
  text(""+test, 50, 50);
  rect(0, 0, width, height);

}*/

void mouseClicked(){
  int test = ((int)mouseX + 50 - (width/3)) / 40;
 // rect(mouseX, mouseY, test, test);
// if(game.getPlayer(0).getDeck().getCard(test).isSelected()){
   game.getPlayer(0).getDeck().getCard(test).changeSelect();
 //}
 //hi++;
 redraw();
}
