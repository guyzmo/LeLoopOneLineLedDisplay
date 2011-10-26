/* Le Loop Dumped LedMatrix code controller
 * this code is adapted to a 1987 led matrix display based on 4094 8bit shifters and darlington arrays
 * 
 */

// 76x8

#define OE 2   // GRAY OUTPUT ENABLE
#define DATA 4 // PINK DATA
#define STR 6  // ORANGE STROBE
#define CLK 8  // YELLOW CLOCK

#define DELAY 0

class LeLoopMatrix {
    private:
        int matrix[8][72];

        void tick_clock() {
          digitalWrite(CLK,LOW);
          delay(DELAY);
          digitalWrite(CLK,HIGH);
          delay(DELAY);
        }

    public:
        void setup() {
            pinMode(STR, OUTPUT); // ORANGE (STROBE)
            pinMode(CLK, OUTPUT); // YELLOW (CLK)
            pinMode(OE, OUTPUT);  // GRAY (OUTPUT ENABLE)
            pinMode(DATA, OUTPUT); // PINK (DATA)
	    // default values
            digitalWrite(2, HIGH);
            digitalWrite(4, LOW);
            digitalWrite(6, HIGH);
            digitalWrite(8, HIGH);
	    // reset buffer
            reset_matrix();
        }

        void reset_matrix() {
            for (int i=0;i<8;++i)
                for (int j=0;j<72;++j)
                    matrix[i][j] = 0;
        }

        void set_pixel(int i, int j, int val) {
            matrix[i][j] = val;
        }

        void display() {
          for (int i=71;i!=0;--i) {
              for (int j=0;j<8;++j) {
                if (matrix[j][i]!=0) { 
                    Serial.print("#");
                    digitalWrite(DATA,HIGH);
                    tick_clock();
                } else {
                    Serial.print("_");
                    digitalWrite(DATA,LOW);
                    tick_clock();
                }
              }
              Serial.println(" ");
          }
        }
} leloop_matrix;

void setup () {  
    Serial.begin(19200);
    leloop_matrix.setup();
    leloop_matrix.display();
}

void loop () {
}
