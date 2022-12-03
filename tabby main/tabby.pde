PImage mapImage;
PImage usaImage;
PImage rusImage;
PImage fraImage;
PImage chinaImage;
PImage indiaImage;
PImage pakImage;
PImage nkImage;
PImage irImage;
PImage saImage;
PImage ukImage;
Table dataTable;
Table locationTable;
Table distanceTable;
Table imgTable;
int currentRow =-1;
int rowCount;
float []dataMinMax;
//float dataMin;
//float dataMax;
int columnCount;
int currentColumn = 1;
PFont Font;

float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

Integrator[] interpolators;

boolean overButton1 = false;
boolean overButton2 = false;
boolean overButton3 = false;
boolean overButton4 = false;
boolean overButton5 = false;


void setup() {
  Font =loadFont("DBHelvethaicaX-77BdCond-100.vlw");
  size(1152,648);
  mapImage = loadImage("bg.png");
  usaImage = loadImage("1.png");
  rusImage = loadImage("2.png");
  fraImage = loadImage("3.png");
  chinaImage = loadImage("4.png");
  indiaImage = loadImage("5.png");
  pakImage = loadImage("6.png");
  nkImage = loadImage("7.png");
  irImage = loadImage("8.png");
  saImage = loadImage("9.png");
  ukImage = loadImage("10.png");
  locationTable = new Table("locations.tsv");
  dataTable = new Table ("data.tsv");
  distanceTable = new Table ("dis.tsv");
  imgTable = new Table("img.tsv");
  rowCount = dataTable.getRowCount();
  dataMinMax = new float[rowCount];
  //more column
  columnCount = dataTable.getColumnCount();
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
  ellipse(741, 615, 10, 10);
  ellipse(758, 615, 10, 10);
  ellipse(800, 555, 10, 10);
  ellipse(868, 571, 10, 10);
  ellipse(929, 600, 10, 10);
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
  //float value = dataTable.getFloat(abbrev, currentColumn);
  int row = dataTable.getRowIndex(abbrev);
  float value = interpolators[row].value;
  float value2 = dataTable.getFloat(row,currentColumn);
  float dis = distanceTable.getFloat(row,currentColumn);
  float img = imgTable.getFloat(row,currentColumn);
  float radius = 20;
  fill(255, 209, 26, 120);
  noStroke();
  ellipse(x, y, dis*1.2, dis*1.2);
  //radius = valueMap/2;
  if (dist(x, y, mouseX, mouseY) <radius+2) {
    fill(0);
    textAlign (CENTER);
    textFont(Font, 50);
    // fontcolor
    fill(255, 209, 26);
    text(value2 + " (" + abbrev + ")", x, y-radius-4);
    if (img==1){
      image(usaImage, 0, 0);
    } else if (img==2) {
      image(rusImage , 0, 0);
    }  else if (img==3) {
      image(fraImage , 0, 0);
    }  else if (img==4) {
      image(chinaImage , 0, 0);
    }  else if (img==5) {
      image(indiaImage , 0, 0);
    }  else if (img==6) {
      image(pakImage , 0, 0);
    }  else if (img==7) {
      image(nkImage , 0, 0);
    }  else if (img==8) {
      image(irImage , 0, 0);
    }  else if (img==9) {
      image(saImage , 0, 0);
    }  else if (img== 10) {
      image(ukImage , 0, 0);
    }
    
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

void mousePressed() {
  if (overButton1) { 
    link("https://www.bbc.com/news/in-pictures-53648572");
  } else if (overButton2){
    link("https://www.nationalgeographic.com/culture/article/cold-war");
  } else if (overButton3){
    link("https://www.un.org/disarmament/wmd/nuclear/npt/");
  } else if (overButton4){
    link("https://www.un.org/disarmament/wmd/nuclear/ctbt/");
  } else if (overButton5){
    link("https://www.bbc.com/news/world-europe-60506682");
  }
}

void mouseMoved() { 
  checkButtons1();
  checkButtons2();
  checkButtons3();
  checkButtons4();
  checkButtons5();
  
}
  
void mouseDragged() {
  checkButtons1(); 
  checkButtons2();
  checkButtons3();
  checkButtons4();
  checkButtons5();
}

void checkButtons1() {
  if (mouseX > 725 && mouseX < 741 && mouseY > 600 && mouseY < 648) {
    overButton1 = true;   
  } else {
    overButton1 = false;
  }
}
void checkButtons2() {
  if (mouseX > 758 && mouseX < 790 && mouseY > 600 && mouseY < 648) {
    overButton2 = true;   
  } else {
    overButton2 = false;
  }
}
void checkButtons3() {
  if (mouseX > 790 && mouseX < 820 && mouseY > 530 && mouseY < 570) {
    overButton3 = true;   
  } else {
    overButton3 = false;
  }
}
void checkButtons4() {
  if (mouseX > 855 && mouseX < 870 && mouseY > 560 && mouseY < 600) {
    overButton4 = true;   
  } else {
    overButton4 = false;
  }
}
void checkButtons5() {
  if (mouseX > 900 && mouseX < 950 && mouseY > 590 && mouseY < 620) {
    overButton5 = true;   
  } else {
    overButton5 = false;
  }
}
