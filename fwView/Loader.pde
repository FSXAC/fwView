public void loadCSV(String fname) {
    Table table = loadTable(fname + ".csv", "header");
    println(table.getRowCount() + " total rows");
    
    for (TableRow row : table.rows()) {
        String type = row.getString("TYPE");
        
        if (type.equals("SIM")) {
            float time = row.getFloat("TIME");
            float x = row.getFloat("X");
            float y = row.getFloat("Y");
            float theta = row.getFloat("THETA");
            float vx = row.getFloat("VX");
            float vy = row.getFloat("VY");
            float va = row.getFloat("VA");
            
            println(time + "::" + x);
        }
    }
}