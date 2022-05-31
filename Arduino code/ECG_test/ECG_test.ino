#define LEDPIN 9
#define ECGPIN A0

#define interval 1000


unsigned long CurrentMicros = 0;
unsigned long PreviousMicros = 0;

unsigned ECGVal;

void setup()
{
  // Setup pins
  pinMode(ECGPIN,INPUT);
  pinMode(LEDPIN,OUTPUT);

  // Initialize pins
  digitalWrite(LEDPIN,LOW);

  // Initialize Serial communication
  Serial.begin(115200);
}

void loop()
{

  CurrentMicros = micros();

  if( CurrentMicros - PreviousMicros >= interval )
  {
    PreviousMicros = CurrentMicros;

    ECGVal = analogRead(ECGPIN);
    char c1 = (ECGVal>>8);
    char c2 = ECGVal % 256;
    Serial.print(c2);
    Serial.print(c1);

    analogWrite(LEDPIN, ECGVal/4);
  }  
}