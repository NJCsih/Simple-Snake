//settings for board size, also used to calculate size
//Note: size() needs to be manually updated in setup()
int xDim = 15;
int yDim = 10;
int sFac = 50;

int[][] board = new int[xDim][yDim];

void setup() {
  //size(xDim*sFac, yDim*sFac); //this needs to manually calculated and updated because processing is weird
  size(750, 500);
}

void draw() {
  show();
}

void show() {
  //background
  //color squares
    //add small cutouts to shaoe it
  //add grid
}
