class About{
  // Color palette
  color background1 = #151DA0;
  
  void Show(){
    AboutUs();
    BackMenu();
    if (isBackMenuClicked){
        game.resetGameState();
        menu.display();
    }
  }
  
  void AboutUs() {
    background(background1);
    fill(#FFFFFF);

    textSize(50);
    text("ABOUT US", 500, 50 );
    text("Kelompok 4 B1 2021", 480, 150);
    
    text("2109106065", 210, 250);
    text("2109106072", 210, 350);
    text("2109106076", 210, 450);
    
    text("Mahsa Jacinda Putri", 610, 250);
    text("M.Fadhil Hafids H. ", 610, 350);
    text("M.Amin Quthbi Arabi", 610, 450);
  }
  
  void BackMenu(){
    strokeWeight(1);
    // Lingkaran Luar
    if (isBackMenuHovered) {
      fill(#A8AA30); // Ganti warna saat mouse di atasnya
    } else {
      fill(#F5FC24);
    }
    ellipse(20, 300, 60, 60);
    
    // Lingkaran dalam
    if (isBackMenuHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    ellipse(20,300,50,50);
    
   // Teks Button
    if (isBackMenuHovered) {
      fill(#A8AA30);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#F5FC24);
    }
    textSize(20);  
    textAlign(CENTER, CENTER); 
    text("Back", 20, 300);  
  }
}
