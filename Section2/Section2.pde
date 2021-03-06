int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
}

/*Create Pascal's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    float m1x = (v1x + v2x) / 2;
    float m1y = (v1y + v2y) / 2;
    float m2x = (v2x + v3x) / 2;
    float m2y = (v2y + v3y) / 2;
    float m3x = (v3x + v1x) / 2;
    float m3y = (v3y + v1y) / 2;
    fill(255, 0, 0);
    if (levels == 0){
       triangle(v1x, v1y, v2x, v2y, v3x, v3y);
    } else if (levels >= 1){
       triangle(v1x, v1y, v2x, v2y, v3x, v3y);
       fill(255,255,255);
       triangle (m1x, m1y, m2x, m2y, m3x, m3y);
    }
    if (levels > 1){
       gasket(levels - 1, m1x, m1y, v1x, v1y, m3x, m3y);
       gasket(levels - 1, m1x, m1y, v2x, v2y, m2x, m2y);
       gasket(levels - 1, m2x, m2y, v3x, v3y, m3x, m3y);
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
