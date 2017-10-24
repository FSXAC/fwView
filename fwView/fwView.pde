import peasy.*;

PeasyCam cam;

void setup() {
    size(1280, 800, P3D);
    cam = new PeasyCam(this, 100);
    cam.setMinimumDistance(1);
    cam.setMaximumDistance(500);
    
    // Setup gui
    gui();
}

void draw() {
    background(0);
    drawTestObjs();
}

void drawTestObjs() {
    rotateX(-.5);
    rotateY(-.5);
    fill(255, 0, 0);
    box(30);
    pushMatrix();
    translate(0, 0, 20);
    fill(0, 0, 255);
    box(5);
    popMatrix();
}