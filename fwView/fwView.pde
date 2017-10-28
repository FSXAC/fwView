import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

final float PX_PER_METER = 100;
public float pxToMeter(float px) {
    return px/PX_PER_METER;
}

public float meterToPx(float m) {
    return m * PX_PER_METER;
}

Robot robot;

// global states
boolean PLAYING = true;
boolean REAL_SPEED = false;

void setup() {
    size(1280, 800, P3D);
    
    // Setup 3D camera
    createCam();
     
    // Setup gui
    createGUI();
    
    // Create test robot
    robot = new Robot("test robot");
    
    // Loading simulation data
    Table simData = loadCSV("data");
    
    // Load simulation data into robot
    robot.populateSim(simData);
}

void draw() {
    background(200);
    //rotateX(PI/2);
    drawTestAxes();
    drawTestObjs();
    
    robot.draw();
    
    drawHUD();
}

void drawTestObjs() {
    drawTestLights();
    fill(255, 255, 255);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, meterToPx(10), meterToPx(10));
    
    // draw some grids
    stroke(200);
    for (int x = -5; x <= 5; x++) {
        line(meterToPx(x), meterToPx(-5), meterToPx(x), meterToPx(5));
        line(meterToPx(-5), meterToPx(x), meterToPx(5), meterToPx(x));
    }
}

void drawTestAxes() {
    strokeWeight(1);
    stroke(255, 0, 0);
    line(0, 0, 0, meterToPx(1), 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, meterToPx(1), 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, meterToPx(1));
}

void drawTestLights() {
    directionalLight(240, 220, 180, 0, 0.3, -1);
    ambientLight(90, 130, 160);
}

void drawHUD() {
    cam.beginHUD();
    displayGUI();
    cam.endHUD();
}