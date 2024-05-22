public class Card{
  private String name;
  private int strength;
  private String suit;
  
  Card(String name, int strength, String suit){
    this.name = name;
    this.strength = strength;
    this.suit = suit;
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
  
  public string cardimage(){
    return "" + strength + suit + ".png";
  } 
  
}
