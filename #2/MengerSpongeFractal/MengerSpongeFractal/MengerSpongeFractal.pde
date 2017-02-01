float rAngle = 0;
ArrayList<Box> sponge;
int firstBoxSize = 300;
void setup()
{
    size(1000, 600, P3D);
    sponge = new ArrayList<Box>();

    Box firstBox = new Box(0, 0, 0, 300);
    sponge.add(firstBox);
}

void mousePressed()
{
    ArrayList<Box> next = new ArrayList<Box>();

    for(Box boxesInArrayList : sponge)
    {
          ArrayList<Box> newBoxes = boxesInArrayList.generate();
          next.addAll(newBoxes);
    }

    sponge = next;
}

void draw()
{
      background(51);
      // stroke(255);
      // noFill();
      noStroke();
      lights();

      rAngle += 0.01;
  
      translate(width / 2, height / 2);
      rotateX(rAngle);
      rotateY(rAngle * 0.4);
      rotateZ(rAngle * 0.2);
  
      for(Box boxesInArrayList : sponge)
      {
            boxesInArrayList.show();
      }
  
}