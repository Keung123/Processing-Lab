import processing.sound.*;

float mouseWheel;

SoundFile bgMusic;
Title bigTitle;
Stars stars;

void setup() {
    
    size(1270, 840);
    cursor(CROSS);
    background(0);
    frameRate(30);
    // smooth();
    
    stars = new Stars();
    bigTitle = new Title("S p a c e   T r a v e l");
    bgMusic = new SoundFile(this, "empty room-Drawing The Endless Shore.wav");
    bgMusic.loop();
}

void draw() {
    
    background(0);
    
    bigTitle.draw();
    bigTitle.glow();
    
    stars.draw(mouseWheel);
}

void mouseWheel(MouseEvent roll) {
    mouseWheel = roll.getCount();
}