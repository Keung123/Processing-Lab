class Title {
    
    String text;
    PFont font;

    int alpha = 255;
    int size = 85;
    int yPos = height / 2;

    PVector loc = new PVector(0, height / 3 * 2);
    PVector mov = new PVector(5, -2);
    PGraphics glow;
    float distance;
    int glowLength; // 10000 

    Title(String s) {
        text = s;
        font = createFont("Moon Light.otf", size, true
);
        glow = createGraphics(width, height);
    }

    void setSize(int s) {
        size = s;
    }

    void setText(String s) {
        text = s;
    }

    void setGlowLength(int x) {
        glowLength = 30000 + (int)(5000. * x);
    }

    void moveUp(int h) {
        yPos += h;
    }

    void draw() {
        textFont(font, size);
        fill(255, 255, 255, alpha);
        textAlign(CENTER);
        text(text, width / 2, yPos);
    }

    void glow() {
        
        updatePixels();

        // autoAnimation
        // loc.add(mov);
        // if (loc.x < 0) { mov.x *= -1; }
        // if (loc.x > width) { mov.x *= -1; }
        // if (loc.y < 0) { mov.y *= -1; }
        // if (loc.y > height) { mov.y *=-1; }

        glow.beginDraw();

        for(int i = 0;  i < width; i ++) { 
            for(int j = 0; j < height; j ++) {
                        
                if(get(i, j) == color(0)) {
                    glow.set(i , j, color(0));
                }
                else {

                    // autoAnimation
                    // distance = dist(i, j, loc.x, loc.y);
                    distance = dist(i, j, mouseX, mouseY);
                    // distance = sq(distance);
                    distance = glowLength / distance;
                    color cl = color(distance / 1.8, distance / 2, distance / 1.3);
                    glow.set(i, j, cl);
                }     
            }
        }

        glow.endDraw();

        image(glow, 0, 0);
    }
}