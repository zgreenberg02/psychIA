//odds are b and w //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
// 4 mountain
// 3 forest
// 2 lake
// 1 flowers

// pick 6 even and 6 odd from each category

int correctB = 0;
int correctC = 0;
int ncorrectB = 0;
int ncorrectC = 0;
int imageSize = 1000;
int c = 0;
int k = 0;
boolean instruction = true;
boolean expirement = false;

String s1 = "Welcome, and thank you for agreeing to take part in our experiment on memory! Once you click Proceed, you will be shown a series of 48 images for one (1) second each. Later in the experiment, you will be asked to remember which images you saw. Please press the button whenever you are ready to begin. If you have any questions, please ask one of the experimenters now.";
String s2 = "You will now be tasked to identify which images you saw. In the following section, you will be shown an image, and you will be asked whether or not you saw it in the previous section. Select the Yes button for images that you remember seeing, and select the No button for images that you have not. When you finish, you will be able to see your results. If you have any questions, please ask one of the experimenters now. If not, please press Proceed.";
String s3 = "Thank you for participating in the experiment, your data has been collected. The aim of this experiment was to investigate whether the images being black and white or in color had an impact on your ability to remember them. If you wish to know the full results of the experiment or have any further questions you are more than welcome to leave your e-mail. Thank you once again for your participation.";

Button proceed = new Button(950, 900, 110, 40, 5, 155, 195, 175);
Button yes = new Button(150, 900, 110, 40, 5, 155, 195, 175);
Button no = new Button(1750, 900, 110, 40, 5, 155, 195, 175);
Button next = new Button(300, 1000, 110, 40, 5, 155, 195, 175);
Button end = new Button(1600, 1000, 110, 40, 5, 155, 195, 175);
PrintWriter output;


PImage img[] = new PImage [96];
int[] num = new int[48];
int [][] imgShown = new int[4][12];
boolean part1 = true;
IntList s = new IntList();
IntList t = new IntList();

boolean part2 = false;

void setup() {

  no.setText("No", 25, 20);
  yes.setText("Yes", 25, 20);
  proceed.setText("Proceed", 25, 20);
  next.setText("Next", 25, 20);
  end.setText("End", 25, 20);


  randomStuff();
  imageMode(CENTER);
  output = createWriter("results.txt"); 


  fullScreen();

  int t = 0;
  for (int i = 1; i < 5; i++) {
    for (int j = 1; j < 25; j++) {
      img[t] = loadImage(i+" ("+j+").jpg");
      if (img[t].width < img[t].height) {
        img[t].resize(0, imageSize);
      } else {
        img[t].resize(imageSize, 0);
      }
      print(t);
      t++;
    }
  }
}


void randomStuff() {

  t.clear();
  for (int i =  0; i< 96; i++) {
    t.append(i);
  }
  t.shuffle();

  s.clear();
  for (int i =  0; i< 12; i++) {
    s.append(i);
  }
  s.shuffle();

  for (int i = 0; i < 4; i++) {
    s.shuffle();
    for (int j = 0; j < 12; j++) {
      imgShown[i][j] = s.get(j);
    }
  }

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      imgShown[i][j] = 2*imgShown[i][j];
    }
    for (int j = 6; j < 12; j++) {
      imgShown[i][j] = 2*imgShown[i][j] + 1;
    }
  }
  s.clear();
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 12; j++) {
      s.append(i*24+imgShown[i][j]);
    }
  }
  s.shuffle();
  s.shuffle();
  for (int i = 0; i< 48; i++) {
    num[i] = s.get(i);
  }
} 


void draw() {

  background(220);
  if (instruction) {
    instructions();
  } else if (expirement) {
    expirement();
  } else {
    debrief();
  }
}

void debrief() {
  background(220);
  next.display();
  end.display();
  fill(0);
  textSize(40);
  text("Debrief", 950, 150);
  textSize(24);
  text(s3, 950, 300, 1500, 1000);
  strokeWeight(4);
  stroke(0);
  line(0,950,2000,950);
  text("Please Dont Touch",950,900);
  text(ncorrectB + "  " + ncorrectC + "  " + correctB + "  " + correctC,950, 1000);
  if (next.depressed()) {
    s.clear();
    t.clear();
    instruction = true;
    expirement = false;
    part2 = false;
    part1 = true;

    ncorrectB = 0;
    ncorrectC = 0;
    correctB = 0;
    correctC = 0;
    c = 0;
    k = 0;
    randomStuff();
  }
  if (end.depressed()) {
    output.close();
    exit();
  }
}

void instructions() {

  background(220);
  proceed.display();
  fill(0);
  textSize(40);
  text("Part 1", 950, 150);
  textSize(24);
  text(s1, 950, 300, 1500, 1000);
  if (proceed.depressed()) {
    instruction = false;
    expirement = true;
  }
}

void i2() {

  background(220);
  proceed.display();
  fill(0);
  textSize(40);
  text("Part 2", 950, 150);
  textSize(24);
  text(s2, 950, 300, 1500, 1000);
  if (proceed.depressed()) {
    part2 = true;
  }
}

void expirement() {

  if (part1) {
    part1();
  } else {
    if (!part2) {
      i2();
    } else {
      part2();
    }
  }
}


void part1() {

  if (c<48) {
    delay(1000);
    image(img[num[c]], width/2, height/2);
    c++;
  } else {
    delay(1000);
    part1 = false;
  }
}

void part2() {

  if (k<96) {
    image(img[t.get(k)], width/2, height/2);
    yes.display();
    no.display();
    if (yes.depressed()) {
      if (s.hasValue(t.get(k))) {
        if (t.get(k)%2 == 0) {
          correctC++;
        } else {
          correctB++;
        }
      }
      k++;
      delay(500);
    } else if (no.depressed()) {

      if (!s.hasValue(t.get(k))) {
        if (t.get(k)%2 == 0) {
          ncorrectC++;
        } else {
          ncorrectB++;
        }
      }

      k++;
      delay(500);
    }
  } else {
    output.println(correctC);
    output.println(correctB);
    output.println(ncorrectC);
    output.println(ncorrectB);
    output.println();


    part2 = false;
    expirement = false;
  }
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




//int[][] randnumList(int num){
//  int[][] temp = new int[4][num];
//  for(int j = 0; j< 4; j++){
//    println("first loop");
//    int odds = 0;
//    for(int i = 0; i< num; i++){
//      println("second loop");
//      boolean unique = false;
//      while(!unique){
//        int p = (int) random(12);
//        delay(500);
//        //println(p);
//         if(notcontains(temp[j],p)){
//           //println(p + "2");
//            //println("odd "+ odds);
//           if(p%2==0){
//             println("therep " + p + p%2);
//             if(temp[j].length - odds < num/2){
//               println("even "+ temp[j].length);
//               temp[j][i] = p;
//               unique = true;
//               } 
//             }else{
//               println(odds);
//               if(odds < (int)num/2){
//               temp[j][i] = p;
//               unique = true;
//               odds++; 
//             }
//           }

//         }
//       }

//      }
//    }
//    print("here");

//   return temp;

//}

//boolean notcontains(int [] temp, int t){
//  int s = t;
//  for(int i = 0; i < temp.length ; i++){
//    if(temp[i] == s){
//      return false;
//    }
//  }
//  return true;
//}
