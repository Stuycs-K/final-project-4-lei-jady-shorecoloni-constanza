Game game;
//ArrayList<PImage> images;
int test;

void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
 }

void draw(){
  if(frameCount % 70 == 0 && !game.end()){  
    background(204);
    game.displayCards();
    
    if(!game.getActivePlayer().equals(game.getPlayer(0))){
      game.play(game.getActivePlayer());
    }
  }
  if(game.end()){
    background(0);
    text("GAME OVER", width/2, height/2);
  }
}

void mouseClicked(){
  test = ((int)mouseX + 40 - (width/3)) / 40;
  if(mouseY < (height - 210 + 140*337/240) && test >= 0 && test < 13){
    Card card = game.getPlayer(0).getDeck().getCard(test);
    if(card.isSelected()){
      game.getPlayer(0).unselect(card);
    }
    else{
      game.getPlayer(0).select(card);
    }
  //  card.changeSelect();
  }
  //redraw();
}

void keyPressed(){
    if(key == ENTER || key == RETURN){
      if(!game.isStarted()){
        game.started();
      }
      if(game.getActivePlayer().equals(game.getPlayer(0))){
        Hand sel = game.getPlayer(0).getSelectedHand();
        if(game.getPlayer(0).play()){
          game.setCurrHand(sel);
          game.progressGame();
        }
      }
    }
}
