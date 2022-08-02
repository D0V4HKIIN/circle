class Circle{
 float x,y,cx,cy,v,r,off;
 int count  = 0;
 Circle(float cx,float cy,float speed,float ray, float offset){
   this.cx = cx;
   this.cy = cy;
   this.v = speed/100;
   this.r = ray;
   this.off = offset;
 }
 
 void update(){
   fill(0);
   stroke(255,0,0);
   ellipse(cx,cy,r,r);
   
   fill(255);
   stroke(255);
   
   x = (r/2)*sin(count*v+off)+cx;
   y = (r/2)*cos(count*v+off)+cy;
   ellipse(x,y,10,10);
   count++;
 }
}

class Point{
  float x,y;
  Point(float x,float y){
    this.x = x;
    this.y = y;
  }
  void show(){
    stroke(0,255,255);
    fill(0,255,255);
    ellipse(x,y,2,2);
  }
}

Circle[] fix = new Circle[2];
ArrayList<Point> points = new ArrayList<Point>();
void setup(){
  size(900,900);
  frameRate(60);
  fix[0] = new Circle(3*width/4,height/4,5,width/2-100,0);
  fix[1] = new Circle(width/4,3*height/4,6,width/2-100,PI/2);
}

void draw(){
  for(int j = 0;j<1;j++){
  background(0);
    for(int i = 0;i<fix.length;i++){
      fix[i].update();
    }
    stroke(255);
    line(fix[0].x,0,fix[0].x,height);
    line(0,fix[1].y,width,fix[1].y);
    
    points.add(new Point(fix[0].x,fix[1].y));
    for(Point point : points){
      point.show();
    }
  }
}
