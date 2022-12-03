PImage mapImage;
Table listTable;//object
int currentRow =-1;
PrintWriter writer;
PFont myFont;


void setup() {
  size(1152,648); //size=bg pic
  mapImage = loadImage("bg.png");
  listTable=new Table("country.txt");
  writer = createWriter("data/locations.tsv");
  cursor(CROSS);
  myFont = loadFont("AngsanaNew-48.vlw");
  textFont(myFont, 20);
 // text("TEST", 10, 50);
  image(mapImage, 0, 0);

  int rowListTable=listTable.getRowCount();
  println("Row Count of listTable:"+rowListTable);
  int indexListTable=listTable.getRowIndex("locationA");
  println("index of locationA="+indexListTable);
}



void draw() {
}


void mousePressed() {
  if (currentRow !=-1) {
    String abbrev = listTable.getRowName(currentRow);
    writer.println(abbrev + "\t"+mouseX+"\t"+mouseY);
    println(mouseX+","+mouseY);
  }
  currentRow++;
  if (currentRow==listTable.getRowCount()) {
    writer.flush();
    writer.close();
    exit();
  } else {
    String name = listTable.getString(currentRow, 0);
    image(mapImage, 0, 0);
    fill(0, 120, 120);
    textAlign(BOTTOM);
    text("Choose location for "+name+".", 450, 570);
  }
}
