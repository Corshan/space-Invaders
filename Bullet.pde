public class Bullet {
  private float xCoord, yCoord;

  //------------------//
  //   constructors   //
  //------------------//

  Bullet() {
  }

  Bullet(float xCoord, float yCoord) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
  }

  //------------------//
  //     methods      //
  //------------------//

  public void display(float xCoord, float yCoord) {
    fill(250, 245, 0);
    rect(this.xCoord, yCoord+10, 5, 34);
    if (mouseX < width-100 && mouseX > 0) {
      this.xCoord = xCoord;
    }
    this.yCoord = yCoord;
  }

  public void move() {

    this.yCoord -= 45;
  }

  public void restart(float xCoord, float yCoord) {
    this.xCoord = xCoord + 50;
    this.yCoord = yCoord + 50;
  }

  //------------------//
  //     getters      //
  //------------------//

  public float getYCoord() {
    return yCoord;
  }

  public float getXCoord() {
    return xCoord;
  }

  //------------------//
  //     setters      //
  //------------------//

  public void setYCoord(float yCoord) {
    this.yCoord = yCoord;
  }

  public void setXCoord(float xCoord) {
    this.xCoord = xCoord;
  }
}
