class Menu {
  float startsSize = 100;
  void character_menu(){
    strokeWeight(1);
    pushMatrix(); 
    translate(20, 400); 
    strokeWeight(1);
    stroke(22, 85, 60);
    fill(random(255), random(255), random(255));  // Menggunakan warna yang diambil dari atribut _playerColor
    quad(0,0,50,0,50,50,0,50);
    popMatrix();
  }
  // method
  void display() {
    background(0);
    image(img,0, 0, width, height);
    hint(DISABLE_DEPTH_TEST);
    character_menu();
    fill(#FAD726);
    pushMatrix();
    translate(310,50);
    //BADAN
    strokeWeight(5);
    beginShape();
    vertex(50, 300);
    vertex(50, 100);
    vertex(250, 100);
    vertex(250, 300);
    vertex(50, 300);
    endShape(CLOSE);
    
    //MULUT
    strokeWeight(5);
    fill(#2CD6FF);
    beginShape();
    vertex(80, 280);
    vertex(80, 230);
    vertex(120, 230);
    vertex(130, 260);
    vertex(140, 230);
    vertex(170,230);
    vertex(180,260);
    vertex(190,230);
    vertex(230,230);
    vertex(230,280);
    vertex(165,280);
    vertex(155,250);
    vertex(145,280);
    vertex(80, 280);
    endShape(CLOSE);
    
    // MATA
    strokeWeight(6);
    line(80,170,140,170);
    line(170,170,230,170);
    popMatrix();
    pushMatrix();
    //lantai or ground
    noStroke();
    fill(#151DA0);
    quad(0,450,1000,450,1000,550,0,550);
    fill(#000000);
    triangle(190,450,210,410,230,450);
    translate(40,0);
    triangle(190,450,210,410,230,450);
    translate(100,0);
    triangle(190,450,210,410,230,450);
    translate(150,0);
    triangle(190,450,210,410,230,450);
    translate(200,0);
    triangle(190,450,210,410,230,450);
    popMatrix();
    starts();
    //about();
    //exits();
    starts_hover();
    about_hover();
    exit_hover();
    
    hint(ENABLE_DEPTH_TEST);
    judul();
  }
  
  void starts(){
    noStroke();
    float distance = dist(mouseX, mouseY, 500, 500);
  
    // Menentukan ukuran yang diinginkan berdasarkan jarak mouse ke pusat elemen
    float targetSize = map(distance, 0, 50, 120, 100); // Ubah ukuran dari 120 menjadi 100 saat mouse mendekati elemen
  
    // Animasi ease-in untuk perubahan ukuran
    float easing = 0.1;
  
    startsSize += (targetSize - startsSize) * easing; // Menerapkan animasi ease-in
  
    // Lingkaran Luar
    fill(#F5FC24);
    ellipse(500, 500, startsSize, startsSize);
    
    // Lingkaran dalam
    fill(#0611C9);
    ellipse(500, 500, startsSize * 0.8, startsSize * 0.8);
    
    // Tombol Play
    fill(#F5FC24);
    triangle(525, 500, 485, 525, 485, 475);
  
  }

  void starts_hover(){
    // Lingkaran Luar
    if (isStartsHovered) {
      fill(#A8AA30); // Ganti warna saat mouse di atasnya
    } else {
      fill(#F5FC24);
    }
    ellipse(500, 500, 100, 100);
    
    // Lingkaran dalam
    if (isStartsHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    ellipse(500,500,80,80);
    
    // Tombol Play
    if (isStartsHovered) {
      fill(#EBF01D);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#F5FC24);
    }
    triangle(525, 500, 485, 525, 485, 475);
  }
  
  
  void about_hover(){
    // Kotak Luar
    if (isAboutHovered) {
      fill(#A8AA30); // Ganti warna saat mouse di atasnya
    } else {
      fill(#F5FC24);
    }
    ellipse(40, 105, 60, 60);
    
    // Kotak dalam
    if (isAboutHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    ellipse(40,105,50,50);
    
   // Teks Button
    if (isAboutHovered) {
      stroke(#A8AA30);// Ganti warna saat mouse di atasnya
      
    } else {
      stroke(#F5FC24);
    }
    pushMatrix();
    translate(20,80);
    scale(0.3);
    strokeWeight(10);
    noFill();
    beginShape();
    curveVertex(25, 60);
    curveVertex(25, 60);
    curveVertex(35, 40);
    curveVertex(55, 35);
    curveVertex(75, 40);
    curveVertex(95, 60);
    curveVertex(93, 83);
    curveVertex(70, 95);
    curveVertex(70, 140);
    curveVertex(25,60);
    endShape();
    popMatrix();
  }
  
  
  void exit_hover(){
    strokeWeight(1);
        // Kotak Luar
    if (isExitsHovered) {
      fill(#A8AA30); // Ganti warna saat mouse di atasnya
    } else {
      fill(#F5FC24);
    }
    ellipse(960, 105, 60, 60);
    
    // Kotak dalam
    if (isExitsHovered) {
      fill(#1D2267);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#0611C9);
    }
    ellipse(960, 105,50,50);
    
   // Teks Button
    if (isExitsHovered) {
      fill(#A8AA30);// Ganti warna saat mouse di atasnya
      
    } else {
      fill(#F5FC24);
    }
    textSize(20);  
    textAlign(CENTER, CENTER); 
    text("Exit", 960, 100);  
  }
  
  void judul() {

    
    pushMatrix();
    {
      
      translate(width/2, height/2, 100);
      fill(246, 175, 33);
      rotateY(radians(map(mouseX, 0, width, -10, 10)));
      noStroke();
      lights();
      translate(0, 80);
      scale(0.9);
      //HURUF S
      pushMatrix();
      {
        translate(-340, -300);
        box(37, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-315, -290);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-340, -280);
        box(45, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-363, -310);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-340, -320);
        box(45, 10, 20);
      }
      popMatrix();

      // HURUF H
      pushMatrix();
      {
        translate(-255, -300);
        box(10, 52, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-280, -300);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-300, -300);
        box(10, 52, 20);
      }
      popMatrix();

      //Huruf A
      pushMatrix();
      {
        translate(-240, -295);
        box(10, 43, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-218, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-218, -295);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-195, -295);
        box(10, 43, 20);
      }
      popMatrix();

      //Huruf P
      pushMatrix();
      {
        translate(-180, -295);
        box(10, 43, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-155, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-155, -295);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-130, -307);
        box(10, 16, 20);
      }
      popMatrix();

      //Huruf E
      pushMatrix();
      {
        translate(-113, -300);
        box(10, 35, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-90, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-90, -300);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(-90, -280);
        box(41, 10, 20);
      }
      popMatrix();

      //HURUF R
      pushMatrix();
      {
        translate(0, -295);
        box(10, 43, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(25, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(25, -300);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(35, -290);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(47, -280);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(47, -310);
        box(10, 15, 20);
      }
      popMatrix();
      //HURUF U
      pushMatrix();
      {
        translate(63, -303);
        box(10, 43, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(85, -280);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(107, -303);
        box(10, 43, 20);
      }
      popMatrix();
      //HURUF N
      pushMatrix();
      {
        translate(123, -300);
        box(10, 52, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(133, -310);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(145, -300);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(156, -290);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(167, -300);
        box(10, 52, 20);
      }
      popMatrix();
      //HURUF N
      pushMatrix();
      {
        translate(185, -300);
        box(10, 52, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(196, -310);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(207, -300);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(218, -290);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(229, -300);
        box(10, 52, 20);
      }
      popMatrix();
      //Huruf E
      pushMatrix();
      {
        translate(243, -300);
        box(10, 35, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(266, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(266, -300);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(266, -280);
        box(41, 10, 20);
      }
      popMatrix();
      
      //HURUF R
      pushMatrix();
      {
        translate(295, -295);
        box(10, 43, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(320, -320);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(320, -300);
        box(41, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(330, -290);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(342, -280);
        box(13, 10, 20);
      }
      popMatrix();
      pushMatrix();
      {
        translate(342, -310);
        box(10, 15, 20);
      }
      popMatrix();
    }
    popMatrix();
  }
}
