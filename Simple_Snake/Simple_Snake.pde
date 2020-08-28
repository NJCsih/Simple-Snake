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

void setup() {
  //size(xDim*sFac, yDim*sFac); //this needs to manually updated because processing is weird
  size(750, 500);
  createSnake();
}

void draw() {
  update();
  show();

  timer++;
  timer = timer % 20;

  if(timer == 1) {

      update();
      show();
  }


  //there needs to be a thing so that once evrey say 20 frames (or whatever) it updates but still takes input at the other times
  //this could probably be done with a variable
    //var = var % 20
    //if var = 10{
    //  update()
    //  show
    //}
    //var++
}

void show() {
  background(204);
  //color squares
    //add small cutouts to show shape based off neighbors
  //add grid
}

void createSnake() {
  board[xDim/2][yDim/2] = 1;
}

void update() {
  //move head based off headpos, direction, and a number of other things
    //also needs to check for colision
  //set board val based off head pos
  //decrement all board spaces > 0

}
