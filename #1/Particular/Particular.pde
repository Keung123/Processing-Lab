import processing.sound.*;

int amount = 600;

float speed;
int speedMax = 25;
int speedMin = 5;
int speedBoost = 60;

float mouseWheel;
boolean mouseFlag;

Star[] stars = new Star[amount];

SoundFile bgMusic;

Title bigTitle;

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

    bigTitle = new Title("S p a c e   T r a v e l");
    
    bgMusic = new SoundFile(this, "empty room-Drawing The Endless Shore.wav");
    bgMusic.loop();
}

void draw()
{
    // refresh window
    background(0);
    
    startUp();
    
    mainPart();
}

void mouseWheel(MouseEvent roll)
{
    mouseWheel = roll.getCount();
}

void startUp()
{
    bigTitle.draw();
    
}

void mainPart()
{
    // camera set to center
    cameraControl();
    // control the speed by mouse
    speedControl();
    // show the stars
    updateStars();
}

void cameraControl()
{
    // translate(width / 2, height / 2);
    translate(mouseX, mouseY);
}

void speedControl()
{
    speed = map(mouseWheel, -1.0, 1.0, speedMax, speedMin);
    // Controled by mouseX
    // if(mouseX < (width / 2))
    // {
    //   speed = map(mouseX, 0, (width / 2), speedMin, speedMax);
    // }  
    // else
    // {
    //   speed = map((mouseX - (width / 2)), 0, (width / 2), speedMax, speedMin);
    // }
    
    // speed boost
    if(mouseButton == CENTER)
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
