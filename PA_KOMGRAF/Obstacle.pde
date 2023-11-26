class Obstacle{
  int _startX;
  int _spikeX;
  int _spikeY;
  int _squareX;
  int _squareY;
  int _speed;
  boolean _ignore;
  
  Obstacle(int x){
    _startX = x;
    _squareX = _startX;
    _spikeX = _startX;
    _ignore = false;
  }
  
  void spike(int y){ //mematikan character dari depan dan atas spike obstacle 
    _spikeY = y; 
    strokeWeight(2);
    stroke(150);
    fill(0);
    triangle(_spikeX, _spikeY, _spikeX+30, _spikeY, _spikeX+15, _spikeY-50);
    _spikeX -= _speed;
  }
  
  //mematikan character dari depan dan untuk di atas aman bagi character di obstacle square
  void square(int y){  
    _squareY = y; 
    rectMode(CENTER);
    strokeWeight(2);
    stroke(150);
    fill(0);
    rect(_squareX, _squareY, 50, 50); 
    _squareX -= _speed;
  }
  
  void ignore(){ //character dapat melompat di obstacle square
    _ignore = true;
  }
  
  //memeriksa tabrakan antara obstacle spike dan character
  int spikeGetX1(){
    return _spikeX+5; //spike bagian depan
  }
  int spikeGetX2(){
    return _spikeX+75; //bagian belakang spike
  }
  int spikeGetY1(){
    return _spikeY-50; //bagian atas spike
  }
  int spikeGetY2(){
    return _spikeY; //bagian bawah spike
  }
  
  //memeriksa tabrakan antara obstacle spike dan character
  int squareGetX1(){ //square bagian depan
    return _squareX-25;
  }
  int squareGetX2(){ //square bagian belakang
    return _squareX+75;
  }
  int squareGetY1(){ //square bagian atas
    return _squareY-25;
  }
  int squareGetY2(){ //square bagian bawah
    return _squareY+25;
  }
  
  void move(int speed){ //menentukan kecepatan pergerakan obstacle
    _speed = speed;
  }
}
