class Star
{
  float x;
  float y;
  float z;
  
  int colour = 255;
  int sizeMax = 16;
  
  Star()
  {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }
  
  void update(float _speed)
  {
    z -= _speed;
    if(z < 0)
    {
      z = random(width);
      x = random(-width, width);
      y = random(-height, height);
    }
  }
  
  void show()
  {
    fill(colour);
    noStroke();
    float sx = map((x / z), 0, 1, 0, width);
    float sy = map((y / z), 0, 1, 0, height);
    float size = map(z, 0, width, sizeMax, 0);
    ellipse(sx, sy, size, size);
  }
}