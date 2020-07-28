
void keyPressed() {
  if (animating) {
    return;
  }
  if (key == 'r') {
    r.rotR(1);
  } else if (key == 'R') {
    r.rotR(-1);
  } else if (key == 'l') {
    r.rotL(1);
  } else if (key == 'L') {
    r.rotL(-1);
  } else if (key == 'u') {
    r.rotU(1);
  } else if (key == 'U') {
    r.rotU(-1);
  } else if (key == 'd') {
    r.rotD(1);
  } else if (key == 'D') {
    r.rotD(-1);
  } else if (key == 'f') {
    r.rotF(1);
  } else if (key == 'F') {
    r.rotF(-1);
  } else if (key == 'b') {
    r.rotB(1);
  } else if (key == 'B') {
    r.rotB(-1);
  } else if (key == ' ') {
    seqMoves = scramble(30);
    println(seqMoves);
    //animSpeed = 90;
    startSeq = true;
    index = 0;
  } else if (key == 's') {
    println("start solve");
    seqMoves = slv.solveCube();
    startSeq = true;
    index = 0;
    animSpeed = 5;
    println("\n"+ seqMoves);
    println("finished solve");
  }
}

void moves(char seq) {
  if (seq == 'r') {
    r.rotR(1);
  } else if (seq == 'R') {
    r.rotR(-1);
  } else if (seq == 'l') {
    r.rotL(1);
  } else if (seq == 'L') {
    r.rotL(-1);
  } else if (seq == 'u') {
    r.rotU(1);
  } else if (seq == 'U') {
    r.rotU(-1);
  } else if (seq == 'd') {
    r.rotD(1);
  } else if (seq == 'D') {
    r.rotD(-1);
  } else if (seq == 'f') {
    r.rotF(1);
  } else if (seq == 'F') {
    r.rotF(-1);
  } else if (seq == 'b') {
    r.rotB(1);
  } else if (seq == 'B') {
    r.rotB(-1);
  }
}

String scramble(int n){
  String ret = "";
  String moves = "fbrlud";
  int len = moves.length();
  for(int i=0;i<n;i++){
    ret += moves.charAt(int(random(len)));
  }
  return ret;
}
