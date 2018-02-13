class Box
{
    PVector pos;
    float size;


    Box(float x, float y, float z, float _size)
    {
        pos = new PVector(x, y, z);
        size = _size;
    }


    ArrayList<Box> generate()
    {
        ArrayList<Box> boxes = new ArrayList<Box>();
        
        for(int i = -1; i < 2; i ++)
        {
            for(int j = -1; j < 2; j ++)
            {
                for(int k= -1; k < 2; k ++)
                {
                    int sum = abs(i) + abs(j) + abs(k);
                    float newSize = size / 3;
                    if(sum > 1)
                    {
                        Box newB = new Box(pos.x + i * newSize, pos.y + j * newSize, pos.z + k * newSize, newSize);
                        boxes.add(newB);
                    }

                    // Box newB = new Box(pos.x + i * newSize, pos.y + j * newSize, pos.z + k * newSize, newSize);
                    // boxes.add(newB);
                }
            }
        }

        return boxes;
    }


    void show()
    {
        pushMatrix();
        translate(pos.x, pos.y, pos.z);
        fill(255);
        box(size);
        popMatrix();
    }
}