import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

void setup() {
    size(1280, 800, P3D);
    
    // Setup 3D camera
    createCam();
     
    // Setup gui
    createGUI();
    
    // Loading simulation data
    loadCSV("test");
}

void draw() {
    background(200);
    rotateX(PI/2);
    drawTestAxes();
    drawTestObjs();
    displayGUI();
}

void drawTestObjs() {
    drawTestLights();
    fill(255, 255, 255);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, 100, 100);
}

void drawTestAxes() {
    strokeWeight(3);
    stroke(255, 0, 0);
    line(0, 0, 0, 10, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 10, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, 10);
}

void drawTestLights() {
    pointLight(255, 255, 255, 0, 0, 200);
    directionalLight(250, 200, 170, 1, 0.3, 0.2);
}