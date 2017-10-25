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

void setup() {
    size(1280, 800, P3D);
    
    // Setup 3D camera
    createCam();
     
    // Setup gui
    createGUI();
    
    // Create test robot
    robot = new Robot("dummy");
    
    // Loading simulation data
    Table simData = loadCSV("test");
    
    // Load simulation data into robot
    robot.populateSim(simData);
}

void draw() {
    background(200);
    rotateX(PI/2);
    drawTestAxes();
    drawTestObjs();
    
    robot.draw();
    
    displayGUI();
}

void drawTestObjs() {
    drawTestLights();
    fill(255, 255, 255);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, meterToPx(10), meterToPx(10));
}

void drawTestAxes() {
    stroke(255, 0, 0);
    line(0, 0, 0, meterToPx(1), 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, meterToPx(1), 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, meterToPx(1));
}

void drawTestLights() {
    pointLight(255, 255, 255, 0, 0, 200);
    directionalLight(250, 200, 170, 1, 0.3, 0.2);
}