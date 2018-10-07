import processing.sound.*;

int mouseWheel = 0, scene = 0;

SoundFile bgMusic;
Title bigTitle, subTitle, tester;
Stars stars;

void setup() {
    
    size(1270, 840);
    cursor(CROSS);
    background(0);
    frameRate(30);
    // smooth();
    
    stars = new Stars();
    bigTitle = new Title("S p a c e   T r a v e l");
    bigTitle.moveUp(-30);
    subTitle = new Title("S c r o l l         t  o         C h a n g e         S p e e d");
    subTitle.setSize(20);
    subTitle.moveUp(40);

    // tester = new Title("S c o l l    t h e    M o u s e    t o    T e s t");
    // tester.setSize(30);
    // tester.moveUp(300);

    bgMusic = new SoundFile(this, "empty room-Drawing The Endless Shore.wav");
    bgMusic.loop();
}

void draw() {
    
    background(0);
    
    if(mousePressed == true) {
        scene += 1;
    }

    if(scene == 0 ) {
        startUp();
    }
       
    stars.draw(mouseWheel);
}

void startUp() {
    
    bigTitle.draw();
    subTitle.draw();

    if(mouseWheel == 3) {
        subTitle.setText("C  l  i  c  k         t  o         B  e  g  i  n");

    }
    
    // if(mouseWheel != 0.0) {
    //     tester.setText(String.valueOf(-mouseWheel));
    // }
    // tester.draw();

    bigTitle.setGlowLength(-mouseWheel);
    bigTitle.glow();
}

void mouseWheel(MouseEvent roll) {
    mouseWheel = constrain(mouseWheel + roll.getCount(), -3, 3);
}
