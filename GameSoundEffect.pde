class GameSoundEffect {

  //Sound Objekte Deklarieren
  SoundFile soundEffect; //File das abgespielt wird
  String soundPath; //Relativer Pfad in dem das Soundfile hinterlegt ist
  File soundPathFile; //Um Files aus dem Ordner zu laden
  String[] soundEffectList; //Liste in dem die File namen abgelegt werden
  int soundEffectListPos; //Position in liste der Sounddatei

  GameSoundEffect() {

  }

  GameSoundEffect(String tempPath) {
    soundPath = tempPath;
    soundPathFile = new File(sketchPath("/" + soundPath));
    soundEffectList = soundPathFile.list();
    soundEffectListPos = int(random(0, soundEffectList.length - 0.0001));
    soundEffect = new SoundFile(EMI_Minispiel.this, soundPath + "/" + soundEffectList[soundEffectListPos]);
    soundEffect.amp(0.05);
  }

  void soundStart() {
    if (0 ==frameCount % 100) {
     // println(frameCount);
    }
    if (soundEffect.isPlaying()) {

    } else {
      soundEffect.play();
    }
  }

  void soundStartSpecific(String tempSoundEffect) {
    if (soundEffect.isPlaying()) {
      soundEffect.stop();
    }

    for (int i = 0; i <= soundEffectList.length - 1; ++i) {
      if (tempSoundEffect == soundEffectList[i]) {
          soundEffectListPos = i;
      }
    }

    soundEffect = new SoundFile(EMI_Minispiel.this, soundPath + "/" + tempSoundEffect + ".mp3");
    soundEffect.play();
  }

  void soundSetSpecific(String tempSpecific) {
    soundEffect = new SoundFile(EMI_Minispiel.this, tempSpecific);
  }

  void soundNext() {
    if (soundEffectListPos == soundEffectList.length) {
      soundEffectListPos = 0;
    } else {
      ++soundEffectListPos;
    }

    if (soundEffect.isPlaying()) {
      soundEffect.stop();
    }

    soundEffect.play();
  }

  void soundLoop() {
    soundEffect.loop();
  }

  void soundStop() {
    soundEffect.stop();
  }

  void soundPause() {
    soundEffect.pause();
  }

  void setVolume(float tempVolume) {
    soundEffect.amp(tempVolume);
  }
}
