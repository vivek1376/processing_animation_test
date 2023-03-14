/*

init():
 - array of points
 - initial speed for each point: constant + random
 - initial angle for each point: (index_of_point / num_points) * 2*pi + random
 - initial color for each point: 
  - 3 colors at 0, 2pi/3, 4pi/3
  - 
 - call init() from draw() ? no, update() ?

in each draw():
 - update the position of each point
 - 



milestones
 - show all points
*/


int numPoints = 100;
float arrPoints_x[] = new float[numPoints];
float arrPoints_y[] = new float[numPoints];
float arrPoints_angle[] = new float[numPoints];
// float arrPoints_initialRadialDist[] = new float[numPoints];
float arrPoints_radialDist[] = new float[numPoints];


int initialSpeedConstant = 100;

void setup()
{
  size(400, 400);
  
  for (int i = 0; i < numPoints; i++) {
    print("i:", i);
    arrPoints_angle[i] = ((i / numPoints) * TWO_PI); // + random(TWO_PI);
    arrPoints_radialDist[i] = 0;
    // print("  angle:", arrPoints_angle[i]);
  }
}

void update() {
  for (int i = 0; i < numPoints; i++) {
    arrPoints_radialDist[i] += 0.01;
  }
}

int numFrames = 100;
// int alphaCount = 1;

void draw()
{
  hint(ENABLE_STROKE_PURE);
  background(255);
  
  // float r = 100;
  
  /*
  float t = 1.0*(frameCount-1)/numFrames;
  
  float r = 100;
  float x = width/2 + r*cos(TWO_PI*t);
  float y = height/2 + r*sin(TWO_PI*t);
  
  float alpha = 255 * (frameCount - 1) / numFrames;
  // alphaCount++;
  
  // float alpha = 255;
  */
  
  for (int i = 0; i < numPoints; i++) {
    float x = width/2 + arrPoints_radialDist[i] * cos(arrPoints_angle[i]);
    float y = height/2 + arrPoints_radialDist[i] * sin(arrPoints_angle[i]);
    arrPoints_x[i] = x;
    arrPoints_y[i] = y;
    
    stroke(0);
    strokeWeight(5.0);
    stroke(#f72a68);
    point(x, y);
    // print(x, y);
    
    update();
  }
  
  /*
  stroke(#2e939e, alpha);
  strokeWeight(9.0); // size of black dot
  
  point(x,y);
  
  stroke(#d14ba4, alpha);
  point(x + 10, y - 10);
  */
  
  if(frameCount<=numFrames) {
    // saveFrame("fr###.gif");
  }
  
  if(frameCount == numFrames) {
    // println("All frames have been saved");
    // alphaCount = 1;
    // frameCount = 1;
  }
}
