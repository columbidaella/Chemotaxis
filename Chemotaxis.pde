Bacteria[] colony;
Food yum;
int foodX, foodY = 0;
boolean foodShown = false;
int foodEaten = 0;
void setup(){
  size(800,800);
  frameRate(100);
  colony = new Bacteria[10];
  for(int i = 0; i < 9; i++){
    colony[i] = new Bacteria();
  }
  yum = new Food();
}
void draw(){
  background(0);
  noStroke();
  for(int i = 0; i < 9; i++){
  colony[i].walk();
  colony[i].show();
  if(foodShown){
  yum.show();
  if(foodEaten>48){
  foodShown = false;
  foodEaten = 0;
  }
  }
  }
}
class Bacteria{
  float myX, myY;
  int myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  float mySpeed = ((int)(Math.random()*11)*0.1)+0.5;
  int ownFood = 0;
  Bacteria(){
    myX = 400;
    myY = 400;
  }
  void walk(){
    if(foodShown){
      if(foodX>myX){
    myX = myX+((int)(Math.random()*3)-0.5)*mySpeed;}
    else{myX = myX+((int)(Math.random()*3)-1.5)*mySpeed;}
      if(foodY>myY){
    myY = myY+((int)(Math.random()*3)-0.5)*mySpeed;}
  else{myY = myY+((int)(Math.random()*3)-1.5)*mySpeed;}}
    else{
    myX = myX+((int)(Math.random()*3)-1)*mySpeed;
    myY = myY+((int)(Math.random()*3)-1)*mySpeed;}
    if(get((int)myX,(int)myY) == color(0,200,50)){
      foodEaten++;
      ownFood++;
   }
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,10+ownFood,10+ownFood);
  }
}
class Food{
  boolean myMouse = false;
  Food(){}
  void show(){
    fill(0,200,50);
    ellipse(foodX,foodY,50-(foodEaten/5),50-(foodEaten/5));}
}
void mousePressed(){
foodShown = true;
foodX = mouseX;
foodY = mouseY;
}
