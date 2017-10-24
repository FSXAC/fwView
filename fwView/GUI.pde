import controlP5.*;

ControlP5 cp5;
Accordion accordion;

public void createGUI() {
    cp5 = new ControlP5(this);
    cp5.setAutoDraw(false);
    
    // Sizing variables
    int sx, sy, px, py, oy;
    sx = 100; 
    sy = 16;
    oy = (int)(sy * 1.4f);
    
    int gui_w = 200;
    int gui_x = width - gui_w;
    int gui_y = 0;
    
    // Playback group, contains all controls for playback
    Group group_replay = cp5.addGroup("Replay");
    {
        group_replay.setHeight(20).setSize(gui_w, 100).setBackgroundColor(color(0, 150)).setColorBackground(color(0, 150));
        group_replay.getCaptionLabel().align(CENTER, CENTER);
        
        px = 10;
        py = 15;
           
        // Basic control buttons
        int bsx = (gui_w - 40) / 3;
        cp5.addButton("Play").setGroup(group_replay).plugTo(this, "pbPlay").setSize(bsx, 18).setPosition(px, py);
        cp5.addButton("Pause").setGroup(group_replay).plugTo(this, "pbPause").setSize(bsx, 18).setPosition(px += bsx + 10, py);
        cp5.addButton("Reset").setGroup(group_replay).plugTo(this, "pbReset").setSize(bsx, 18).setPosition(px += bsx + 10, py);
        
        // Sliders
        px = 10;
        cp5.addSlider("Playback").setGroup(group_replay).setSize(sx, sy).setPosition(px, py += (int)(oy * 1.5f)).setRange(0, 1).setValue(0).plugTo(this, "pbSetPlayback");
    }
    
    // View group, contains all controls for visualization
    Group group_visual = cp5.addGroup("Visual");
    {
        group_visual.setHeight(20).setSize(gui_w, 100).setBackgroundColor(color(0, 150)).setColorBackground(color(0, 150));
        group_visual.getCaptionLabel().align(CENTER, CENTER);
        
        cp5.addRadio("Display mode").setGroup(group_visual).setSize(sy, sy).setPosition(px, py += (int)(oy * 1.4f))
        .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
        .addItem("Solid", 0).activate(0)
        .addItem("Wireframe", 0).activate(0);
    }
    
    // Create new accordion
    accordion = cp5.addAccordion("acc").setPosition(gui_x, gui_y).setWidth(gui_w).setSize(gui_w, height)
    .setCollapseMode(Accordion.MULTI)
    .addItem(group_replay)
    .addItem(group_visual);
    //.open(0, 1);
}

public void displayGUI() {
    noLights();
    cam.beginHUD();
    cp5.draw();
    cam.endHUD();
}