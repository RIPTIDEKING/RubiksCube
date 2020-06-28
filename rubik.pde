

class Rubik {

  int lay = 3;
  Cubie c[][][] = new Cubie[lay][lay][lay];
  int blocks = lay*lay;
  color faces[][] = new color[6][blocks];

  Rubik() {

    for (int i=0; i<6; i++) {
      for (int j=0; j< blocks; j++) {
        faces[i][j] = allCol[i];
      }
    }


    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        for (int k=0; k<lay; k++) {
          c[i][j][k] = new Cubie(i-1, j-1, k-1);
        }
      }
    }
  }

  void faceRot(int facInd, int dir) {
    animating = true;
    color tempCl;
    if (dir==1) {
      //corners
      tempCl = faces[facInd][0];
      faces[facInd][0] = faces[facInd][2];
      faces[facInd][2] = faces[facInd][8];
      faces[facInd][8] = faces[facInd][6];
      faces[facInd][6] = tempCl;
      //edges
      tempCl = faces[facInd][3];
      faces[facInd][3] = faces[facInd][1];
      faces[facInd][1] = faces[facInd][5];
      faces[facInd][5] = faces[facInd][7];
      faces[facInd][7] = tempCl;
    } else {
      //corners
      tempCl = faces[facInd][0];
      faces[facInd][0] = faces[facInd][6];
      faces[facInd][6] = faces[facInd][8];
      faces[facInd][8] = faces[facInd][2];
      faces[facInd][2] = tempCl;
      //edges
      tempCl = faces[facInd][3];
      faces[facInd][3] = faces[facInd][7];
      faces[facInd][7] = faces[facInd][5];
      faces[facInd][5] = faces[facInd][1];
      faces[facInd][1] = tempCl;
    }
  }


  void rotR(int dir) {
    for (int k=0; k<lay; k++) {
      for (int j=0; j<lay; j++) {
        c[2][j][k].rotMul = dir;
        c[2][j][k].xrot = true;
      }
    }
    
    faceRot(4, dir);
    if (dir==1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][8-i];
        faces[2][8-i] = faces[0][8-i];
        faces[0][8-i] = faces[3][6+i];
        faces[3][6+i] = faces[1][6+i];
        faces[1][6+i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][8-i];
        faces[2][8-i] = faces[1][6+i];
        faces[1][6+i] = faces[3][6+i];
        faces[3][6+i] = faces[0][8-i];
        faces[0][8-i] = clTemp[i];
      }
    }
  }

  void rotL(int dir) {
    for (int k=0; k<lay; k++) {
      for (int j=0; j<lay; j++) {
        c[0][j][k].rotMul = -dir;
        c[0][j][k].xrot = true;
      }
    }

    faceRot(5, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][i];
        faces[2][i] = faces[1][2-i];
        faces[1][2-i] = faces[3][2-i];
        faces[3][2-i] = faces[0][i];
        faces[0][i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][i];
        faces[2][i] = faces[0][i];
        faces[0][i] = faces[3][2-i];
        faces[3][2-i] = faces[1][2-i];
        faces[1][2-i] = clTemp[i];
      }
    }
  }

  void rotU(int dir) {
    for (int i=0; i<lay; i++) {
      for (int k=0; k<lay; k++) {
        c[i][0][k].rotMul = -dir;
        c[i][0][k].yrot = true;
      }
    }
    faceRot(2, dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[1][i+(2*i)];
        faces[1][i+(2*i)] = faces[5][2-i];
        faces[5][2-i] = faces[0][6-(i*3)];
        faces[0][6-(i*3)] = faces[4][i];
        faces[4][i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[1][i+(2*i)];
        faces[1][i+(2*i)] = faces[4][i];
        faces[4][i] = faces[0][6-(i*3)];
        faces[0][6-(i*3)] = faces[5][2-i];
        faces[5][2-i] = clTemp[i];
      }
    }
  }

  void rotD(int dir) {
    for (int i=0; i<lay; i++) {
      for (int k=0; k<lay; k++) {
        c[i][2][k].rotMul = dir;
        c[i][2][k].yrot = true;
      }
    }

    faceRot(3, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[0][2+(3*i)];
        faces[0][2+(3*i)] = faces[5][6+i];
        faces[5][6+i] = faces[1][8-(i*3)];
        faces[1][8-(i*3)] = faces[4][8-i];
        faces[4][8-i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[0][2+(3*i)];
        faces[0][2+(3*i)] = faces[4][8-i];
        faces[4][8-i] = faces[1][8-(i*3)];
        faces[1][8-(i*3)]= faces[5][6+i];
        faces[5][6+i] = clTemp[i];
      }
    }
  }

  void rotF(int dir) {

    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][j][2].rotMul = dir;
        c[i][j][2].zrot = true;
      }
    }

    faceRot(0, dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][(2*(i+1))+i];
        faces[2][(2*(i+1))+i] = faces[5][8-(i*3)];
        faces[5][8-(i*3)] = faces[3][8-(i*3)];
        faces[3][8-(i*3)] = faces[4][(2*(i+1))+i];
        faces[4][(2*(i+1))+i] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][(2*(i+1))+i];
        faces[2][(2*(i+1))+i] = faces[4][(2*(i+1))+i];
        faces[4][(2*(i+1))+i] = faces[3][8-(i*3)];
        faces[3][8-(i*3)] = faces[5][8-(i*3)];      
        faces[5][8-(i*3)] = clTemp[i];
      }
    }

    //for (int k=0; k<6; k++) {
    //  for (int i=0; i<9; i++) {
    //    faces[k][i] = color(map(i, 0, 9, 0, 255));
    //  }
    //}
  }
  void rotB(int dir) {
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][j][0].rotMul = -dir;
        c[i][j][0].zrot = true;
      }
    }

    faceRot(1, -dir);
    if (dir == 1) {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][3*i];
        faces[2][3*i] = faces[4][3*i];
        faces[4][i*3] = faces[3][6-(i*3)];
        faces[3][6-(i*3)] = faces[5][6-(3*i)];
        faces[5][6-(3*i)] = clTemp[i];
      }
    } else {
      color clTemp[] = new color[3];
      for (int i=0; i<3; i++) {
        clTemp[i] = faces[2][3*i];
        faces[2][3*i] = faces[5][6-(3*i)];
        faces[5][6-(3*i)] = faces[3][6-(i*3)];
        faces[3][6-(i*3)] = faces[4][i*3];
        faces[4][i*3] = clTemp[i];
      }
    }
  }

  void update() {
    //front face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][j][2].fillCol[0] = faces[0][(i*3)+j];
      }
    }
    //back face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][j][0].fillCol[1] = faces[1][(i*3)+j];
      }
    }
    //top face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][0][j].fillCol[2] = faces[2][(i*3)+j];
      }
    }
    //bottom face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[i][2][j].fillCol[3] = faces[3][(i*3)+j];
      }
    }
    //right face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[2][i][j].fillCol[4] = faces[4][(i*3)+j];
      }
    }
    //left face
    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        c[0][i][j].fillCol[5] = faces[5][(i*3)+j];
      }
    }
  }

  void show() {


    for (int i=0; i<lay; i++) {
      for (int j=0; j<lay; j++) {
        for (int k=0; k<lay; k++) {
          c[i][j][k].show();
        }
      }
    }
    
    if (!animating) {
      update();
    }
  }
}
