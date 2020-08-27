//settings for board size, also used to calculate size
//Note: size() needs to be manually updated in setup()
int xDim = 15;
int yDim = 10;
int sFac = 50;

int[][] board = new int[xDim][yDim];
int[] headPos = new int[2];//head position where [0] -> x axis, [1] -> y axis
int[] direction = new int [2];//direction of snake head, 1-4 maps to north-south clockwise
  //Note: it is a 1d array so that movements can be qued in the order the come in
  //how frame time is converted into timesteps without queing one button press many times needs to be implimented

void setup() {
  //size(xDim*sFac, yDim*sFac); //this needs to manually updated because processing is weird
  size(750, 500);
}

void draw() {
  //move head but keep t-1 headPos the same value
  //decrement all board spaces > 0
  show();
}

void show() {
  background(204);
  //color squares
    //add small cutouts to show shape based off neighbors
  //add grid
}

void createSnake() {
  board[ceil(xDim/2), ceil(yDim/2)] = 1
}
