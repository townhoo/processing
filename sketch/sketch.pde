PImage mapImage;
Table dataTable;
Table locationTable;
int rowCount;
float []dataMinMax;
Table distanceTable;
//float dataMin;
//float dataMax;
int columnCount;
int currentColumn = 1;
PFont Font;

float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

Integrator[] interpolators;

void setup() {
  Font =loadFont("AngsanaNew-48.vlw");
    size(800, 600);
  mapImage = loadImage("bg.jpg");
  locationTable = new Table("locations.tsv");
  dataTable = new Table ("data.tsv");
  distanceTable = new Table ("dis.tsv");
  rowCount = dataTable.getRowCount();
  dataMinMax = new float[rowCount];
  //yearTable = new Year ("year.tsv");
  //more column

  //
  for (int row = 0; row<rowCount; row++) {
    dataMinMax[row] = dataTable.getFloat(row, 1);
  }
  dataMin = min(dataMinMax);
  dataMin = max(dataMinMax);
  println (dataMin+","+dataMax);

  interpolators = new Integrator[rowCount];
  for (int row = 0; row<rowCount; row++) {
    float initialValue = dataTable.getFloat(row, 1);
    //interpolators [row] = new Integrator(initialValue)
    interpolators [row] = new Integrator(initialValue, 0.1, 0.2);
  }
}

void draw () {
  background(255);
  image(mapImage, 0, 0);
  for (int row = 0; row<rowCount; row++) {
    interpolators[row].update();
  }
  for (int row = 0; row<rowCount; row++) {

    String abbrev = dataTable.getRowName(row);
    float x = locationTable.getFloat(abbrev, 1);
    float y = locationTable.getFloat(abbrev, 2);
    drawData(x, y, abbrev);
  }
}

void drawData(float x, float y, String abbrev) {
  int row = dataTable.getRowIndex(abbrev);
  float value = interpolators[row].value;
  float value2 = dataTable.getFloat(row,currentColumn);
  float dis = distanceTable.getFloat(row,currentColumn);
  float radius = 20;
  fill(158, 140, 128, 120);
  noStroke();
  ellipse(x, y, dis*1.2, dis*1.2);
  //radius = valueMap/2;
  if (dist(x, y, mouseX, mouseY) <radius+2) {
    fill(0);
    textAlign (CENTER);
    textFont(Font, 50);
    // fontcolor
    fill(0, 0, 0);
    text(value2 + " (" + abbrev + ")", x-radius+80, y-radius+4);
  }
}
void keyPressed () {
  if (key=='[') {
    currentColumn--;
    if (currentColumn<1) {
      currentColumn = columnCount-1;
    }
  } else if (key==']') {
    currentColumn++;
    if (currentColumn==columnCount) {
      currentColumn = 1;
    }
    updateTable();
  }
}
void updateTable()
{
  for (int row = 0; row<rowCount; row++) {
    interpolators[row].target(dataTable.getFloat(row, currentColumn));
  }
}
