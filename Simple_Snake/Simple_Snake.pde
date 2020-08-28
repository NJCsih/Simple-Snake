//settings for board size, also used to calculate size
//Note: size() needs to be manually updated in setup()
int xDim = 15;
int yDim = 10;
int sFac = 50;
int timer = 0;

int[][] board = new int[xDim][yDim];//what each square on the board is
int[] headPos = new int[2];//head position where [0] -> x axis, [1] -> y axis
int[] direction = new int [2];//direction of snake head, 1-4 maps to north-south clockwise
  //Note: it is a 1d array so that movements can be qued in the order the come in
  //how frame time is converted into timesteps without queing one button press many times needs to be implimented
int[] trigger = new int[4];//this is used in queing inputs,
  //Note: 0-3 maps to up-left clockwise
int[] moveQue = new int[2];//the que for movements, only ques two moves

void setup() {
  //size((xDim*sFac)+1, (yDim*sFac)+1); //this needs to manually updated because processing is weird
  size(751, 501);
  headPos[0] = xDim/2;
  headPos[1] = yDim/2;
  for(int i = 0; i < moveQue.length; i++) {
    moveQue[i] = -1;
  }
}

void draw() {
  update();
  show();

  //this bit
  timer++;
  timer = timer % 20;
  if(timer == 1) {
      update();
      show();
  }

  //when button pressed set trigger++ evrey frame
  //when trigger == 1, que button and set trigger to 2
  //when button un pressed, set trigger to 0

  if(keyPressed) {
    if(key == UP) {//Up pressed
      trigger[0]++;
      println("up pressed");
    }else{//Up not pressed (!released)
      trigger[0] = 0;
    }
    if(key == RIGHT) {//Right pressed
      trigger[1]++;
    }else{//Right not pressed (!released)
      trigger[1] = 0;
    }
    if(key == DOWN) {//Down pressed
      trigger[2]++;
    }else{//Down not pressed (!released)
      trigger[2] = 0;
    }
    if(key == LEFT) {//Left pressed
      trigger[3]++;
    }else{//Left not pressed (!released)
      trigger[3] = 0;
    }
  }
  if(trigger[0] == 1) {
    quePress(0);
  }
  if(trigger[1] == 1) {
    quePress(1);
  }
  if(trigger[2] == 1) {
    quePress(2);
  }
  if(trigger[3] == 1) {
    quePress(3);
  }
}

void quePress(int toQue) {
  //tell which index is the next available -1
  //make that index store whats being qued
  for(int i = 0; i < moveQue.length; i++) {
    if(moveQue[i] == -1) {
      moveQue[i] = toQue;
      break;
    }
  }
}

void show() {
  background(204);

  //color squares
    //add small cutouts to show shape based off neighbors

  //add grid
  for(int x1 = 0; x1 <= width; x1 = x1 + 50) {
    line(x1, 0, x1, height);
  }
  for(int y1 = 0; y1 <= height; y1 = y1 + 50) {
    line(0, y1, width, y1);
  }

  //temp que display
  textSize(32);
  text(moveQue[0], 15, 32);
  text(moveQue[1], 15, 65);
}


void update() {
  //move head based off headpos, and que,
    //needs to shuffle evreything down que
    //also needs to check for colision
  //set board val based off head pos
  //decrement all board spaces > 0

}
