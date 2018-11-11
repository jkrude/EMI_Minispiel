class PowerUp {
  PVector pos = new PVector(); //Powerpos
  int difficulty; //Schwierigkeit
  int powerUpEffectPotency; //Die Wirksamkeit/potenz/Stärke des PowerUps
  String levelDifficulty; //Powerspawn Negativ + Postiv oder eins von beiden
  String[] powerUpOptionsPositive = new String[]{"armor", "life", "speed", "shotSpeed", "shotBounce", "shotHighCapacity"}; //Positive Powerups
  String[] powerUpOptionsNegativ = new String[]{"slowness", "lifeSickness", "playerColorSwitch", "shotLowCapacity"}; //Negative Powerups;
  String powerUpChoose; //Powerup das gewählt wurde
  PImage powerUpImg;

  //Funktion zum auswwerten der Übergebenen Parameter und setzen des PowerUpStatus
  PowerUp(String tempPowerUpType, String tempPowerUpChoose) {
    if (tempPowerUpChoose != null) {
      powerUpChoose = tempPowerUpChoose;
    } else if (tempPowerUpType != null) {
      powerUpChoose = setRandomPowerUp(tempPowerUpType);
    } else {
      powerUpChoose = setRandomPowerUp(null);
    }
  }

  // Funktion um Random ein PowerUp zu generieren. Als Parameter kann übergeben werden ob das PowerUp positiv oder negativ sien soll.
  String setRandomPowerUp(String tempPowerUpType) {
    int powerUpOption; //Funktionsvariable um das Richtige Element aus den PowerUpTabellen zu ziehen

    if (tempPowerUpType == "positive") {
      powerUpOption = int(random(0, powerUpOptionsPositive.length - 1));
      int intPowerUpOption = powerUpOption;
    } else if (tempPowerUpType == "negativ") {
      powerUpOption = int(random(0, powerUpOptionsNegativ.length - 1));
    } else {
      powerUpOption = int(random(0, powerUpOptionsPositive.length + powerUpOptionsNegativ.length - 1));
      if (powerUpOption >= powerUpOptionsPositive.length - 1) {
        powerUpOption -= powerUpOptionsPositive.length;
      } else {

      }
    }
    return powerUpOptionsPositive[powerUpOption];
  }

  //Gibt den PowerUp Effekt zurück
  String getPowerUpChoose() {
    return powerUpChoose;
  }

  //Setzt die PowerUp Effekt Stärke/Potenz
  void setPowerUpEffectPotency(int tempDifficulty, String tempLevelDifficulty) {
    int tempPowerUpEffectPotency;
    switch (tempLevelDifficulty) {
      case "easy":
        powerUpEffectPotency = tempDifficulty + 2;
      case "normal":
        powerUpEffectPotency = tempDifficulty;
      case "hard":
        if (tempDifficulty >= 3) {
          powerUpEffectPotency = tempDifficulty - 2;
        } else if (tempDifficulty >= 2) {
          powerUpEffectPotency = tempDifficulty - 1;
        } else {
          powerUpEffectPotency = tempDifficulty;
        }
    }
  }

  //Gibt die PowerUp Effekt Stärke/Potenz zurück
  int getPowerUpEffectPotency() {
    return powerUpEffectPotency;
  }

  //Setzt Position den PowerUps
  void setPos() {
    do {
      pos.x = random(32, width - 32);
      pos.y = random(32, height - 32);
      //println("Position X: " + pos.x);
      //println("Position Y: " + pos.y);
    } while (false); //Vervollständige
    //return pos; //muss nicht zurück gegeben werden
  }

  //Gibt die Position des PowerUps zurück
  PVector getPos() {
    return pos;
  }

  //Grafik für PowerUp wird geladen
  void setPowerUpImage() {
    String tempPowerUpImg = "img/powerup/" + powerUpChoose + ".png"; //C:/Users\lenna\Documents\GitHub\EMI_Minispiel\img\powerup\armor.PNG
    powerUpImg = loadImage(tempPowerUpImg);
    //powerUpImg = loadImage("armor.PNG");
  }

  //Render Funktion für das Objekt auf dem Spielfeld
  void render() {
    image(powerUpImg, pos.x, pos.y, 50, 50);
  }
}
