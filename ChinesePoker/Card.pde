public class Card implements Comparable<Card>{
  private String name;
  private int strength;
  private String suit;
  private boolean selected;
  PImage image;
  
  public Card(String name, int strength, String suit){
    this.name = name;
    this.strength = strength;
    this.suit = suit;
    selected = false;
    image = loadImage("Images/" + name+".png");
  }
  
  public boolean isSelected(){
    return selected;
  }
  
  public void changeSelect(){
    selected = !selected;
  }
  
  public int getStrength(){
    return strength;
  }
  
  public String getName(){
    return name;
  }
  
  public String getSuit(){
    return suit;  
  }
  
  public PImage getImage(){
    return image;
  } 

  // hopefully can be used by a sort method to ort the cards.
  @Override
  public int compareTo(Card other){
    int thisStrength = strength;
    int otherStrength = other.getStrength();
    if (thisStrength == otherStrength) {
      if (suit.equals("clover")) {
        thisStrength *= 2;
      } else if (suit.equals("heart")) {
        thisStrength *= 3;
      } else if (suit.equals("spade")) {
        thisStrength *= 4;
      }
    }
    return thisStrength - otherStrength;
  }

  @Override
  public boolean equals(Object o) {
    Card other = (Card) o;
    return (strength == other.getStrength());
  }
}
