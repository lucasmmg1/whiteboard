int RESOLUTION = 5;

int[][] grid;
int cols;
int rows;

void setup()
{
  size(400, 400);
  cols = width / RESOLUTION;
  rows = height / RESOLUTION;
  grid = make2DArray(cols, rows);
}

void draw()
{  
  background(255);
  noStroke();
  
  for (int i = 0; i < cols; i++)
  { 
    for (int j = 0; j < rows; j++)
    {
      fill(255 - grid[i][j]*255);
      square(i * RESOLUTION, j * RESOLUTION, RESOLUTION);
    }
  }
  
  int[][] nextGrid = make2DArray(cols, rows);
  for (int i = 0; i < cols; i++)
  { 
    for (int j = 0; j < rows; j++)
    {
      int current = grid[i][j];
      if (current == 1)
      {
        if (j + 1 >= rows)
        {
          nextGrid[i][j] = 1;
          break;
        }
        int below = grid[i][j+1];
        if (below == 0)
        {
          nextGrid[i][j+1] = 1;
          break;
        }
        
        if (i - 1 < 0)
        {
          nextGrid[i][j] = 1;
          break;
        }
        int belowL = grid[i-1][j+1];
        if (belowL == 0)
        {
          nextGrid[i-1][j+1] = 1;
          break;
        }

        if (i + 1 >= cols)
        {
          nextGrid[i][j] = 1;
          break;
        }
        int belowR = grid[i+1][j+1];
        if (belowR == 0)
        {
          nextGrid[i+1][j+1] = 1;
          break;
        }
      }
    }
  }
}
void mouseDragged()
{
  int col = floor(mouseX / RESOLUTION);
  int row = floor(mouseY / RESOLUTION);
  
  if ((col < 0 || col >= cols) || (row < 0) || (row >= rows)) return;
  grid[col][row] = 1;
}

int[][] make2DArray(int cols, int rows)
{
  int[][] arr = new int[cols][];
  for (int i = 0; i < arr.length; i++)
  {
    arr[i] = new int[rows];
    for (int j = 0; j < arr[i].length; j++)
      arr[i][j] = 0;
  } 
  return arr;
}
