public class Robot {
    float[] positionXs;
    float[] positionYs;
    float[] headings;
    float[] velocityXs;
    float[] velocityYs;
    float[] angularVs;
    
    int frame;
    int frames;
    String name;
    
    float x;
    float y;
    float heading;
    
    Robot(String name) {
        frame = 0;
        frames = 0;
        this.name = name;
        
        x = 0;
        y = 0;
        heading = 0;
    }
    
    void populateSim(Table tb) {
        int frames = tb.getRowCount();
        this.frames = frames;
        
        positionXs = new float[frames];
        positionYs = new float[frames];
        headings = new float[frames];
        velocityXs = new float[frames];
        velocityYs = new float[frames];
        angularVs = new float[frames];
        
        int currentRow = 0;
        for (TableRow row : tb.rows()) {
            if (row.getString("TYPE").equals("SIM")) {
                positionXs[currentRow] = row.getFloat("X");
                positionYs[currentRow] = row.getFloat("Y");
                headings[currentRow] = row.getFloat("THETA");
                velocityXs[currentRow] = row.getFloat("VX");
                velocityYs[currentRow] = row.getFloat("VY");
                angularVs[currentRow] = row.getFloat("VA");
                
                currentRow++;
            }
        }
    }
    
    void draw() {
        pushMatrix();
        
        translate(this.x, this.y, 0);
        rotateZ(this.heading);
        
        fill(#88FF88);
        stroke(0);
        box(10);
        
        popMatrix();
        
        if (frame < this.frames) {
            this.x = this.positionXs[frame];
            this.y = this.positionYs[frame];
            this.heading = this.headings[frame];
            frame++;
        }
    }
}