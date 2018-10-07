class Particular {
    
    float x;
    float y;
    float z;
    
    float sx;
    float sy;
    float px;
    float py;
    float pz;
    
    float size = 10; 
    int colour = 255;
    int sizeMin = 0;
    int sizeMax = 16;
    
    Particular() {

      x = random(-width, width);
      y = random(-height, height);
      z = random(width);
      pz = z;
    }
    
    void update(float _speed) {
      
      z -= _speed;
      if(z < 0) {
        x = random(-width, width);
        y = random(-height, height);
        z = random(width);
        pz = z;
      }
    }
    
    void process() {
      // the body
      sx = map((x / z), 0, 1, 0, width);
      sy = map((y / z), 0, 1, 0, height);
      size = map(z, 0, width, sizeMax, sizeMin);
      
      // the tail
      px = map((x / pz), 0, 1, 0, width);
      py = map((y / pz), 0, 1, 0, height);
      pz = z;
    }
    
    void showBody() {
      fill(colour);
      noStroke();
      ellipse(sx, sy, size, size);
    }
    
    void showTail() {
      stroke(colour);
      line(px, py, sx, sy);
    }
}