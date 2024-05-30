Game game;
ArrayList<PImage> images;

void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
  Player player1 = game.getPlayer(0);

  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 13; j++){
    //  images.add(loadImage(game.getPlayer(i).getDeck().getCard(j).cardimage()));
    }
  }

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
  background(204);
 for(int i = 0; i < game.getPlayer(0).getDeck().size(); i++){
   if(!(game.getPlayer(0).getDeck().getCard(i).isSelected())){
     fill(250);
     rect(width/3 - 50 + (i*40), height - 150, 100, 140*(337/240), 28);
   }
   else{
     fill(250);
     rect(width/3 - 50 + (i*40), height - 210, 100, 140*(337/240), 28);
   }
 }
}

void mouseClicked(){
  int test = ((int)mouseX + 40 - (width/3)) / 40;
  if(mouseY < (height - 210 + 140*337/240) && test >= 0 && test < 13){
    Card card = game.getPlayer(0).getDeck().getCard(test);
    if(card.isSelected()){
      game.getPlayer(0).unselect(card);
    }
    else{
      game.getPlayer(0).select(card);
    }
    card.changeSelect();
  }
  //redraw();
}

void keyPressed(){
  //if(key === CODED){
    if(key == ENTER || key == RETURN || key == 'p'){
      game.getPlayer(0).play();
      redraw();
    }
 // }
}
