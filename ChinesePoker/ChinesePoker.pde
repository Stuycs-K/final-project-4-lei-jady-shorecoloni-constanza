Game game;
//ArrayList<PImage> images;
int test;

void setup(){
  size(1350, 750);
  
  game = new Game();
  game.start();
 }

void draw(){
  background(#000000);
  game.displayCards();
  text(game.getActivePlayerIndex(),10,10);

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
  //if(key === CODED){
    if(key == ENTER || key == RETURN){
      if(!game.isStarted()){
        game.started();
      } else {
        if (game.getActivePlayerIndex() == 0) {
          if (game.getActivePlayer().getSelectedHand().isPossibleSet()) {
            game.progressGame();
          }
        } else {
          game.progressGame();
        }
      }
      //if(game.getPlayer(0).play()){
        
      //}
      redraw();
    }
 // }
}
