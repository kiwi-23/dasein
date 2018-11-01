import processing.serial.*;
Serial myPort;
Grid[][] cell;
//int[] active_cells_r;
//int[] active_cells_c;
int lvl1[][]= {
{-1,-1,-1,0,0,0,1,1,1},
{-1,0,1,-1,0,1,-1,0,1}
};
//int active_count;
int unit= 25;
int rows, columns;
int prev_val= 0;
int current_r, current_c;

void setup(){
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  //fullScreen();
  //noCursor();
  size(500,400);
  rows= height/unit +1;
  columns= width/unit +1;
  cell = new Grid[rows][columns];
  //active_cells_r = new int[rows*columns];
  //active_cells_c = new int[rows*columns];
  for(int i=0; i<rows; i++){
    for(int j=0; j<columns; j++){
      cell[i][j]= new Grid(i, j);
    }
  }
}

class Grid{
  int rpos, cpos;
  int rindex, cindex;
  int r=128, b=128, g=128;
  String type;
  Grid(int r, int c){
    rpos= r*unit;
    cpos= c*unit;
    rindex= r;
    cindex= c;
  }
  
  void activate(){
    this.g= (int)(random(1,256));
    if(this.r==255 || this.b==255){
      this.r= (int)(random(0,256));
      this.b= (int)(random(0,256));
    }
    this.internal();
    //active_cells_r[++active_count]=this.rindex;
    //active_cells_c[active_count]=this.cindex;
  }
  
  void internal(){  
    this.g= round(this.g + ((this.g-this.r)/4));
    this.g= check(this.g);
    if(this.g==0) this.g=128;
    this.b= round(this.b + ((this.b-this.g)/4));
    this.b= check(this.b);
    int level;
    for(int i=-2; i<=2; i++){
      for(int j=-2; j<=2; j++){
        if(i==0 && j==0)
          continue;
        if((i+this.rindex)<0 || (i+this.rindex)>(rows-1) || (j+this.cindex)<0 || (j+this.cindex)>(columns-1))
          continue;
        level= 2;
        for(int a=0; a<9; a++){
          if(i==lvl1[0][a] && j==lvl1[1][a])
            level=1;
        }
        cell[i+this.rindex][j+this.cindex].external(this, level);
        //if(active_count>0)
        //  cell[i+square.rindex][j+square.cindex].match_active();
      }
    }
  }
  
  void external(Grid square, int level){
    if(level==1){
      this.r= round(this.r + ((this.r-square.b)/4));
      square.r= round(square.r + ((square.r-this.b)/4));
      this.r= check(this.r);
      square.r= check(square.r);
    }
    if(level==2){
      this.r= round(this.r + ((this.r-square.b)/8));
      square.r= round(square.r + ((square.r-this.b)/8));
    }
  }
  
  //void match_active(){
  //  int num1= this.rindex;
  //  int num3= this.cindex;
  //  for(int i=0; i<active_count; i++)
  //  {
  //    int num2= active_cells_r[i];
  //    int num4= active_cells_c[i];
  //    if(num1==num2 && num3==num4){
  //      internal(this);
  //    }
  //  }
  //}
  
  int check(int num){
    if(num>255){
      num=256-num;
    }
    if(num<0){
      num= num+256;
    }
    return num;
  }
}

void draw(){
  //if (myPort.available() > 0) 
  //{
    //String val = myPort.readStringUntil('\n');
    //println(val);
    //if(val!=null){
      //val= trim(val);
      String val="1";
      if(val.equals("1")){
        prev_val=0;
        if(prev_val==0){
          int randomr= (int)(random(0,rows));
          int randomc= (int)(random(0,columns));
          cell[randomr][randomc].activate();
          current_r=randomr;
          current_c=randomc;
        }
        else{
          cell[current_r][current_c].internal();
        }
        prev_val=1;
      }
      else if(val.equals("0")){
        prev_val=0;
      }
      for(Grid[] row : cell){
        for(Grid square : row){
          fill(square.r, square.g, square.b);
          stroke(100,100,100);
          rect(square.cpos, square.rpos, unit, unit);
        }
      }
  //  }
  //}
}