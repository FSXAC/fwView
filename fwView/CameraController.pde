import peasy.*;

PeasyCam cam;

public void createCam() {
    // Create camera instance
    cam = new PeasyCam(this, 300);
    cam.setMinimumDistance(0.01);
    cam.setMaximumDistance(10000);
    cam.setSuppressRollRotationMode();
    
    // remap camera functions
    cam.setRightDragHandler(cam.getRotateDragHandler());
    cam.setCenterDragHandler(cam.getPanDragHandler());
    cam.setLeftDragHandler(null);
}