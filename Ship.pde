public class Ship {
  private float xCoord, yCoord;

  //------------------//
  //   constructors   //
  //------------------//

  Ship() {
  }

  Ship(float xCoord, float yCoord) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
  }

  //------------------//
  //     methods      //
  //------------------//

  public void display() {
    image(ship, this.xCoord, height-100, 100, 100);
  }

  public void move() {
    if (mouseX < width-100 && mouseX > 0) {
      this.xCoord = mouseX;
    }
  }


  //------------------//
  //     getters      //
  //------------------//

  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  //------------------//
  //     setters      //
  //------------------//

  public void setXCoord(float xCoord) {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord) {
    this.yCoord = yCoord;
  }
}
