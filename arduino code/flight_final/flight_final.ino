double  goal=.2;


// analoge reade code
const int alpha_pin = A0; 
const int q_pin = A1; 
const int theta_pin = A2; 

const int outPin = 9;
double de_out;

double alpha;
double q;
double theta;

double ralpha;
double rq;
double rtheta;

double w;
double rw;
double u=237.1;
double de;
double dg2ra =  0.0175;
void setup ( )
{
pinMode(outPin, OUTPUT); 
}
// analoge reade code

void loop() {

// analoge reade code
alpha = analogRead(alpha_pin); 
alpha = map(alpha, 0, 1024, -59.275, 59.275); 
alpha = constrain(alpha,-30,30);
  delay(1);

q = analogRead(q_pin); 
q = map(q, 0, 1024, -50, 50); 
q= constrain(q,-50,50);
 delay(1);
 
theta = analogRead(theta_pin); 
theta  = map(theta , 0, 1024, -90, 90); 
theta = constrain(theta ,-90,90);

ralpha=dg2ra*alpha;
rq=dg2ra*q;
rtheta=dg2ra*theta;


//analogWrite(ledPin, lightLevel); 
// analoge reade code


//////calculation///////////
w= ralpha * u;
//de=goal*(-7.0711)-(0.0039)*w-(-2.8421)*rq-(-7.0711)*rtheta ;
de=goal*(-7.0711)-( 0.0033 )*w-( -0.8601 )*rq-(-7.0711)*rtheta ;

de=(1/dg2ra)*de;
if (de >30)
{
de =30;
}

if (de <-30)
{
de = -30;
}

de_out = (de+30)/60*255;
analogWrite(outPin, de_out); 


 
  
}

