int amount = 600;

float speed;
int speedMax = 45;
int speedMin = 5;
int speedBoost = 50;

Star[] stars = new Star[amount];

void setup()
{
  size(1270, 840);
  for(int i = 0; i < stars.length; i ++)
  {
    stars[i] = new Star();
  }
}

void draw()
{
  // init
  cursor(CROSS);
  background(0);
  translate(width/2, height/2);
  // speed control
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
  // show the stars
  for(int i = 0; i < stars.length; i ++)
  {
    stars[i].update(speed);
    stars[i].show();
  }
}