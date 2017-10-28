public class Robot {
    float[] times;
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
    
    int startTime;
    
    Robot(String name) {
        frame = 0;
        frames = 0;
        this.name = name;
        
        x = 0;
        y = 0;
        heading = 0;
        
        startTime = millis();
    }
    
    void populateSim(Table tb) {
        int frames = tb.getRowCount();
        this.frames = frames;
        
        times = new float[frames];
        positionXs = new float[frames];
        positionYs = new float[frames];
        headings = new float[frames];
        velocityXs = new float[frames];
        velocityYs = new float[frames];
        angularVs = new float[frames];
        
        int currentRow = 0;
        for (TableRow row : tb.rows()) {
            if (row.getString("TYPE").equals("SIM")) {
                times[currentRow] = row.getFloat("TIME");
                positionXs[currentRow] = row.getFloat("X");
                positionYs[currentRow] = row.getFloat("Y");
                headings[currentRow] = row.getFloat("THETA");
                velocityXs[currentRow] = row.getFloat("VX");
                velocityYs[currentRow] = row.getFloat("VY");
                angularVs[currentRow] = row.getFloat("VA");
                
                currentRow++;
            }
        }
        
        println(this.positionXs.length);
        println(this.velocityXs.length);
    }
    
    public void draw() {
        pushMatrix();
        
        // x and y are in meters
        translate(meterToPx(this.x), meterToPx(this.y), meterToPx(0.1));
        rotateZ(this.heading);
        drawRobot();
        popMatrix();
        
        drawTrail();
        drawSpeedVector();
        drawAngularVector();
        
        if (PLAYING) {
            this.update();
        }
    }
    
    public void update() {
        if (frame < this.frames) {
            int elapsedTime = millis() - startTime;
            if (this.times[frame] * 1000 <= elapsedTime || !REAL_SPEED) {
                this.x = this.positionXs[frame];
                this.y = this.positionYs[frame];
                this.heading = this.headings[frame];
                frame++;
            }
        }
    }
    
    public void drawRobot() {
        box(meterToPx(0.18));
        translate(20, 0, 0);
        beginShape();
        fill(#FF9944);
        noStroke();
        vertex(0, 0);
        vertex(-5, -5);
        vertex(30, 0);
        vertex(-5, 5);
        endShape(CLOSE);
    }
    
    // Probably not the best way to do it
    public void drawTrail() {
        strokeWeight(4);
        stroke(150);
        for (int i = 0; i < frame; i++) {
            if (i == 0) {
                line(0, 0, 0, meterToPx(this.positionXs[i]), meterToPx(this.positionYs[i]), 0);
            } else {
                line(meterToPx(this.positionXs[i - 1]), meterToPx(this.positionYs[i - 1]), 0,
                meterToPx(this.positionXs[i]), meterToPx(this.positionYs[i]), 0);
            }
        }
    }
    
    // Draw vectors such as speed or rotation
    public void drawSpeedVector() {
        pushMatrix();
        translate(meterToPx(this.x), meterToPx(this.y), meterToPx(0.1));
        strokeWeight(5);
        stroke(#4499FF);
        
        int lastFrame = frame >= this.frames ? this.frames-1: frame;
        line(0, 0, 0, meterToPx(this.velocityXs[lastFrame]), meterToPx(this.velocityYs[lastFrame]), 0);
        popMatrix();
    }
    
    public void drawAngularVector() {
        pushMatrix();
        translate(meterToPx(this.x), meterToPx(this.y), meterToPx(0.07));
        rotateZ(this.heading);
        strokeWeight(5);
        stroke(#66FF66);
        noFill();
        int lastFrame = frame >= this.frames ? this.frame-1: frame;
        arc(0, 0, meterToPx(0.5), meterToPx(0.5), 0, constrain(angularVs[lastFrame], 0, PI/2));
        popMatrix();
    }
    
    public void reset() {
        this.frame = 0;
        this.x = 0;
        this.y = 0;
        this.heading = 0;
        this.startTime = millis();
    }
}