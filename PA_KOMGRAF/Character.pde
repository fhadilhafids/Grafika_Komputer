class Character{ //<>//
  int _PlayerX; 
  int _PlayerY; 
  int _PlayerSize; 
  int _startY; 
  color _playerColor;

  int gravity = 6; //gravitasi yang dipengaruhi oleh objek pemain
  int jumpCounter = 0; //berapa lama lompatan 
  int jumpCounterLimit = 20; //batas jumpCounter
  boolean isJumping = false; //boolean ketika ingin melompat
  float jumpAngle = 0; //sudut objek diputar
  float incrementAngle = PI/20; //increment dimana jumpAngle akan diubah saat melompat
  boolean notInAir = true; //menentukan kapan chracter diperbolehkan untuk melompat

  Character(int x, int y, int size){
    _PlayerX = x;
    _PlayerY = y;
    _PlayerSize = size;
    _startY = y; //digunakan untuk menentukan kapan gravitasi aktif
    _playerColor = color(53, 240, 165);
  }
  
  void jump(){ //membuat character dapat melompat
    hint(DISABLE_DEPTH_TEST);
    if(notInAir){ //jika character berada di tanah maka, character boleh melompat
      isJumping = true; 
    }
    hint(ENABLE_DEPTH_TEST);
  }
  
  void physics(){
    hint(DISABLE_DEPTH_TEST);
    if(_PlayerY < _startY){ 
      _PlayerY += gravity; //objek pemain tidak berada di udara, menghentikan "jump()" agar tidak berfungsi
      notInAir = false; //player object is not in the air, stopping "jump()" from working
    }else{
      notInAir = true; //jika character berada di "floor" = true, "jump()" dapat berfungsi
    }
    
    //lompatan dipicu oleh method "jump()".
    if(isJumping){
      
      // saat lompat warna akan berubah secara acak
      _playerColor = color(random(255), random(255), random(255));
      _PlayerY -= 12; 
      jumpCounter += 1; //increments jumpCounter, yang menentukan kapan harus berhenti melompat
        
  }
    if(jumpCounter >= jumpCounterLimit){ //ketika counter mencapai batas, lompatan berhenti
      isJumping = false;
      jumpCounter = 0; //counter di reset
    }
    
    //berputar di udara
    if(!notInAir){
      jumpAngle += incrementAngle; //increments jumpAngle, mengaktifkan rotasi di "display()"
    }else {
        jumpAngle = 0;
        // character berada di ground/lantai, atur ulang warna ke warna aslinya
        _playerColor = color(53, 240, 165);
    }
    hint(ENABLE_DEPTH_TEST);
  }
  
  //metode yang digunakan saat memeriksa tabrakan dengan obstacle
  int getX(){ 
    return _PlayerX + _PlayerSize/2;  
  }
  int getY(){
    return _PlayerY + _PlayerSize/2; 
  }

  void display(){
    hint(DISABLE_DEPTH_TEST);
    pushMatrix(); 
    rectMode(CENTER);
    translate(_PlayerX, _PlayerY);
    rotate(jumpAngle); 
    strokeWeight(1);
    stroke(22, 85, 60);
    fill(_playerColor);  // Menggunakan warna yang diambil dari atribut _playerColor
    rect(0, 0, _PlayerSize, _PlayerSize);
    popMatrix();//matriks diperlukan untuk memuat transformasi rotasi
    hint(ENABLE_DEPTH_TEST);
  }
}
