SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here

int fruit_num;
int fruit_score;
int totalScore = 500;
int [] fruitCount = {0,0,0,0,0,0};
int [] randomNumber = {0,0,0};

// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      totalScore =totalScore-50;
      
      for (int mm=0;mm<3;mm++){
        randomNumber[mm]=0;
      //fruit_num = int(random(6));
      //machine.setSlotFruit(mm,fruit_num);
      //totalScore = totalScore + machine.getSlotScore(fruit_num);
      }
      for (int mm=0;mm<6;mm++){
        fruitCount[mm]=0;
      }  
      //----------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
      for (int mm=0;mm<3;mm++){
      double ran_num;
        ran_num = random(1);
        if (ran_num<=pow(1.0/10.0,1.0/3.0) ){
            fruit_num = 0; 
        }
        else { 
            fruit_num= int (random(1,5));
        }
      fruitCount[fruit_num]=fruitCount[fruit_num]+1;
      randomNumber[mm]=fruit_num;
      machine.setSlotFruit(mm,fruit_num);     
    }
      for (int nn=0;nn<6;nn++){
      totalScore= totalScore + machine.getSlotScore(nn)*fruitCount[nn]*fruitCount[nn];
      } 
 
 
      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}






