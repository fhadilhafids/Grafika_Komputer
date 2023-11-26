//import soundfile library
import processing.sound.*;
//sound ketika game sudah dimulai
SoundFile backgroundMusic;
//Sound ketika karakter mati
SoundFile death;

PImage img;
PImage back;
Menu menu = new Menu();
Loading loading = new Loading();
About about = new About();
boolean isLoading = false;
Character Player;
Game game = new Game();
Obstacle[] obstacles = new Obstacle[300]; //Berapa banyak rintangan yang ingin di spawn

boolean isStartsHovered = false;
boolean isAboutHovered = false;
boolean isExitsHovered = false;
boolean isBackHovered = false;
boolean isBackMenuHovered = false;

boolean isStartClicked = false;
boolean isAboutClicked = false;
boolean isExitsClicked = false;
boolean isBackClicked = false;
boolean isBackMenuClicked = false;


int timer = 0; //digunakan untuk skor dan waktu obstacle
int deathCounter = 0; //jumlah kematian
int highScore = 0; //menampilkan highscore pemain
int fade = 0; //layar akan gelap saat character menang
void setup() {
  size(1000, 600, P3D);
  backgroundMusic = new SoundFile(this, "Stereo Madness.mp3");
  backgroundMusic.play();
  backgroundMusic.amp(0.5);
  death = new SoundFile(this, "Death Noise.wav");
  death.rate(1.10); //kecepatan sound
  death.amp(0.25); //controls volume
  img = loadImage("bgMenu.jpg");
  back= loadImage("backtomenu.png");

  Player = new Character(150, 524, 50);
  for (int i = 0; i < 300; i++) {
    obstacles[i] = new Obstacle(1000); //obstacle akan spawn di paling kanan layar
  }
}

void draw() {
  if (isLoading) {
    loading.load();
  }else if(isAboutClicked){
    about.Show();
  }else{
    menu.display();
  }
}


void mousePressed() {
  if (isStartsHovered) {
    isStartClicked = true;
    isLoading = true;
  }
  if (isBackHovered) {
    isBackClicked = true;
  }
  if (isAboutHovered) {
    isAboutClicked = true;
  }
  if (isExitsHovered) {
    isExitsClicked = true;
    exit();
    println("Keluar dari Game");
  }
  if (isBackMenuHovered){
    isBackMenuClicked = true;
  }
}

void mouseMoved() {
  // Mendeteksi apakah mouse berada di atas tombol "starts"
  if (dist(mouseX, mouseY, 500, 500) < 50) {
    isStartsHovered = true;
  } else {
    isStartsHovered = false;
  }

  // Mendeteksi apakah mouse berada di atas tombol "about"
  if (dist(mouseX, mouseY, 40, 105) < 50) {
    isAboutHovered = true;
  } else {
    isAboutHovered = false;
  }

  // Mendeteksi apakah mouse berada di atas tombol "exits"
  if (dist(mouseX, mouseY, 960, 105) < 50) {
    isExitsHovered = true;
  } else {
    isExitsHovered = false;
  }
  
  // Mendeteksi apakah mouse berada di atas tombol "back"
  if (dist(mouseX, mouseY, 30, 300) < 50) {
    isBackHovered = true;
  } else {
    isBackHovered = false;
  }
    // Mendeteksi apakah mouse berada di atas tombol "back"
  if (dist(mouseX, mouseY, 20, 300) < 50) {
    isBackMenuHovered = true;
  } else {
    isBackMenuHovered = false;
  }
}

void keyPressed() {
    switch(key) {
      //melompat saat tombol spasi di tekan
      case ' ':
        Player.jump();
        break;
      // mereset game saat tombol r ditekan
      case 'r':
        game.reset();
        break;
    }
    
    switch(keyCode) {
      // melompat saat tombol arrow up ditekan
      case UP:
        Player.jump();
        break;
    }
}
