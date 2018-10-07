class Title {
    
    String text;
    PFont font;

    int alpha = 255;
    int size = 85;

    PVector loc = new PVector(0, height / 3 * 2);
    PVector mov = new PVector(5, -2);
    PGraphics glow;
    float distance;
    int glowLength = 30000;

    Title(String s) {
        text = s;
        font = createFont("Moon Light.otf", size, true);
        glow = createGraphics(width, height);

    }

    void draw() {
        textFont(font, size);
        fill(255, 255, 255, alpha);
        textAlign(CENTER);
        text(text, width / 2, height / 2);
    }

    void glow() {
        
        updatePixels();

        loc.add(mov);
        if (loc.x < 0) { mov.x *= -1; }
        if (loc.x > width) { mov.x *= -1; }
        if (loc.y < 0) { mov.y *= -1; }
        if (loc.y > height) { mov.y *=-1; }

        glow.beginDraw();

        for(int i = 0;  i < width; i ++) { 
            for(int j = 0; j < height; j ++) {
                        
                if(get(i, j) == color(0)) {
                    glow.set(i , j, color(0));
                }
                else {

                    distance = dist(i, j, loc.x, loc.y);
                    // distance = sq(distance);
                    distance = glowLength / distance;
                    color cl = color(distance / 1.7, distance / 2.3, distance / 1.3);
                    glow.set(i, j, cl);
                }     
            }
        }

        glow.endDraw();

        image(glow, 0, 0);
    }
}