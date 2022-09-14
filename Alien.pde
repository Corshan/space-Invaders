public class Alien {
  private float xCoord, yCoord;
  private float speed;
  private boolean alive;

  //------------------//
  //   constructors   //
  //------------------//

  public Alien() {
  }

  public Alien(boolean alive) {
    this.alive = alive;
  } 

  public Alien(float xCoord, float yCoord, float speed) {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.speed = speed;
  }

  //------------------//
  //     methods      //
  //------------------//

  public void display() {
    if (this.alive) {
      image(alienShip, this.xCoord, this.yCoord, 30, 30);
    }
  }

  public void display(boolean alive) {
    this.alive = alive;
    if (this.alive) {
      image(alienShip, this.xCoord, this.yCoord, 50, 50);
    }
  }

  public void move(float speed) {
    this.speed = speed;
    if (this.alive) {
      this.yCoord += this.speed;
    }
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

  public boolean getAlive() {
    return alive;
  }

  //------------------//
  //     setters      //
  //------------------//

  public void setAlive(boolean alive) {
    this.alive = alive;
  }

  public void setXCoord(float xCoord) {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord) {
    this.yCoord = yCoord;
  }
}
