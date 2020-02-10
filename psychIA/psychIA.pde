  //odds are b and w
  // 4 mountain
  // 3 forest
  // 2 lake
  // 1 flowers
 
  // pick 6 even and 6 odd from each category
  
  
  // fixed the released problem
  boolean instruction = true;
  boolean expirement = false;
  Button proceed = new Button(300,500,110,40,5,155,195,175);
  PImage img[] = new PImage [96];
  int [][] imgShown = new int[4][12];
  int [] tempArr = {0,1,2,3,4,5,6,7,8,9,10,11};
  IntList s;
  
void setup() {
  size(600, 600);
  proceed.setText("Proceed", 25,20);
  imgShown = randnumList(12); //<>//
  for(int i=  0; i< tempArr.length; i++){
    s.append(tempArr[i]);
  }
  s.shuffle();
  //fullScreen();
  
  int t = 0;
  for(int i = 1; i < 5; i++){
      for(int j = 1; j < 25; j++){
        img[t] = loadImage(i+" ("+j+").jpg");
        print(t);
        t++;
      }
  }
}


void draw() {

  
  background(220);
  if(instruction){
      instructions();
  }else if (expirement){
    expirement();
  }
}


void instructions(){

  background(220);
  proceed.display();
  fill(0);
  text("this is the screen for the instructions",300,100);
  if(proceed.depressed()){
     instruction = false;
    expirement = true;
  }

}

void expirement(){
  //background(220);
  //image(img[11],0,0);
  part1();
  
  
  //Button agree = new Button(450,500,110,40,5,155,195,175);
  //agree.setText("Agree", 25,20);
  //Button disagree = new Button(150,500,110,40,5,155,195,175);
  //disagree.setText("Disagree", 25,20);
  //background(220);
  //fill(0);
  //text("this is the screen for the expirement",300,100);

  // agree.display();
  // disagree.display();
  //if(agree.depressed){
  //  // proced to istructions
  //}
  //else if(disagree.depressed){
  //  //thank you screen
  //}
}

//void consentForm(){
//  Button agree = new Button(450,500,110,40,5,155,195,175);
//  agree.setText("Agree", 25,20);
//  Button disagree = new Button(150,500,110,40,5,155,195,175);
//  disagree.setText("Disagree", 25,20);
//  background(220);
//  fill(0);
//  text("this is the screen for the consent form",300,100);
//  //int x, int y, int w, int h, int r, color c, color pressedColor, color hoverColor
  
//   agree.display();
//   disagree.display();
//  if(agree.released){
//    // proced to istructions
//  }
//  else if(disagree.released){
//    //thank you screen
//  }
//}

void part1(){
  
  //image(img[17],0,0);
  println("part1");
  for(int i = 0;i < 4; i++){
    println(i);
    //image(img[imgShown[i]],0,0);
    image(img[19],0,0);
    delay(1000);
    //background(220);
    delay(500);
  } 
}

int[][] randnumList(int num){
  int[][] temp = new int[4][num]; //<>//
  for(int j = 0; j< 4; j++){ //<>//
    println("first loop");
    int odds = 0;
    for(int i = 0; i< num; i++){ //<>//
      println("second loop");
      boolean unique = false;
      while(!unique){ //<>//
        int p = (int) random(12); //<>//
        delay(500);
        //println(p);
         if(notcontains(temp[j],p)){
           //println(p + "2");
            //println("odd "+ odds);
           if(p%2==0){
             println("therep " + p + p%2); //<>//
             if(temp[j].length - odds < num/2){
               println("even "+ temp[j].length);
               temp[j][i] = p;
               unique = true;
               }  //<>//
             }else{ //<>//
               println(odds);
               if(odds < (int)num/2){
               temp[j][i] = p;
               unique = true;
               odds++;  //<>//
             } //<>//
           } //<>//
           
         }
       }
  
      }
    }
    print("here");
   
   return temp; //<>//
   
}

boolean notcontains(int [] temp, int t){
  int s = t;
  for(int i = 0; i < temp.length ; i++){
    if(temp[i] == s){
      return false;
    }
  }
  return true;
}
