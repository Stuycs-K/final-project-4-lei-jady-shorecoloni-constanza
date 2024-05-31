Game game;
ArrayList<PImage> images;
boolean started;

void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
  Player player1 = game.getPlayer(0);
  images = new ArrayList<PImage>(52);
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 13; j++){
      images.add(loadImage(game.getPlayer(i).getDeck().getCard(j).cardimage()));
    }
  }
  images.add(loadImage("Images/back.png"));
  started = false;
}

void draw(){
  background(204);
  if(!started){
     image(images.get(52), width/2, height/2, 100, 140*(337/240));
  }
  else{
   for(int i = 0; i < game.getPlayer(0).getDeck().size(); i++){
     if(!(game.getPlayer(0).getDeck().getCard(i).isSelected())){
       fill(250);
       image(images.get(i), width/3 - 50 + (i*40), height - 150, 100, 140*(337/240));
     }
     else{
       fill(250);
       image(images.get(i), width/3 - 50 + (i*40), height - 210, 100, 140*(337/240));
     }
   }
  }
// image(images.get(52), width/2, height/2, 100, 140*(337/240));

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
      if(!started){
        started = true;
      }
      game.getPlayer(0).play();
      redraw();
    }
 // }
}
