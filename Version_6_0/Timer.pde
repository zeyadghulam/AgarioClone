
class Timer {
  int startTime = 0, stopTime = 0;
  //boolean that turn time on/off
  boolean running = true;  

  //function that starts time
  void start() {
    startTime = millis();
    running = true;
  }

  //Function that stops the time
  void stop() {
    stopTime = millis();
    running = false;
  }

  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    } else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }

  //Function that grabs the exact seconds
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  //Function that grabs the exact minutes
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
}