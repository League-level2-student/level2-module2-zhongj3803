//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int x;
  int y;

  // Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    this.x=x;
    this.y=y;
  }
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment segment;
int foodX;
int foodY;
int direction=UP;
int foodEaten=0;
ArrayList<Segment> allSegments =new ArrayList<Segment>();


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  segment = new Segment(250,250);
  frameRate(20);
  dropFood();
}

void dropFood() {
  //Set the food in a new random location
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(23, 43, 54);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(255, 0, 0);
  rect(foodX,foodY,10,10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0,255,0);
  rect(segment.x,segment.y,10,10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
  for (Segment s : allSegments){
    rect(s.x,s.y,10,10);

  }
  
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  allSegments.add(new Segment(segment.x,segment.y));
  allSegments.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (Segment s:allSegments){
    if (s.x==segment.x && s.y==segment.y){
      foodEaten=0;
      allSegments=new ArrayList<Segment>();
      allSegments.add(new Segment(segment.x,segment.y));
      break;
    }
    }
  }




//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (keyCode==UP && direction!=DOWN){
    direction=UP;
  }
  if (keyCode==DOWN && direction!=UP){
  direction=DOWN;
  }
   if (keyCode==LEFT && direction!=RIGHT){
   direction=LEFT;
  }
  if (keyCode==RIGHT && direction!=LEFT){
    direction=RIGHT;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.

  
  switch(direction) {
   case UP:
   segment.y-=10;
   break;
   case DOWN:
segment.y+=10;   
break;
   case LEFT:
   segment.x-=10;
   break;
   case RIGHT:
   segment.x+=10;
   break;
   }
  checkBoundaries();
}

void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
  if (segment.x<0){
    segment.x=490;
  }
  if (segment.x>490){
    segment.x=0;
  }
  if (segment.y<10){
    segment.y=500;
  }
  if (segment.y>500){
    segment.y=10;
  }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if (foodX==segment.x && foodY==segment.y){
    foodEaten++;
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
    allSegments.add(new Segment(segment.x,segment.y));
}
}
