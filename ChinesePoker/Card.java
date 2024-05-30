public class Card implements Comparable<Card>{
  private String name;
  private int strength;
  private String suit;
  private boolean selected;
  
  public Card(String name, int strength, String suit){
    this.name = name;
    this.strength = strength;
    this.suit = suit;
    selected = false;
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
  
  public String cardimage(){
    return "Images/" + name+".png";
  } 

  // hopefully can be used by a sort method to ort the cards.
  @Override
  public int compareTo(Card other){
    return strength - other.getStrength();
  }

  
}
