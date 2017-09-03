class Timer {
  int startTime = 0, stopTime = 0;
  boolean running = false;  


  void start() {
    if (bEasy == true && bMedium == false && bHard == false) {
      startTime = millis();
      running = true;
    } else if (bEasy == false && bMedium == true && bHard == false) {
      startTime = millis();
      running = true;
    } else if (bEasy == false && bMedium == false && bHard == true) {
      startTime = millis();
      running = true;
    }
  }
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
  
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
}