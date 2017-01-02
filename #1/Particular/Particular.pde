int amount = 600;
float speed;
int speedMax = 20;
int speedMin = 1;
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
  speed = map(mouseX, 0, width, speedMin, speedMax);
  background(0);
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i ++)
  {
    stars[i].update(speed);
    stars[i].show();
    stars[i].tail();
  }
}