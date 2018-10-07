class Title {
    
    String text;
    PFont font;

    int alpha = 200;
    int size = 95;

    Title(String s) {
        text = s;
        font = createFont("Moon Light.otf", size, true);

    }

    void draw() {
        textFont(font, size);
        fill(255, 255, 255, alpha);
        textAlign(CENTER, CENTER);
        text(text, width / 2, height / 2);
    }
}