 size(800,800);
 background(0);
 blendMode(ADD);
 
 println(random(5));
 
 int i = 0;
 while(i < 100){
   i += 1;
   print(i);
   
   int j = 0;
   while(j < 10){
     j += 1;
     
     int posX = i * 50;
     int posY = j * 80;
     float dist = random(10);
     float col = random(255);
     
     float squareSize = random(50);
     print(j + " ");
     
     fill(col, 0, 0);
     rect(posX, posY, squareSize, squareSize );
     fill(0, col, 0);
     rect(posX + dist, posY + dist, squareSize, squareSize );
     fill(0, 0, col);
     rect(posX + dist * 2, posY + dist * 2, squareSize, squareSize );
   }
 
 }
 
