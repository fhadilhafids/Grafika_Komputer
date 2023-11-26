class Loading {
  int w = 300;
  int wait = 0;
  void load() {
    if (w > 700) {
      hint(DISABLE_DEPTH_TEST);
      //background
      game.Background();
      //obstacles
      for (int i = 0; i < 300; i++) {
        obstacles[i].move(4); //kecepatan gerak obstacle
      }
      game.SpawnObstacle(); //memunculkan rintangan (berdasarkan timer)
      game.collision(); //memeriksa tabrakan antara obstacle dan character

      //character
      Player.display();
      Player.physics();

      //timer, scoreboard dan control display
      game.timer();
      game.scoreboard();
      game.displayControls();
      game.back();
      game.back_hover();
      hint(ENABLE_DEPTH_TEST);
      if (isBackClicked){
        game.resetGameState();
        menu.display();
      }
    } else {
        pushMatrix();
        wait++;
        background(#151DA0);
        fill(255);
        textSize(30);
        text("Loading", 490, 300);
        strokeWeight(2);
        noFill();
        quad(300,200,700,200,700,230,300,230);
        fill(255);
        quad(300,200,w,200,w,230,300,230);
        fill(#151DA0);
        quad(0,200,300,200,300,230,0,230);
        if (wait >= 100) {
          hint(DISABLE_DEPTH_TEST);
          w += 80;
          wait = 0;
          hint(ENABLE_DEPTH_TEST);
        }
        popMatrix();
        
      }
  }
  void resetLoading() {
    w = 0;
  }
}
