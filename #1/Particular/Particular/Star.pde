class Star
{
  float x;
  float y;
  float z;
  
  float sx;
  float sy;
  float preZ;
  
  int colour = 255;
  int sizeMax = 16;
  
  Star()
  {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    preZ = z;
  }
  
  void update(float _speed)
  {
    z -= _speed;
    if(z < 0)
    {
      x = random(-width, width);
      y = random(-height, height);
      z = random(width);
      preZ = z;
    }
  }
  
  void show()
  {
    fill(colour);
    noStroke();
    sx = map((x / z), 0, 1, 0, width);
    sy = map((y / z), 0, 1, 0, height);
    float size = map(z, 0, width, sizeMax, 0);
    // ellipse(sx, sy, size, size);  
  }
  
  void tail()
  {
    float px = map((x / preZ), 0, 1, 0, width);
    float py = map((y / preZ), 0, 1, 0, height);
    preZ = z;
    
    stroke(colour);
    line(px, py, sx, sy);
  }
}