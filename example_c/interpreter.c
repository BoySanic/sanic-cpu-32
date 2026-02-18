const TTY_ADDR = 0x400001;
const KB_ADDR = 0x400002;

void sc32_putc(char c) {
  *(volatile int*) TTY_ADDR = c;
}

char* scanf(char* prompt) {
  printf(prompt);
  char input_char = '';
  char* built_string = "";
  while(input_char != '\n') {
    input_char = (char)*(volatile int*)KB_ADDR;
    if(input_char == 0 || input_char == '\n') continue;
    char* new_string = malloc(sizeof(built_string)+sizeof(char));
    *new_string = built_string;
    int new_char_index = (sizeof(new_string)/sizeof(char))-1;
    new_string[new_char_index] = input_char;
    free(built_string);
    built_string = new_string;
  }
  return built_string;
}
void printf(char* buff) {
  for(int i = 0; i < sizeof(buff * (char*)) - 1; i++) {
      sc32_putc(buff[i]);
  }
}
int ascii_to_binary(char* buff) {
  int result = 0;
  int string_size = sizeof(buff)/sizeof(char);
  for(int i = 0; i < string_size; i++) {
    result *= 10;
    result += (buff[i] - 48);
  }
  return result;
}
char* binary_to_ascii(int value) {
  char* 
}
int main(){
    while(true) {
        char* input = scanf("> ");
        if(input == "add") {
          char* number_one = scanf("Enter first number: ");
          int first_num = ascii_to_binary(number_one);
          char* number_two = scanf("Enter second number: ");
          int second_num = ascii_to_binary(number_two);
          int binary_answer = first_num + second_num;
          
        }
        else if(input == "sub") {

        }
        else if(input == "mul") {

        }
        else if(input == "div") {
  
        }
    }
}
