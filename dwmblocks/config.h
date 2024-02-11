//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"",  "memory.sh",  1,  16}, 
  {"",  "volume.sh", 1,  10},
  {"",  "battery.sh", 5,  4},
  {"",  "clock.sh",  60, 1},
  {"",  "internet.sh", 5,  4},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
