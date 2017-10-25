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
    
    public void draw() {
        pushMatrix();
        
        // TODO: figure out what the units for x and y actually are
        translate(this.x, this.y, meterToPx(0.1));
        rotateZ(this.heading);
        
        pushMatrix();
        rotateX(-HALF_PI);
        textAlign(CENTER, CENTER);
        fill(50);
        text(this.name, 0, -20);
        popMatrix();
        
        //fill(#88FF88);
        noFill();
        //noStroke();
        stroke(0);
        box(meterToPx(0.2));
        
        popMatrix();
        
        drawTrail();
        
        if (frame < this.frames) {
            this.x = this.positionXs[frame];
            this.y = this.positionYs[frame];
            this.heading = this.headings[frame];
            frame++;
        }
    }
    
    // Probably not the best way to do it
    public void drawTrail() {
        strokeWeight(4);
        stroke(150);
        for (int i = 0; i < frame; i++) {
            if (i == 0) {
                line(0, 0, 0, this.positionXs[i], this.positionYs[i], 0);
            } else {
                line(this.positionXs[i - 1], this.positionYs[i - 1], 0,
                this.positionXs[i], this.positionYs[i], 0);
            }
        }
    }
    
    public void reset() {
        this.frame = 0;
        this.x = 0;
        this.y = 0;
        this.heading = 0;
    }
}