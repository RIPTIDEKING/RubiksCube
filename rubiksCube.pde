import peasy.*;

color allCol[] = {
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255), 
  color(255, 255, 0), 
  color(255, 0, 0), 
  color(255, 165, 0)
};

boolean animating = false;

boolean startSeq = false;


String seqMoves = "";
float tem = 0;

Rubik r;
Solve slv;

PeasyCam cam;

int sW;
void setup() {
  sW = 10;
  //sW = 5;
  fullScreen(P3D);
  //size(500, 500, P3D);
  cam = new PeasyCam(this, 200);

  r = new Rubik();
  slv = new Solve(r);
}



int index = 0;

void draw() {
  background(0);

  //10 for full otherwise 5
  strokeWeight(sW);

  stroke(50);
  fill(255);
  r.show();
  if (index < seqMoves.length() && !animating && startSeq) {
    //println("here\t"+index);
    moves(seqMoves.charAt(index));
    index++;
  }
}
