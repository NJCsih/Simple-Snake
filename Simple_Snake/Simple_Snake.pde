//settings for board size, also used to calculate size
//Note: size() needs to be manually updated in setup()
int xDim = 15;
int yDim = 10;
int sFac = 50;
int timer = 0;

int[][] board = new int[xDim][yDim];//what each square on the board is
int[] headPos = new int[2];//head position where [0] -> x axis, [1] -> y axis
int[] trigger = new int[5];//this is used in queing inputs,
//Note: 0-3 maps to up-left clockwise
int[] moveQue = new int[5];//the que for movements, only ques two moves

void setup() {
  //size((xDim*sFac)+1, (yDim*sFac)+1); //this needs to manually updated because processing
  size(751, 501);
  headPos[0] = (xDim/2)*sFac;
  headPos[1] = (yDim/2)*sFac;
  for (int i = 0; i < moveQue.length; i++) {
    moveQue[i] = -1;
  }
  println("");
  println(moveQue.length);
}

void draw() {
  update();
  show();

  //this bit
  timer++;
  timer = timer % 30;
  if (timer == 1) {
    update();
    show();
  }

  //when button pressed set trigger++ evrey frame
  //when trigger == 1, que button and set trigger to 2
  //when button un pressed, set trigger to 0

  int i;
  if (keyPressed) {
    //-------------------------------------------------------------------------------------------------
    i = 0;
    if (keyCode == UP) {//Up pressed
      if (trigger[i] == 0) {//if its the first frame that this button is pressed
        trigger[i] = 1;//set trigger to 1, stopping above from running and triggering quePress
      }
    } else {//Up not pressed (!released)
      trigger[i] = 0;
    }
    //-------------------------------------------------------------------------------------------------
    i = 1;
    if (keyCode == RIGHT) {//Right pressed
      if (trigger[i] == 0) {//if its the first frame that this button is pressed
        trigger[i] = 1;//set trigger to 1, stopping above from running and triggering quePress
      }
    } else {//Up not pressed (!released)
      trigger[i] = 0;
    }
    //-------------------------------------------------------------------------------------------------
    i = 2;
    if (keyCode == DOWN) {//Down pressed
      if (trigger[i] == 0) {//if its the first frame that this button is pressed
        trigger[i] = 1;//set trigger to 1, stopping above from running and triggering quePress
      }
    } else {//Up not pressed (!released)
      trigger[i] = 0;
    }
    //-------------------------------------------------------------------------------------------------
    i = 3;
    if (keyCode == LEFT) {//Left pressed
      if (trigger[i] == 0) {//if its the first frame that this button is pressed
        trigger[i] = 1;//set trigger to 1, stopping above from running and triggering quePress
      }
    } else {//Up not pressed (!released)
      trigger[i] = 0;
    }
    //-------------------------------------------------------------------------------------------------

    i = 4;
    if (key== ' ') {//Left pressed
      if (trigger[i] == 0) {//if its the first frame that this button is pressed
        trigger[i] = 1;//set trigger to 1, stopping above from running and triggering quePress
      }
    } else {//Up not pressed (!released)
      trigger[i] = 0;
    }
    //---------------------
  }
  //-------------------------------------------------------------------------------------------------
  i = 0;
  if (trigger[i] == 1) {
    trigger[i] = 2;
    quePress(i);
  }
  //-------------------------------------------------------------------------------------------------
  i = 1;
  if (trigger[i] == 1) {
    trigger[i] = 2;
    quePress(i);
  }
  //-------------------------------------------------------------------------------------------------
  i = 2;
  if (trigger[i] == 1) {
    trigger[i] = 2;
    quePress(i);
  }
  //-------------------------------------------------------------------------------------------------
  i = 3;
  if (trigger[i] == 1) {
    trigger[i] = 2;
    quePress(i);
  }
  i = 4;
  if (trigger[i] == 1) {
    trigger[i] = 2;
    moveDownQue();
  }
  //-------------------------------------------------------------------------------------------------
}

void quePress(int toQue) {
  //tell which index is the next available -1
  //make that index store whats being qued
  for (int i = 0; i < moveQue.length; i++) {
    if (moveQue[i] == -1) {
      moveQue[i] = toQue;
      println("mvq[" + i + "] = " + toQue + ";");
      break;
    }
  }
}

void show() {
  background(204);

  //temp show head //Note: head is what causes squares, not a square
  fill(0, 0, 255);
  circle(headPos[0], headPos[1], sFac/2);
  fill(0);
  //color squares
  //add small cutouts to show shape based off neighbors

  //add grid
  for (int x1 = sFac/2; x1 <= width+sFac; x1 = x1 + 50) {
    line(x1, 0, x1, height);
  }
  for (int y1 = sFac/2; y1 <= height+sFac; y1 = y1 + 50) {
    line(0, y1, width, y1);
  }

  //temp que display
  textSize(32);
  {
    int i;
    for (i = 0; i < moveQue.length; i++) {
      text(moveQue[i], 15, (i*32)+32);
    }
    text(timer, 15, (i*32)+32);
  }
}


void update() {
  //move head based off headpos, and que,
  //needs to shuffle evreything down que
  //also needs to check for colision
  //set board val based off head pos
  //decrement all board spaces > 0
}

void moveDownQue() {
  for (int j = 0; j < moveQue.length; j++) {
    println("mvq[" + j + "] = " + moveQue[j]);
  }
  for (int i = 0; i < (moveQue.length - 1); i++) {
    int next = i++;
    println("mvq[" + next + "] = mvq[" + i + "];");
    moveQue[next] = moveQue[i];
    if (moveQue[next] == -1) {//I dont understand why this if statment and contents work so that good
      println("mvq[" + (i - 1) + "] = -1");//but it does so whatever i guess
      moveQue[(i - 2)] = -1;
    }
  }
}
