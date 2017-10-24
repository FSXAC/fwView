import controlP5.*;

ControlP5 cp5;
Accordion accordion;

void gui() {
    cp5 = new ControlP5(this);
    
    // Group number 1, contains 2 bangs
    Group g1 = cp5.addGroup("myGroup1").setBackgroundColor(color(0, 64)).setBackgroundHeight(150);
    cp5.addBang("bang").setPosition(10, 20).setSize(50, 50).moveTo(g1).plugTo(this, "shuffle");
    
    // Create new accordion
    accordion = cp5.addAccordion("acc").setPosition(20, 20).setWidth(200).addItem(g1);
    
    // Open all accordions
    accordion.open(0);
    accordion.setCollapseMode(Accordion.MULTI);
}