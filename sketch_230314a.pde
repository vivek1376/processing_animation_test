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
float arrPoints_initialVelocity[] = new float[numPoints];


int initialSpeedConstant = 100;

float getRandomAngleDeviation() {
  return random(TWO_PI / 30) - random(TWO_PI / 30);
}
void setup()
{
  size(400, 400);
  
  for (int i = 0; i < numPoints; i++) {
    // print("i:", i);
    arrPoints_angle[i] = ((float(i) / float(numPoints)) * TWO_PI) + getRandomAngleDeviation();
    arrPoints_radialDist[i] = 0;
    arrPoints_initialVelocity[i] = random(1.0);
    print("  angle:", arrPoints_angle[i]);
  }
}

void update() {
  for (int i = 0; i < numPoints; i++) {
    arrPoints_radialDist[i] += arrPoints_initialVelocity[i] * 0.016;
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
    
    // stroke(0);
    strokeWeight(6.0);
    // float alpha = 255.0 * (arrPoints_radialDist[i] / 200);
    float alpha = 255.0 * exp(-1.0 * arrPoints_radialDist[i] / 60);
    // print("alpha:", alpha);
    stroke(#f72a68, alpha);
    // stroke(247, 42, 104, 100); //, alpha);
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
  
  if(frameCount <= numFrames) {
    // saveFrame("fr###.gif");
  }
  
  if(frameCount == numFrames) {
    // println("All frames have been saved");
    // alphaCount = 1;
    // frameCount = 1;
  }
}
