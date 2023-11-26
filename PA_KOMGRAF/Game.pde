class Game{
  void collision(){
    //ketika karakter terkena obstacle spike
    for(int i = 0; i < 300; i++){
      if(Player.getX() > obstacles[i].spikeGetX1() && Player.getX() < obstacles[i].spikeGetX2()){
        if(Player._PlayerY > obstacles[i].spikeGetY1() && Player._PlayerY < obstacles[i].spikeGetY2()){
          println("Death by Spike");
          backgroundMusic.stop();
          death.play();
          delay(1000);
          reset();
          
        }
      }
      //ketika karakter terkena obstacle square
      else if(Player.getX() > obstacles[i].squareGetX1() && Player.getX() < obstacles[i].squareGetX2()){
        
        if(Player._PlayerY > obstacles[i].squareGetY1() && Player._PlayerY < obstacles[i].squareGetY2()){
          println("Death by Square");
          backgroundMusic.stop();
          death.play();
          delay(1000);
          reset();
        }
        if(Player.getY() < obstacles[i].squareGetY1()){ //jika character ada di atas obstacle square
          Player._startY = obstacles[i].squareGetY1()-26;
        }
      }
      else if(Player.getX() > obstacles[i].squareGetX2() && !obstacles[i]._ignore){ //resets the "floor" value
        Player._startY = 524;
        obstacles[i].ignore(); 
      }
    }
  }
  
  void timer(){ //timer digunakan untuk menentukan skor dan obstacle yang muncul
    timer += 1;
    //println(timer); 
  }
  
  void reset(){ // restart game
    backgroundMusic.stop();
    backgroundMusic.play();
    //reset timer
    timer = 0;
    //reset obstacles
    for(int i = 0; i < 300; i++){
      obstacles[i] = new Obstacle(1000);
    }
    //reset "floor"
    Player._startY = 524;
    //jika mati, death counter akan bertambah 1
    deathCounter += 1;
    fade = 0;
  }
  
  void backmenu(){ // restart game
    backgroundMusic.stop();
    backgroundMusic.play();
    //reset timer
    timer = 0;
    //reset obstacles
    for(int i = 0; i < 300; i++){
      obstacles[i] = new Obstacle(1000);
    }
    //reset "floor"
    Player._startY = 524;
    //jika mati, death counter akan bertambah 1
    deathCounter = 0;
    fade = 0;
  }
  
  void scoreboard(){ //papan score
    if(timer > highScore){
      highScore = timer;
    }
    textAlign(CENTER);
    
    //menampilkan score tertinggi yang dicapai
    if(timer < 250){
      textSize(35);
      fill(#FFFFFF);
      text("Highscore: "+highScore/60, 800, 50); //skor tertinggi dibagi 60 jadi tiap detik = 1 poin
    }
    if(timer > 0 && timer < 1800){ 
      //menampilkan berapa kali character mati
      fill(255);
      textSize(45);
      text(deathCounter, 500, 60);
    }
  }
  
  void back(){
    noStroke();
    fill(#F5FC24);
    ellipse(20, 300, 100, 100);
    fill(#0611C9);
    ellipse(20, 300, 80, 80);
    image(back,2, 275, 50, 50);
  }

  void back_hover(){
    // Lingkaran Luar
    if (isBackHovered) {
      fill(#A8AA30); // Ganti warna saat mouse di atasnya
    } else {
      fill(#F5FC24);
    }
    ellipse(20, 300, 100, 100);
    
    // Lingkaran dalam
    if (isBackHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    ellipse(20,300,80,80);
    
    // Tombol back
    if (isBackHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    image(back,2, 275, 50, 50);
  }
  
  void resetGameState() {
    backmenu();
    isLoading = false;
    loading.resetLoading();
    highScore = 0;
    
    isStartsHovered = false;
    isAboutHovered = false;
    isExitsHovered = false;
    //isBackHovered = false;
    isBackMenuHovered = false;
    
    isStartClicked = false;
    isAboutClicked = false;
    isExitsClicked = false;
    isBackClicked = false;
    isBackMenuClicked = false;
  }
  
  void displayControls(){
    /*
    ketika timer masih dibawah 250, akan menampilkan penggunaan tombol.
    Sebaliknya ketika timer sdh mencapai 250 , akan menampilkan score
    */  
    if(timer < 250){
      textAlign(CENTER);
      textSize(35);
      fill(#FFFFFF);
      text("JUMP: UP or SPACE", 800, 350);
    }if(timer > 250 && timer < 1800){ 
      textAlign(CENTER);
      textSize(35);
      fill(#FFFFFF);
      text("Score: "+timer/60, 200, 50);
    }
  }
  
  void Background(){
    noStroke();
    fill(#3B45F2);
    rect(0,500,2000,1000);
    fill(#1D28E0);
    rect(100,80,150,130);
    
    rect(75,230,100,130);
    rect(155,195,40,55);
    rect(155,260,40,55);
    
    rect(100,380,150,130);
    
    rect(75,530,100,130);
    rect(155,495,40,55);
    rect(155,560,40,55);
    
    rect(280,120,150,200);
    rect(280,320,150,150);
    rect(280,520,150,200);
    
    rect(460,80,150,130);
    
    rect(435,230,100,130);
    rect(520,195,40,55);
    rect(520,260,40,55);
    
    rect(460,380,150,130);
    
    rect(435,530,100,130);
    rect(520,495,40,55);
    rect(520,560,40,55);
    
    rect(640,120,150,200);
    rect(640,320,150,150);
    rect(640,520,150,200);
    
    pushMatrix();
    translate(345,10);
    rect(460,80,150,130);
    
    rect(435,230,100,130);
    rect(520,195,40,55);
    rect(520,260,40,55);
    
    rect(460,380,150,130);
    
    rect(435,530,100,130);
    rect(520,495,40,55);
    rect(520,560,40,55);
    popMatrix();
    
    pushMatrix();
    translate(450,10);
    rect(460,80,150,130);
    
    rect(435,230,100,130);
    rect(520,195,40,55);
    rect(520,260,40,55);
    
    rect(460,380,150,130);
    
    rect(435,530,100,130);
    rect(520,495,40,55);
    rect(520,560,40,55);
    popMatrix();
    

    //lantai or ground
    strokeWeight(3);
    stroke(0);
    fill(#151DA0);
    rect(500, 600, 1050, 100);
  }
  
  void gameComplete(){
    //tampilan akan semakin gelap saat memenangkan game
    noStroke();
    fill(0, 0, 0, fade);
    rectMode(CENTER);
    rect(500, 300, 1000, 600);
    fade += 1;
    textAlign(CENTER);
    textSize(50);
    fill(random(255), random(255), random(255));
    text("You Win!", 500, 300);
  }
  
  void SpawnObstacle(){
    if(timer > 150 ){ 
      obstacles[1].square(525);
    }
    if(timer > 190){ 
      obstacles[2].square(475);
    }
    if(timer > 230 ){ 
      obstacles[3].square(525);
    }
    if(timer > 270 ){ 
      obstacles[4].square(475);
    }
    if(timer > 525){
      obstacles[1].spike(550);
    }
    if(timer > 600 ){
      obstacles[2].spike(550);
    }
    if(timer > 675){
      obstacles[3].spike(550);
    }
    if(timer > 682){
      obstacles[4].spike(550);
    }
    if(timer > 750){
      obstacles[5].square(525);
    }
    if(timer > 780){
      obstacles[6].square(475);
    }
    if(timer > 820){
      obstacles[7].square(425);
    }
    if(timer > 840){
      obstacles[8].square(375);
    }
    if(timer > 850){
      obstacles[5].spike(550);
    }
     if(timer > 858 ){
      obstacles[6].spike(550);
    }
    if(timer > 880 ){
      obstacles[9].square(375);
    }
    if(timer > 930 ){ 
      obstacles[10].square(375);
    }
    if(timer > 985 ){
      obstacles[7].spike(550);
    }
    if(timer > 1045 ){
      obstacles[8].spike(550);
    }
    if(timer > 1085){
      obstacles[9].spike(550);
    }
    if(timer > 1180 ){
      obstacles[10].spike(550);
    }
    if(timer > 1280){
      obstacles[11].spike(550);
    }
    if(timer > 1380 ){
      obstacles[12].spike(550);
    }
    if(timer > 1388){
      obstacles[13].spike(550);
    }
    if(timer > 1436){
      obstacles[14].spike(550);
    }
    if(timer > 1516){
      obstacles[15].spike(550);
    }
    //===============(END)===============
    if(timer > 1800){
      game.gameComplete();
    }
  }
}
