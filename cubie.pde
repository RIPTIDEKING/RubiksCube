
int animSpeed = 44;
class Cubie {


  float x, y, z;
  float size = 30;
  color fillCol[] = new color[6];
  float rotX, rotY, rotZ;
  boolean xrot = false, yrot = false, zrot = false;
  int rotMul = 1;
  int countAnim = 90;


  Cubie(float x, float y, float z) {
    this.x = x*size;
    this.y = y*size;
    this.z = z*size;
    rotX = rotY = rotZ = 0;
  }

  void comXrot() {
    if (xrot) {
      rotateX(rotX);
      rotX = rotX+radians(animSpeed)*rotMul;
      countAnim -= animSpeed;
      if (countAnim <= 0) {
        xrot = false; 
        rotX = 0;
        countAnim = 90;
        animating = false;
      }
    }
  }
  void comYrot() {
    if (yrot) {
      rotateY(rotY);
      rotY = rotY+radians(animSpeed)*rotMul;
      countAnim -= animSpeed;
      if (countAnim <= 0) {
        yrot = false; 
        rotY = 0;
        countAnim = 90;
        animating = false;
      }
    }
  }

  void comZrot() {
    if (zrot) {
      rotateZ(rotZ);
      rotZ = rotZ+radians(animSpeed)*rotMul;
      countAnim -= animSpeed;
      if (countAnim <= 0) {
        zrot = false; 
        rotZ = 0;
        countAnim = 90;
        animating = false;
      }
    }
  }

  void colBox() {
    rectMode(CENTER);

    //noStroke();
    //Front
    fill(fillCol[0]);
    translate(0, 0, 15);
    rect(0, 0, 30, 30, 5);

    //Back
    fill(fillCol[1]);
    translate(0, 0, -30);
    rect(0, 0, 30, 30, 5);

    //Top
    fill(fillCol[2]);
    translate(0, -15, 15);
    rotateX(PI/2);
    rect(0, 0, 30, 30, 5);

    //Bottom
    fill(fillCol[3]);
    translate(0, 0, -30);
    rect(0, 0, 30, 30, 5);

    //Right
    fill(fillCol[4]);
    translate(15, 0, 15);
    rotateY(PI/2);
    rect(0, 0, 30, 30, 5);

    //Left
    fill(fillCol[5]);
    translate(0, 0, -30);
    rect(0, 0, 30, 30, 5);
  }

  void show() {
    pushMatrix();
    comXrot();
    comYrot();
    comZrot();
    translate(x, y, z);
    colBox();
    popMatrix();
  }
}
