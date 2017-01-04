int amount = 600;

float speed;
int speedMax = 45;
int speedMin = 5;
int speedBoost = 50;

boolean mouseFlag;

Star[] stars = new Star[amount];

void setup()
{
  // window init
  size(1270, 840);
  cursor(CROSS);
  background(0);
  // smooth();
  
  // instantiate
  for(int i = 0; i < stars.length; i ++)
  {
    stars[i] = new Star();
  }
  
  
}

void draw()
{
  // refresh window
  background(0);
  
  startUp();
  
  mainPart();
}

void startUp()
{
  println("Startup");
}

void mainPart()
{
  println("MainPart");
  // camera set to center
  cameraControl();
  // control the speed by mouse
  speedControl();
  // show the stars
  updateStars();
}

void cameraControl()
{
  translate(width / 2, height / 2);
}

void speedControl()
{
  if(mouseX < (width / 2))
  {
    speed = map(mouseX, 0, (width / 2), speedMin, speedMax);
  }  
  else
  {
    speed = map((mouseX - (width / 2)), 0, (width / 2), speedMax, speedMin);
  }
  // speed boost
  if(mouseButton == LEFT)
  {
    speed += speedBoost;
  }
  if(mouseButton == RIGHT)
  {
    speed = 1;
  }
}

void updateStars()
{
  for(int i = 0; i < stars.length; i ++)
  {
    stars[i].update(speed);
    stars[i].process();
    // stars[i].showBody();
    stars[i].showTail();
  }
}