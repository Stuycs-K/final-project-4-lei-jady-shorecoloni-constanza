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
  //  textSize(20);

    game.displayCards(display);    
  }
  if(game.end()){
    background(0);
    text("GAME OVER\n" + game.getPlayer(game.getActivePlayerIndex() - 1).getName() + " wins!!", width/2, height/2);
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
  //  card.changeSelect();
  }
}

void keyPressed(){
    if(key == ENTER || key == RETURN){
      if(!game.isStarted()){
        game.started();
      } else {
        if(game.getActivePlayer().equals(game.getPlayer(0))){
          Hand sel = game.getPlayer(0).getSelectedHand();
          if(sel.size() == 0){
            game.pass();
            game.progressGame();
          }
          else if(game.getPlayer(0).play(game.getPrevSet().size())){
            game.setCurrHand(sel);
            game.progressGame();
        //  println(game.getPrevSet());
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
