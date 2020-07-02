import java.util.*;

class Solve {
  color faceCol[][] = new color[6][];
  int empty;
  String seq;
  Rubik r;

  Solve(Rubik r) {
    this.r = r;
  }

  ArrayList<Integer> getC(int num) {
    //get colors in corners
    Integer[] retVal = new Integer[3];

    switch(num) {
    case 1: 
      retVal[0] = faceCol[2][0];
      retVal[1] = faceCol[1][0];
      retVal[2] = faceCol[5][0];
      break;
    case 2: 
      retVal[0] = faceCol[2][6];
      retVal[1] = faceCol[1][6];
      retVal[2] = faceCol[4][0];
      break;
    case 3: 
      retVal[0] = faceCol[2][8];
      retVal[1] = faceCol[0][6];
      retVal[2] = faceCol[4][2];
      break;
    case 4: 
      retVal[0] = faceCol[2][2];
      retVal[1] = faceCol[0][0];
      retVal[2] = faceCol[5][2];
      break;
    case 5: 
      retVal[0] = faceCol[3][0];
      retVal[1] = faceCol[1][2];
      retVal[2] = faceCol[5][6];
      break;
    case 6: 
      retVal[0] = faceCol[3][6];
      retVal[1] = faceCol[1][8];
      retVal[2] = faceCol[4][6];
      break;
    case 7: 
      retVal[0] = faceCol[3][8];
      retVal[1] = faceCol[0][8];
      retVal[2] = faceCol[4][8];
      break;
    case 8: 
      retVal[0] = faceCol[3][2];
      retVal[1] = faceCol[0][2];
      retVal[2] = faceCol[5][8];
      break;
    }

    return new ArrayList<Integer>(Arrays.asList(retVal));
  }

  ArrayList<Integer> getE(int n) {
    ArrayList<Integer> retVal = new ArrayList<Integer>();

    switch (n) {
    case 1:
      retVal.add(faceCol[2][3]);
      retVal.add(faceCol[1][3]);
      break;
    case 2:
      retVal.add(faceCol[2][7]);
      retVal.add(faceCol[4][1]);
      break;
    case 3:
      retVal.add(faceCol[2][5]);
      retVal.add(faceCol[0][3]);
      break;
    case 4:
      retVal.add(faceCol[2][1]);
      retVal.add(faceCol[5][1]);
      break;
    case 5:
      retVal.add(faceCol[1][1]);
      retVal.add(faceCol[5][3]);
      break;
    case 6:
      retVal.add(faceCol[1][7]);
      retVal.add(faceCol[4][3]);
      break;
    case 7:
      retVal.add(faceCol[0][7]);
      retVal.add(faceCol[4][5]);
      break;
    case 8:
      retVal.add(faceCol[0][1]);
      retVal.add(faceCol[5][5]);
      break;
    case 9:
      retVal.add(faceCol[3][3]);
      retVal.add(faceCol[1][5]);
      break;
    case 10:
      retVal.add(faceCol[3][7]);
      retVal.add(faceCol[4][7]);
      break;
    case 11:
      retVal.add(faceCol[3][5]);
      retVal.add(faceCol[0][5]);
      break;
    case 12:
      retVal.add(faceCol[3][1]);
      retVal.add(faceCol[5][7]);
      break;
    }
    return retVal;
  }

  boolean chkPosC(int n) {
    int m = n;
    ArrayList<Integer> cols = getC(n);

    if (n<5) {
      if (cols.get(0) != allCol[2]) {
        return false;
      }
    } else {
      if (cols.get(0) != allCol[3]) {
        return false;
      }
      m -= 4;
    }
    int t = (m>1 && m<4) ? 4 : 5; 
    if (cols.contains(allCol[round((pow(m, 3)/3.0)-(pow(m, 2)*5.0/2.0)+(31.0*(float(m)/6.0))-2.0)]) && cols.contains(allCol[t])) {
      return true;
    }
    return false;
  }

  boolean chkPosE(int n) {
    int m = n;
    ArrayList<Integer> cols = getE(n);

    if (n<5) {
      if (cols.get(0) != allCol[2]) {
        return false;
      }
    } else if (n<=6) {
      if (cols.get(0) != allCol[1]) {
        return false;
      }
      if (cols.get(1) == allCol[5]) {
        if (n==5)return true;
        return false;
      }
      if (n==6)return true;
      return false;
    } else if (n<=8) {
      if (cols.get(0) != allCol[0]) {
        return false;
      }
      if (cols.get(1) == allCol[5]) {
        if (n==8)return true;
        return false;
      }
      if (n==7)return true;
      return false;
    } else {
      if (cols.get(0) != allCol[2]) {
        return false;
      }
    }

    if (cols.get(1) == allCol[round(pow(m, 3)*(8.0/3.0)-pow(m, 2)*(39.0/2.0)+m*(257.0/6.0)-25)]) {
      return true;
    }
    return false;
  }

  int getEpos(int n) {
    ArrayList<Integer> cols = getE(n);
    int pos = -1;
    if (cols.contains(allCol[2])) {
      for (int i=1; i<=4; i++) {
        if (cols.contains(allCol[round(pow(i, 3)*(8.0/3.0)-pow(i, 2)*(39.0/2.0)+i*(257.0/6.0)-25)])) {
          return i;
        }
      }
    } else if (cols.contains(allCol[3])) {
      for (int i=1; i<=4; i++) {
        if (cols.contains(allCol[round(pow(i, 3)*(8.0/3.0)-pow(i, 2)*(39.0/2.0)+i*(257.0/6.0)-25)])) {
          return i+8;
        }
      }
    } else {
      if (cols.contains(allCol[0])) {
        if (cols.contains(allCol[5])) {
          return 8;
        }
        return 7;
      } else {
        if (cols.contains(allCol[5])) {
          return 5;
        }
        return 6;
      }
    }

    return pos;
  }

  int getCpos(int n) {
    ArrayList<Integer> cols = getC(n);
    int pos = -1;
    if (cols.contains(allCol[2])) {
      if (cols.contains(allCol[1])) {
        if (cols.contains(allCol[5])) {
          pos = 1;
        } else {
          pos = 2;
        }
      } else {
        if (cols.contains(allCol[5])) {
          pos = 4;
        } else {
          pos = 3;
        }
      }
    } else {
      if (cols.contains(allCol[1])) {
        if (cols.contains(allCol[5])) {
          pos = 5;
        } else {
          pos = 6;
        }
      } else {
        if (cols.contains(allCol[5])) {
          pos = 8;
        } else {
          pos = 7;
        }
      }
    }
    return pos;
  }


  void faceRot(int facInd, int dir) {
    color tempCl;
    if (dir==1) {
      //corners
      tempCl = faceCol[facInd][0];
      faceCol[facInd][0] = faceCol[facInd][2];
      faceCol[facInd][2] = faceCol[facInd][8];
      faceCol[facInd][8] = faceCol[facInd][6];
      faceCol[facInd][6] = tempCl;
      //edges
      tempCl = faceCol[facInd][3];
      faceCol[facInd][3] = faceCol[facInd][1];
      faceCol[facInd][1] = faceCol[facInd][5];
      faceCol[facInd][5] = faceCol[facInd][7];
      faceCol[facInd][7] = tempCl;
    } else {
      //corners
      tempCl = faceCol[facInd][0];
      faceCol[facInd][0] = faceCol[facInd][6];
      faceCol[facInd][6] = faceCol[facInd][8];
      faceCol[facInd][8] = faceCol[facInd][2];
      faceCol[facInd][2] = tempCl;
      //edges
      tempCl = faceCol[facInd][3];
      faceCol[facInd][3] = faceCol[facInd][7];
      faceCol[facInd][7] = faceCol[facInd][5];
      faceCol[facInd][5] = faceCol[facInd][1];
      faceCol[facInd][1] = tempCl;
    }
  }


  void rotR(int dir) {

    faceRot(4, dir);
    if (dir==1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][8-i];
        faceCol[2][8-i] = faceCol[0][8-i];
        faceCol[0][8-i] = faceCol[3][6+i];
        faceCol[3][6+i] = faceCol[1][6+i];
        faceCol[1][6+i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][8-i];
        faceCol[2][8-i] = faceCol[1][6+i];
        faceCol[1][6+i] = faceCol[3][6+i];
        faceCol[3][6+i] = faceCol[0][8-i];
        faceCol[0][8-i] = clTemp[i];
      }
    }
  }

  void rotL(int dir) {

    faceRot(5, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][i];
        faceCol[2][i] = faceCol[1][2-i];
        faceCol[1][2-i] = faceCol[3][2-i];
        faceCol[3][2-i] = faceCol[0][i];
        faceCol[0][i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][i];
        faceCol[2][i] = faceCol[0][i];
        faceCol[0][i] = faceCol[3][2-i];
        faceCol[3][2-i] = faceCol[1][2-i];
        faceCol[1][2-i] = clTemp[i];
      }
    }
  }

  void rotU(int dir) {

    faceRot(2, dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[1][i+(2*i)];
        faceCol[1][i+(2*i)] = faceCol[5][2-i];
        faceCol[5][2-i] = faceCol[0][6-(i*3)];
        faceCol[0][6-(i*3)] = faceCol[4][i];
        faceCol[4][i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[1][i+(2*i)];
        faceCol[1][i+(2*i)] = faceCol[4][i];
        faceCol[4][i] = faceCol[0][6-(i*3)];
        faceCol[0][6-(i*3)] = faceCol[5][2-i];
        faceCol[5][2-i] = clTemp[i];
      }
    }
  }

  void rotD(int dir) {

    faceRot(3, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[0][2+(3*i)];
        faceCol[0][2+(3*i)] = faceCol[5][6+i];
        faceCol[5][6+i] = faceCol[1][8-(i*3)];
        faceCol[1][8-(i*3)] = faceCol[4][8-i];
        faceCol[4][8-i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[0][2+(3*i)];
        faceCol[0][2+(3*i)] = faceCol[4][8-i];
        faceCol[4][8-i] = faceCol[1][8-(i*3)];
        faceCol[1][8-(i*3)]= faceCol[5][6+i];
        faceCol[5][6+i] = clTemp[i];
      }
    }
  }

  void rotF(int dir) {

    faceRot(0, dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][(2*(i+1))+i];
        faceCol[2][(2*(i+1))+i] = faceCol[5][8-(i*3)];
        faceCol[5][8-(i*3)] = faceCol[3][8-(i*3)];
        faceCol[3][8-(i*3)] = faceCol[4][(2*(i+1))+i];
        faceCol[4][(2*(i+1))+i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][(2*(i+1))+i];
        faceCol[2][(2*(i+1))+i] = faceCol[4][(2*(i+1))+i];
        faceCol[4][(2*(i+1))+i] = faceCol[3][8-(i*3)];
        faceCol[3][8-(i*3)] = faceCol[5][8-(i*3)];      
        faceCol[5][8-(i*3)] = clTemp[i];
      }
    }
  }
  void rotB(int dir) {

    faceRot(1, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][3*i];
        faceCol[2][3*i] = faceCol[4][3*i];
        faceCol[4][i*3] = faceCol[3][6-(i*3)];
        faceCol[3][6-(i*3)] = faceCol[5][6-(3*i)];
        faceCol[5][6-(3*i)] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faceCol[2][3*i];
        faceCol[2][3*i] = faceCol[5][6-(3*i)];
        faceCol[5][6-(3*i)] = faceCol[3][6-(i*3)];
        faceCol[3][6-(i*3)] = faceCol[4][i*3];
        faceCol[4][i*3] = clTemp[i];
      }
    }
  }


  void mov(char m) {
    switch(m) {
    case 'f': 
      rotF(1); 
      break;
    case 'F':
      rotF(-1);
      break;
    case 'u': 
      rotU(1); 
      break;
    case 'U':
      rotU(-1);
      break;
    case 'r': 
      rotR(1); 
      break;
    case 'R':
      rotR(-1);
      break;
    case 'l': 
      rotL(1); 
      break;
    case 'L':
      rotL(-1);
      break;
    case 'b': 
      rotB(1); 
      break;
    case 'B':
      rotB(-1);
      break;
    case 'd': 
      rotD(1); 
      break;
    case 'D':
      rotD(-1);
      break;
    }
    if (seq.length()!=0) {
      String t = ""+seq.charAt(seq.length()-1);
      if (t.equalsIgnoreCase(m+"")) {
        if (!t.equals(m+"")) {
          seq = seq.substring(0, seq.length()-1);
          return;
        } else if (seq.length()>=2) {
          if (seq.charAt(seq.length()-2)==m) {
            seq = seq.substring(0, seq.length()-2);
            if (Character.isLowerCase(m)) {
              m = Character.toUpperCase(m);
            } else {
              m = Character.toLowerCase(m);
            }
          }
        }
      }
    }
    seq += m;
  }

  void exeAlgo(String algo) {
    int n = algo.length();
    for (int i=0; i<n; i++) {
      mov(algo.charAt(i));
    }
  }

  boolean checkDone(String chk) {
    switch(chk) {
    case "cross": 
      {
        for (int i=1; i<=7; i+=2) {
          if (faceCol[2][i] != allCol[3]) {
            empty = i;
            return false;
          }
        }
        return true;
      }
    case "bl":
      {
        for (int i=5; i<=8; i++) {
          if (!chkPosC(i)) return false;
        }
        return true;
      }
    case "ml":
      {
        for (int i=5; i<=8; i++) {
          if (!chkPosE(i)) return false;
        }
        return true;
      }
    case "oll":
      {
        empty = 0;
        for (int i=0; i<=8; i+=2) {
          if (faceCol[2][i] == allCol[2]) {
            empty++;
          }
        }
        empty--;
        return empty == 4;
      }
    }
    return true;
  }


  void sexyMov(int pos) {
    String alg = "";
    switch(pos) {
    case 1: 
      alg = "luLU"; 
      break;
    case 2: 
      alg = "RUru"; 
      break;
    case 3: 
      alg = "ruRU"; 
      break;
    case 4: 
      alg = "LUlu"; 
      break;
    }
    exeAlgo(alg);
  }

  void sLayAlgo(int pos) {
    String alg = "";
    switch(pos) {
    case 5: 
      alg = "ulULUBub";
      break;
    case -5:
      alg = "uuBubulUL";
      break;
    case 6:
      alg = "ubUBURur";
      break;
    case -6:
      alg = "uuRurubUB";
      break;
    case 7:
      alg = "urURUFuf"; 
      break;
    case -7:
      alg = "UUFufurUR";
      break;
    case 8:
      alg = "ufUFULul";
      break;
    case -8:
      alg = "UULulufUF";
      break;
    }
    exeAlgo(alg);
  }

  void solveC() {
    //cross top
    while (!checkDone("cross")) {


      // manage empty space
      switch(empty) {
      case 1: 
        mov('U');
        break;
      case 3: 
        mov('u');
        mov('u');
        break;
      case 7:
        mov('u');
        break;
      }

      //search cross peice
      boolean found = false;
      int pos[] = new int[2];
      int j1=0, j2=4;
      while (!found && j1<=1) {
        found = false;
        for (int i=1; i<=7; i+=2) {
          if (faceCol[j1][i] == allCol[3]) {
            found = true;
            pos[0] = j1;
            pos[1] = i;
            break;
          }
          if (faceCol[j2][i] == allCol[3]) {
            found = true;
            pos[0] = j2;
            pos[1] = i;
            break;
          }
        }
        j1++;
        j2++;
      }

      //bottom layer search
      if (!found) {
        for (int i=1; i<=7; i+=2) {
          if (faceCol[3][i] == allCol[3]) {
            pos[0] = 3;
            pos[1] = i;
          }
        }
      }

      // mov peice to empty space
      switch(pos[0]) {
      case 0:
        {
          switch(pos[1]) {
          case 1: 
            exeAlgo("uL");
            break;
          case 3: 
            exeAlgo("fUr");
            break;
          case 5: 
            exeAlgo("FUr");
            break;
          case 7: 
            exeAlgo("Ur");
            break;
          }
          break;
        }
      case 1:
        {
          switch(pos[1]) {
          case 1: 
            exeAlgo("ul");
            break;
          case 3: 
            exeAlgo("bUl");
            break;
          case 5: 
            exeAlgo("UbRB");
            break;
          case 7: 
            exeAlgo("UR");
            break;
          }
          break;
        }        
      case 3:
        {
          switch(pos[1]) {
          case 1: 
            exeAlgo("d");
            break;
          case 3: 
            exeAlgo("dd");
            break;
          case 7: 
            exeAlgo("D");
            break;
          }
          exeAlgo("ff");
          break;
        }        
      case 4:
        {
          switch(pos[1]) {
          case 1: 
            exeAlgo("RF");
            break;
          case 3: 
            exeAlgo("uub");
            break;
          case 5: 
            exeAlgo("F");
            break;
          case 7: 
            exeAlgo("rFR");
            break;
          }
          break;
        }
      case 5:
        {
          switch(pos[1]) {
          case 1: 
            exeAlgo("lf");
            break;
          case 3: 
            exeAlgo("UUB");
            break;
          case 5: 
            exeAlgo("f");
            break;
          case 7: 
            exeAlgo("Lfl");
            break;
          }
          break;
        }
      }
    }

    //cross complete
    int index[] = {0, 4, 1, 5};
    for (int n = 0; n < 4; n++) {
      if (faceCol[1][3] == allCol[index[n]] && faceCol[2][3] == allCol[3]) {
        exeAlgo("uu");
      } else if (faceCol[4][1] == allCol[index[n]] && faceCol[2][7] == allCol[3]) {
        exeAlgo("u");
      } else if (faceCol[5][1] == allCol[index[n]] && faceCol[2][1] == allCol[3]) {
        exeAlgo("U");
      }
      switch(n) {
      case 0:
        exeAlgo("ff");
        break;
      case 1: 
        exeAlgo("Urr"); 
        break;
      case 2: 
        exeAlgo("uubb"); 
        break;
      case 3: 
        exeAlgo("ull"); 
        break;
      }
    }
  }
  void solveBL() {
    while (!checkDone("bl")) {

      int numu = 0, fpos = 0;
      String posU = "";
      boolean isLast = true;
      //search peice
      for (int i = 1; i<5; i++) {
        ArrayList<Integer> t = getC(i);
        if (t.contains(allCol[3])) {
          fpos = getCpos(i)-4;
          numu = fpos-i;
          isLast = false;
          break;
        }
      }

      //handle peice in last layer
      if (isLast) {
        for (int i=5; i<=8; i++) {
          if (!chkPosC(i)) {
            fpos = i;
            break;
          }
        }
        while (!chkPosC(fpos)) sexyMov(fpos-4);
        continue;
      }

      //mov peice to top of correct pos
      char movU = 'u';
      if (abs(numu) == 3) {
        numu = -numu/3;
      }
      if (numu < 0 ) {
        movU = 'U';
        numu = abs(numu);
      }
      for (int i=0; i< numu; i++) posU+= movU;
      exeAlgo(posU);

      //place in correct pos
      while (!chkPosC(fpos+4)) sexyMov(fpos);
    }
  }

  void solveML() {
    while (!checkDone("ml")) {
      int finPos = 0, currPos = 0;
      for (int i=1; i<=4; i++) {
        int tempPos = getEpos(i);
        if (tempPos >4 && tempPos <9) {
          finPos = tempPos;
          currPos = 3-i;
          break;
        }
      }
      if (finPos == 0) {
        for (int i=5; i<=8; i++) {
          if (!chkPosE(i)) {
            sLayAlgo(i);
            break;
          }
        }
        continue;
      }
      char mov = 'u';
      if (currPos == -1) {
        mov = 'U';
        currPos = 1;
      }
      for (int i=0; i<currPos; i++) {
        mov(mov);
      }
      int temp = 3 - (finPos - 4);
      mov = 'U';

      if (temp == -1) {
        mov = 'u';
        temp = 1;
      }
      for (int i=0; i<temp; i++) {
        mov(mov);
      }

      ArrayList<Integer> tcol = getE(finPos-4);
      int ti = finPos-4;
      if (tcol.get(1) != allCol[round(pow(ti, 3)*(8.0/3.0)-pow(ti, 2)*(39.0/2.0)+ti*(257.0/6.0)-25)]) finPos = -finPos;
      sLayAlgo(finPos);

      //print("\t"+finPos);
    }
  }

  void solveCross() {
    ArrayList<Integer> pos = new ArrayList<Integer>();
    for (int i = 1; i<8; i+=2) {
      if (faceCol[2][i] == allCol[2]) {
        pos.add(i);
      }
    }
    int len = pos.size();

    switch (len) {
    case 0 : 
      exeAlgo("fruRUFuufurURF");
      break;
    case 2:
      { 
        if (pos.get(0) == 1) {
          if (pos.get(1) == 7) {
            exeAlgo("fruRUF");
            return;
          } else if (pos.get(1) == 5) {
            mov('u');
          }
        } else if (pos.get(0) == 3) {
          if (pos.get(1) == 5) {
            exeAlgo("ufruRUF");
            return;
          }
          mov('U');
        } else {
          exeAlgo("uu");
        }
        exeAlgo("furURF");  
        break;
      }
    case 4 : 
      return;
    }
  }

  void cmpOll() {
    while (!checkDone("oll")) {
      if (empty == 1) {
        while (faceCol[2][2] != allCol[2]) {
          mov('u');
        }
      } else {
        while (faceCol[5][2] != allCol[2]) {
          mov('u');
        }
      }
      exeAlgo("ruRuruuR");
    }
  }

  void solveOll() {
    solveCross();
    cmpOll();
  }

  void solvePll() {
  }


  String solveCube() {
    seq = "";
    for (int i=0; i<6; i++) {
      faceCol[i] = r.faces[i].clone();
    }
    solveC();
    solveBL();
    solveML();
    solveOll();
    solvePll();
    //exeAlgo("uufl");
    //for(int i=1;i<5;i++){
    //  println(round(pow(i,3)*(8.0/3.0)-pow(i,2)*(39.0/2.0)+i*(257.0/6.0)-25));
    //}


    return seq;
  }
}

//LuuFuuLfluffUUrrubblluuLUluuRUruRUruRUrluLuruRUruRUruRUruRUruRuurURUFufULulufUFulULUBubUlULUBububUBURurUbUBURurfruRUFuufurURF
//LuuFuuLfluffUUrrubblluuLUluuRUruRUruRUrluLuruRUruRUruRUruRUruRuurURUFufULulufUFulULUBubUlULUBububUBURurUbUBURurfruRUFuufurURFuruRuruuRuuruRuruuRUruRuruuR
