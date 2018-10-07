class Stars {

    Particular[] stars;

    int amount = 600;
    int speedMax = 25;
    int speedMin = 5;
    int speedBoost = 60;
    
    float speed;
    float mouseWheel;

    Stars() {

        stars = new Particular[amount];

        for(int i = 0; i < stars.length; i ++) {
            stars[i] = new Particular();
        }
    }

    void draw(float _mouseWheel) {

        mouseWheel = _mouseWheel;
        // camera set to center
        cameraControl();
        // control the speed by mouse
        speedControl();
        // show the stars
        updateStars();
    } 

    void updateStars() {
        
        for(int i = 0; i < stars.length; i ++)
        {
            stars[i].update(speed);
            stars[i].process();
            // stars[i].showBody();
            stars[i].showTail();
        }
    }

    

    void speedControl() {
    
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
        if(mouseButton == CENTER) {
            speed += speedBoost;
        }
        if(mouseButton == RIGHT) {
            speed = 1;  
        }
    }

    void cameraControl() {
        // translate(width / 2, height / 2);
        translate(mouseX, mouseY);
    }
} 