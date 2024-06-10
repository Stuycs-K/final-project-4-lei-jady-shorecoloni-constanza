Game game;
boolean display;

void setup(){
  size(1350, 750);
  game = new Game();
  game.start();
  display = false;
 }

void draw(){
  if(!game.end()){  
    background(0);
    game.displayCards(display);    
  }
  if(game.end()){
    background(0);
    text("GAME OVER\n" + game.getPlayer(game.getActivePlayerIndex() - 1).getName() + " wins!!", width/2, height/2);
  }
}

void mouseClicked(){
  int test = ((int)mouseX + 40 - (width/3)) / 40;
  if(mouseY < (height - 210 + 140*337/240) && test >= 0 && test <= 13){
    // if (game.getPlayer(0).getDeck().size() == 1) {
    //   test = 0;
    // }
    if (test == game.getPlayer(0).getDeck().size()) {
      test = test - 1;
    }
    if (test < game.getPlayer(0).getDeck().size()) {
      Card card = game.getPlayer(0).getDeck().getCard(test);
      if(card.isSelected()){
        game.getPlayer(0).unselect(card);
      }
      else{
        game.getPlayer(0).select(card);
      }
    }
  }
}

void keyPressed(){
    if(key == ENTER || key == RETURN){
      if(!game.isStarted()){
        game.started();
      } else {
        if(game.getActivePlayer().equals(game.getPlayer(0))){
          if(game.getPlayer(0).play(game.prevSet)){
            game.progressGame();
          } else {
            if(game.getPlayer(0).getSelectedHand().size() == 0){
              game.pass();
              game.progressGame();
            }else{
              text("Invalid set", width/2, 600);
              delay(600);
            }
          } 
        }else{
         game.play(game.getActivePlayer());
        }
      }
    }
    if(key == 'd'){
      display = !display;
    }
}
