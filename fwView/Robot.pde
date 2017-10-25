public class Robot {
    float[] positionXs;
    float[] positionYs;
    float[] headings;
    float[] velocityXs;
    float[] velocityYs;
    float[] angularVs;
    
    int time = 0;
    
    Robot() {
        
    }
    
    void populateSim(Table tb) {
        int frames = tb.getRowCount();
        
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
}