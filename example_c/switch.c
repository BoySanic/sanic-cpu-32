extern void do_action(int code);

void computed_goto_jump_table(int state) {
    // Array of label addresses (the jump table)
    static const void *jump_table[] = {
        &&case_0, &&case_1, &&case_2, &&case_3, 
        &&case_4, &&case_5, &&case_6, &&case_7
    };

    // Bounds check to avoid jumping into the void
    if (state < 0 || state > 7) {
        do_action(-1);
        return;
    }

    // Dereference the table and jump
    goto *jump_table[state];

case_0: do_action(100); return;
case_1: do_action(101); return;
case_2: do_action(102); return;
case_3: do_action(103); return;
case_4: do_action(104); return;
case_5: do_action(105); return;
case_6: do_action(106); return;
case_7: do_action(107); return;
}
