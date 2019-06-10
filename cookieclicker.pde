float cookiex = 250;
PFont font;
float cookiey = 400;
float backgroundx = 400;
float backgroundy = 400;
PImage cookie;
PImage background;
PImage cursorupgrade;
PImage alchemy;
PImage grandma;
PImage wood;
PImage cursor;
PImage factory;
PImage mine;
PImage shipment;
PImage farm;
float[] plusx = new float[50];
float[] plusy = new float[50];
float[] plusinc = new float[50];
float maxplus = 50;
float numplus = 0;
float cookiesize = 300;
boolean clickupgrade = false;
int inc = 1;
float clickupgradecost = 250;
int clicker = 0;
float clickercost = 15;
boolean clickers = false;
boolean alchemyupgrade = false;
float alchemyupgradecost = 2e5;
int alchemies = 0;
boolean shipmentupgrade = false;
float shipmentupgradecost = 4e4;
int shipments = 0;
boolean mineupgrade = false;
float mineupgradecost = 10000;
int mines = 0;
boolean factoryupgrade = false;
float factoryupgradecost = 3000;
int factories = 0;
int timelast = 0;
int timenow = millis();
int grandmas = 0;
float grandmaupgradecost = 100;
int farms = 0;
boolean farmupgrade = false;
float farmupgradecost = 500;
boolean grandmaupgrade = false;
float cps = (clicker * 0.1) + (grandmas * 0.5) + (farms * 4) + (factories * 10) + (mines * 40) + (shipments * 100) + (alchemies * 400);
boolean pageone = true;
boolean pagetwo = false;
void setup() {
  size(800, 800);
  font = loadFont("AmericanTypewriter-CondensedBold-48.vlw");
  imageMode(CENTER);
  cookie = loadImage ("250px-PerfectCookie-1.png");
  background = loadImage ("Hwlc0sT.jpg");
  cursor = loadImage ("Upgrades54.png");
  wood = loadImage ("A4gggdk.png");
  cursorupgrade = loadImage ("WhiteCursor.png");
  grandma = loadImage ("maxresdefault.jpg");
  farm = loadImage ("AchievementsEaster.png");
  factory = loadImage ("factory.png");
  mine = loadImage ("mines.png");
  shipment = loadImage ("shipment.png");
  alchemy = loadImage ("alchemy.png");
}
void draw() {
  textSize(20);
  String numpluss = nfc((int)(numplus));
  cps = (clicker * 0.1) + (grandmas * 0.5) + (farms * 4) + (factories * 10) + (mines * 40) + (shipments * 100) + (alchemies * 400);
  timenow = millis();
  if (timenow - timelast >= 100) {
    if (clicker >= 1) {
      numplus = numplus + clicker * 0.01;
    }    
    if (grandmas >= 1) {      
      numplus = numplus + grandmas * 0.05;
    }    
    if (farms >= 1) {      
      numplus = numplus + farms * 0.4;
    }    
    if (factories >= 1) {      
      numplus = numplus + factories * 1;
    }    
    if (mines >= 1) {      
      numplus = numplus + mines * 4;
    }    
    if (shipments >= 1) {      
      numplus = numplus + shipments * 10;
    }    
    if (alchemies >= 1) {      
      numplus = numplus + alchemies * 40;
    }    
    timelast = timenow;
  }  
  image (background, backgroundx, backgroundy, 1220, 800);  
  if (pageone == true) {    
    fill(0, 0, 0, 100);
    strokeWeight(1);    
    stroke(0);    
    rect(0, 50, 492, 120);    
    rect(508, 160, 300, 100);    
    rect(508, 260, 300, 100);    
    rect(508, 360, 300, 100);    
    rect(508, 460, 300, 100);    
    rect(508, 560, 300, 100);
    rect(508, 660, 300, 100);    
    textSize(20);    
    fill(255);    
    text("Page 2 >>", 670, 790);
  }  
  if (pagetwo == true) {    
    fill(0, 0, 0, 100);    
    strokeWeight(1);    
    stroke(0);    
    rect(0, 50, 492, 120);    
    rect(508, 160, 300, 100);
    rect(508, 260, 300, 100);      
    textSize(20);    
    fill(255);    
    textAlign(LEFT, BOTTOM);
    text("<< Page 1", 548, 790);    
    text("More comming soon...", 540, 500);
  }  
  image (cookie, cookiex, cookiey, cookiesize, cookiesize);  
  image (wood, 500, 0, 16, 1800);  
  if (pageone == true) {    
    image (cursor, 550, 200, 50, 50);
    image (cursorupgrade, 550, 300, 50, 50);    
    image (farm, 550, 500, 50, 50);    
    image (grandma, 550, 400, 50, 50);    
    image (factory, 550, 600, 50, 50);    
    image (mine, 550, 700, 50, 50);
  }  
  if (pagetwo == true) {
    image (shipment, 550, 200, 50, 50);    
    image (alchemy, 550, 300, 50, 50);
  }  
  for (int i = 0; i < maxplus; i++) {    
    if (plusx[i] > 0) {      
      float trans = 255 - plusinc[i] * 1.5;      
      fill(255, 255, 255, trans);      
      textFont(font, 28);
      text("+" + inc, plusx[i], plusy[i] - plusinc[i]);
      plusinc[i] += 1.5;      
      if (plusinc[i] > 200) {        
        plusx[i] = 0;        
        plusy[i] = 0;        
        plusinc[i] = 0;
      }
    }
  }  
  if (mouseX >= 250 - cookiesize/2 && mouseX <= 250 + cookiesize/2 && mouseY >= 400 - cookiesize/2 && mouseY <= 400 + cookiesize/2) {
    cookiesize = 320;
  } else {    
    cookiesize = 300;
  }  
  if (mousePressed) {    
    cookiesize = 300;
  }  
  textAlign(CENTER, BOTTOM);  
  fill(255, 255, 255, 255);  
  textFont(font, 28);  
  textSize(35);   
  if (numplus <= 999999) {    
    text(numpluss, 250, 135);
  }  
  if (numplus >= 1e6 && numplus < 1e9) {    
    String numberplus = nf(numplus/1000000, 1, 3);
    text(numberplus + " M", 250, 135);
  }  
  if (numplus >= 1e9 && numplus < 1e12) {    
    String numberplusbil = nf(numplus/1000000000, 1, 3);    
    text(numberplusbil + " B", 250, 135);
  }  
  if (numplus >= 1e12 && numplus < 1e15) {    
    String numberplustril = nf(numplus/1e12, 1, 3);    
    text(numberplustril + " T", 250, 135);
  }  
  if (numplus >= 1e15 && numplus < 1e18) {    
    String numberplusqua = nf(numplus/1e15, 1, 3);    
    text(numberplusqua + " Qua", 250, 135);
  }  
  if (numplus >= 1e18 && numplus < 1e21) {    
    String numberplusquin = nf(numplus/1e18, 1, 3);
    text(numberplusquin + " Quin", 250, 135);
  }  
  if (numplus >= 1e21 && numplus < 1e24) {    
    String numberplussext = nf(numplus/1e21, 1, 3);    
    text(numberplussext + " Sext", 250, 135);
  }
  if (numplus >= 1e24 && numplus < 1e27) {    
    String numberplussept = nf(numplus/1e24, 1, 3);    
    text(numberplussept + " Sept", 250, 135);
  }  
  if (numplus >= 1e27 && numplus < 1e30) {    
    String numberplusoct = nf(numplus/1e27, 1, 3);
    text(numberplusoct + " Oct", 250, 135);
  }  
  if (numplus >= 1e30) {    
    String numplusnon = nf(numplus/1e30, 1, 3);    
    text(numplusnon + " Non", 250, 135);
  } 
  if (pageone == true) {  
    textAlign(LEFT, BOTTOM);  
    textSize(12);  
    if (clickupgradecost < 1000000) {    
      String clickupgradecosts = nfc((int)(clickupgradecost));
      text("Cost: " + clickupgradecosts + " Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1000000 && clickupgradecost < 1000000000) {    
      String clickupgradecostmil = nf(clickupgradecost/1000000, 1, 3);
      text("Cost: " + clickupgradecostmil + " M Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1e9 && clickupgradecost < 1e12) {    
      String clickupgradecostbil = nf(clickupgradecost/1e9, 1, 3);    
      text("Cost: " + clickupgradecostbil + " B Cookies", 526.5, 250);
    }
    if (clickupgradecost >= 1e12 && clickupgradecost < 1e15) {    
      String clickupgradecosttril = nf(clickupgradecost/1e12, 1, 3);    
      text("Cost: " + clickupgradecosttril + " T Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1e15 && clickupgradecost < 1e18) {    
      String clickupgradecostqua = nf(clickupgradecost/1e15, 1, 3);    
      text("Cost: " + clickupgradecostqua + " Qua Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1e18 && clickupgradecost < 1e21) {    
      String clickupgradecostquin = nf(clickupgradecost/1e18, 1, 3);    
      text("Cost: " + clickupgradecostquin + " Quin Cookies", 526.5, 250);
    }
    if (clickupgradecost >= 1e21 && clickupgradecost < 1e24) {    
      String clickupgradecostsext = nf(clickupgradecost/1e21, 1, 3);    
      text("Cost: " + clickupgradecostsext + " Sext Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1e24 && clickupgradecost < 1e27) {    
      String clickupgradecostsept = nf(clickupgradecost/1e24, 1, 3);    
      text("Cost: " + clickupgradecostsept + " Sept Cookies", 526.5, 250);
    }  
    if (clickupgradecost >= 1e27 && clickupgradecost < 1e30) {    
      String clickupgradecostoct = nf(clickupgradecost/1e27, 1, 3);    
      text("Cost: " + clickupgradecostoct + " Oct Cookies", 526.5, 250);
    }     
    if (clickercost < 1e6) {    
      String clickercosts = nfc((int)(clickercost));    
      text("Cost: " + clickercosts + " Cookies", 526.5, 350);
    }  
    if (clickercost >= 1e6 && clickercost < 1e9) {
      String clickercostmil = nf(clickercost/1e6, 1, 3);    
      text("Cost: " + clickercostmil + " M Cookies", 526.5, 350);
    }  
    if (clickercost >= 1e9 && clickercost < 1e12) {    
      String clickercostbil = nf(clickercost/1e9, 1, 3);
      text("Cost: " + clickercostbil + " B Cookies", 526.5, 350);
    }  
    if (clickercost >= 1e12 && clickercost < 1e15) {    
      String clickercosttril = nf(clickercost/1e12, 1, 3);    
      text("Cost: " + clickercosttril + " T Cookies", 526.5, 350);
    }  
    if (clickercost >= 1e15 && clickercost < 1e18) {    
      String clickercostqua = nf(clickercost/1e15, 1, 3);    
      text("Cost: " + clickercostqua + " Qua Cookies", 526.5, 350);
    }  
    if (grandmaupgradecost < 1e6) {    
      String grandmaupgradecosts = nfc((int)(grandmaupgradecost));    
      text("Cost: " + grandmaupgradecosts + " Cookies", 526.5, 450);
    }
    if (grandmaupgradecost >= 1e6 && grandmaupgradecost < 1e9) {    
      String grandmaupgradecostmil = nf(grandmaupgradecost/1e6, 1, 3);    
      text("Cost: " + grandmaupgradecostmil + " M Cookies", 526.5, 450);
    }
    if (grandmaupgradecost >= 1e9 && grandmaupgradecost < 1e12) {    
      String grandmaupgradecostbil = nf(grandmaupgradecost/1e9, 1, 3);    
      text("Cost: " + grandmaupgradecostbil + " B Cookies", 526.5, 450);
    }
    if (grandmaupgradecost >= 1e12 && grandmaupgradecost < 1e15) {   
      String grandmaupgradecosttril = nf(grandmaupgradecost/1e12, 1, 3);   
      text("Cost: " + grandmaupgradecosttril + " T Cookies", 526.5, 450);
    }  
    if (grandmaupgradecost >= 1e15 && grandmaupgradecost < 1e18) {    
      String grandmaupgradecostqua = nf(grandmaupgradecost/1e15, 1, 3);    
      text("Cost: " + grandmaupgradecostqua + " Qua Cookies", 526.5, 450);
    }
    if (farmupgradecost < 1e6) {    
      String farmupgradecosts = nfc((int)(farmupgradecost));    
      text("Cost: " + farmupgradecosts + " Cookies", 526.5, 550);
    }  
    if (farmupgradecost >= 1e6 && farmupgradecost < 1e9) {
      String farmupgradecostmil = nf(farmupgradecost/1e6, 1, 3);    
      text("Cost: " + farmupgradecostmil + " M Cookies", 526.5, 550);
    }  
    if (farmupgradecost >= 1e9 && farmupgradecost < 1e12) {    
      String farmupgradecostbil = nf(farmupgradecost/1e9, 1, 3);
      text("Cost: " + farmupgradecostbil + " B Cookies", 526.5, 550);
    }  
    if (farmupgradecost >= 1e12 && farmupgradecost < 1e15) {    
      String farmupgradecosttril = nf(farmupgradecost/1e12, 1, 3);    
      text("Cost: " + farmupgradecosttril + " T Cookies", 526.5, 550);
    }  
    if (farmupgradecost >= 1e15 && farmupgradecost < 1e18) {    
      String farmupgradecostqua = nf(farmupgradecost/1e15, 1, 3);    
      text("Cost: " + farmupgradecostqua + " Qua Cookies", 526.5, 550);
    }  
    if (factoryupgradecost < 1e6) {    
      String factoryupgradecosts = nfc((int)(factoryupgradecost));    
      text("Cost: " + factoryupgradecosts + " Cookies", 526.5, 650);
    }  
    if (factoryupgradecost >= 1e6 && factoryupgradecost < 1e9) {
      String factoryupgradecostmil = nf(factoryupgradecost/1e6, 1, 3);   
      text("Cost: " + factoryupgradecostmil + " M Cookies", 526.5, 650);
    }  
    if (factoryupgradecost >= 1e9 && factoryupgradecost < 1e12) {
      String factoryupgradecostbil = nf(factoryupgradecost/1e9, 1, 3);    
      text("Cost: " + factoryupgradecostbil + " B Cookies", 526.5, 650);
    }  
    if (factoryupgradecost >= 1e12 && factoryupgradecost < 1e15) {
      String factoryupgradecosttril = nf(factoryupgradecost/1e12, 1, 3);    
      text("Cost: " + factoryupgradecosttril + " T Cookies", 526.5, 650);
    }  
    if (factoryupgradecost >= 1e15 && factoryupgradecost < 1e18) {
      String factoryupgradecostqua = nf(factoryupgradecost/1e15, 1, 3);    
      text("Cost: " + factoryupgradecostqua + " Qua Cookies", 526.5, 650);
    }
    if (mineupgradecost < 1e6) {    
      String mineupgradecosts = nfc((int)(mineupgradecost));    
      text("Cost: " + mineupgradecosts + " Cookies", 526.5, 750);
    }  
    if (mineupgradecost >= 1e6 && mineupgradecost < 1e9) {    
      String mineupgradecostmil = nf(mineupgradecost/1e6, 1, 3);
      text("Cost: " + mineupgradecostmil + " M Cookies", 526.5, 750);
    }  
    if (mineupgradecost >= 1e9 && mineupgradecost < 1e12) {    
      String mineupgradecostbil = nf(mineupgradecost/1e9, 1, 3);    
      text("Cost: " + mineupgradecostbil + " B Cookies", 526.5, 750);
    }  
    if (mineupgradecost >= 1e12 && mineupgradecost < 1e15) {    
      String mineupgradecosttril = nf(mineupgradecost/1e12, 1, 3);    
      text("Cost: " + mineupgradecosttril + " T Cookies", 526.5, 750);
    }  
    if (mineupgradecost >= 1e15 && mineupgradecost < 1e18) {    
      String mineupgradecostqua = nf(mineupgradecost/1e15, 1, 3);    
      text("Cost: " + mineupgradecostqua + " Qua Cookies", 526.5, 750);
    }
  }  
  if (pagetwo == true) {    
    textAlign(LEFT, BOTTOM);    
    textSize(12);  
    if (shipmentupgradecost < 1e6) {    
      String shipmentupgradecosts = nfc((int)(shipmentupgradecost));
      text("Cost: " + shipmentupgradecosts + " Cookies", 526.5, 250);
    }  
    if (shipmentupgradecost >= 1e6 && shipmentupgradecost < 1e9) {    
      String shipmentupgradecostmil = nf(shipmentupgradecost/1e6, 1, 3);    
      text("Cost: " + shipmentupgradecostmil + " M Cookies", 526.5, 250);
    }  
    if (shipmentupgradecost >= 1e9 && shipmentupgradecost < 1e12) {    
      String shipmentupgradecostbil = nf(shipmentupgradecost/1e9, 1, 3);    
      text("Cost: " + shipmentupgradecostbil + " B Cookies", 526.5, 250);
    }  
    if (shipmentupgradecost >= 1e12 && shipmentupgradecost < 1e15) {    
      String shipmentupgradecosttril = nf(shipmentupgradecost/1e12, 1, 3);    
      text("Cost: " + shipmentupgradecosttril + " T Cookies", 526.5, 250);
    }  
    if (shipmentupgradecost >= 1e15 && shipmentupgradecost < 1e18) {    
      String shipmentupgradecostqua = nf(shipmentupgradecost/1e15, 1, 3);    
      text("Cost: " + shipmentupgradecostqua + " Qua Cookies", 526.5, 250);
    }
    if (alchemyupgradecost < 1e6) {   
      String alchemyupgradecosts = nfc((int)(alchemyupgradecost));    
      text("Cost: " + alchemyupgradecosts + " Cookies", 526.5, 350);
    }  
    if (alchemyupgradecost >= 1e6 && alchemyupgradecost < 1e9) {
      String alchemyupgradecostmil = nf(alchemyupgradecost/1e6, 1, 3);  
      text("Cost: " + alchemyupgradecostmil + " M Cookies", 526.5, 350);
    }  
    if (alchemyupgradecost >= 1e9 && alchemyupgradecost < 1e12) {
      String alchemyupgradecostbil = nf(alchemyupgradecost/1e9, 1, 3);    
      text("Cost: " + alchemyupgradecostbil + " B Cookies", 526.5, 350);
    }  
    if (alchemyupgradecost >= 1e12 && alchemyupgradecost < 1e15) {
      String alchemyupgradecosttril = nf(alchemyupgradecost/1e12, 1, 3);    
      text("Cost: " + alchemyupgradecosttril + " T Cookies", 526.5, 350);
    }  
    if (alchemyupgradecost >= 1e15 && alchemyupgradecost < 1e18) {
      String alchemyupgradecostqua = nf(alchemyupgradecost/1e15, 1, 3);    
      text("Cost: " + alchemyupgradecostqua + " Qua Cookies", 526.5, 350);
    }
  }   
  textAlign(CENTER, BOTTOM);  
  fill(255, 255, 255, 255);
  textFont(font, 28);  
  textSize(50);  
  text("Shop", 650, 125);  
  textSize(35);  
  text("Cookies:", 250, 90);  
  textSize(18);  
  String cookiespersecond = nf(cps, 1, 1);  
  text("Cookies per second: " + cookiespersecond, 250, 160);
  if (pageone == true) {    
    textSize(15);    
    text("Doubles your", 639, 195);    
    text("clicking amount", 650, 215);    
    text("Buy one", 622.5, 600);    
    text("Factory", 621, 620);    
    text("Buy one", 622.5, 300);
    text("Auto Clicker", 640, 320);    
    text("Buy one", 622.5, 400);    
    text("Grandma", 625, 420);    
    text("Buy one", 622.5, 500);    
    text("Farm", 612, 520);    
    text("Buy one", 622.5, 700);    
    text("Mine", 612, 720);
    text("You own:", 750, 500);    
    text("You own:", 750, 300);    
    text("You own:", 750, 400);    
    text("You own:", 750, 600);    
    text("You own:", 750, 700);    
    textAlign(RIGHT, BOTTOM);    
    text(clicker, 785, 320);
    text(farms, 785, 520);    
    text(grandmas, 785, 420);    
    text(factories, 785, 620);    
    text(mines, 785, 720);    
    textAlign(LEFT, BOTTOM);    
    textSize(12);
  }  
  if (pagetwo == true) {    
    textSize(15);    
    text("Buy one", 622.5, 200);    
    text("Shipment", 622.5, 220);    
    text("You own:", 750, 200);    
    text("You own:", 750, 300);
    text("Buy one", 622.5, 300);    
    text("Alchemy Lab", 641, 320);    
    textAlign(RIGHT, BOTTOM);    
    text(shipments, 785, 220);    
    text(alchemies, 785, 320);
  }  
  if (clickers == true) {    
    clickercost = (clickercost * 1.15);
    clickers = false;
  }  
  if (grandmaupgrade == true) {    
    grandmaupgradecost = (grandmaupgradecost * 1.15);    
    grandmaupgrade = false;
  }  
  if (farmupgrade == true) {    
    farmupgradecost = farmupgradecost * 1.15;
    farmupgrade = false;
  }  
  if (factoryupgrade == true) {    
    factoryupgradecost = (factoryupgradecost * 1.15);    
    factoryupgrade = false;
  }  
  if (mineupgrade == true) {    
    mineupgradecost = (mineupgradecost * 1.15);
    mineupgrade = false;
  }  
  if (shipmentupgrade == true) {    
    shipmentupgradecost = (shipmentupgradecost * 1.15);    
    shipmentupgrade = false;
  }  
  if (alchemyupgrade == true) {    
    alchemyupgradecost = (alchemyupgradecost * 1.15);
    alchemyupgrade = false;
  }  
  if (pageone == true) {    
    if (mouseX >= 670 && mouseX <= 765 && mouseY >= 770 && mouseY <= 790) {      
      fill(255, 0, 0, 255);      
      strokeWeight(4);      
      stroke(255);
      line(670, 790, 760, 790);
    }
  }  
  if (pagetwo == true) {    
    if (mouseX >= 549 && mouseX <= 640 && mouseY >= 770 && mouseY <= 790) {      
      strokeWeight(4);      
      stroke(255);      
      line(549, 790, 640, 790);
    }
  }
}
void mouseClicked() {  
  if (pagetwo == true) {  
    if (mouseX >= 549 && mouseX <= 640 && mouseY >= 770 && mouseY <= 790) {      
      pageone = true;      
      pagetwo = false;
    }
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 175 && mouseY <= 225 && numplus >= shipmentupgradecost) {    
      shipments = shipments + 1;    
      numplus = numplus - shipmentupgradecost;
      shipmentupgrade = true;
    }  
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 275 && mouseY <= 325 && numplus >= alchemyupgradecost) {    
      alchemies = alchemies + 1;    
      numplus = numplus - alchemyupgradecost;
      alchemyupgrade = true;
    }
  }  
  if (pageone == true) {    
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 675 && mouseY <= 725 && numplus >= mineupgradecost) {      
      mines = mines + 1;      
      numplus = numplus - mineupgradecost;
      mineupgrade = true;
    }    
    if (mouseX >= 670 && mouseX <= 765 && mouseY >= 770 && mouseY <= 790) {      
      pageone = false;      
      pagetwo = true;
    }
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 175 && mouseY <= 225 && numplus >= clickupgradecost) {      
      clickupgrade = true;      
      if (clickupgrade == true) {        
        numplus = numplus - clickupgradecost;
        clickupgradecost = clickupgradecost * 2;        
        inc = inc * 2;        
        clickupgrade = false;
      }
    }    
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 375 && mouseY <= 425 && numplus >= grandmaupgradecost) {
      grandmas = grandmas + 1;      
      numplus = numplus - grandmaupgradecost;      
      grandmaupgrade = true;
    }    
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 474 && mouseY <= 525 && numplus >= farmupgradecost) {
      farms = farms + 1;      
      numplus = numplus - farmupgradecost;      
      farmupgrade = true;
    }    
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 275 && mouseY <= 325 && numplus >= clickercost) {
      numplus = numplus - clickercost;      
      clicker = clicker + 1;      
      clickers = true;
    }    
    if (mouseX >= 525 && mouseX <= 575 && mouseY >= 575 && mouseY <= 625 && numplus >= factoryupgradecost) {
      numplus = numplus - factoryupgradecost;      
      factories = factories + 1;      
      factoryupgrade = true;
    }    
    if (mouseX >= 549 && mouseX <= 640 && mouseY >= 770 && mouseY <= 790) {      
      pageone = true;
      pagetwo = false;
    }
  }
  if (mouseX >= 250 - cookiesize/2 && mouseX <= 250 + cookiesize/2 && mouseY >= 400 - cookiesize/2 && mouseY <= 400 + cookiesize/2) {    
    for (int i = 0; i < maxplus; i++) {
      if (plusx[i] == 0 && plusy[i] == 0) {        
        numplus = numplus + inc;        
        plusx[i] = mouseX - 10;        
        plusy[i] = mouseY;        
        plusinc[i] = 10;        
        break;
      }
    }
  }
}