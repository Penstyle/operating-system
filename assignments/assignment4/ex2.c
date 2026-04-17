#include <stdio.h>
#include <stdint.h>

#define PAGE_SIZE 4096
#define OFFSET_MASK 0x0FFF // Masks the lower 12 bits
#define SHIFT_AMOUNT 12    // To shift down to the upper 4 bits

// Mock Page Table: Maps Virtual Page Number (index) to Physical Frame Number (value)
// A value of -1 means a Page Fault.
int page_table[16] = {5, 2, 8, -1, 12, 1, 9, 3, -1, 7, 4, 6, 10, 15, 11, 14};

// TODO: Implement this function
uint32_t translate_address(uint16_t virtual_address) {
    // 1. Extract the virtual page number using bitwise shifting (SHIFT_AMOUNT).
    // 2. Extract the offset using bitwise AND (&) with the OFFSET_MASK.
    // 3. Look up the physical frame in the page_table.
    // 4. If the frame is -1, print "Page Fault!" and return 0.
    // 5. Combine the physical frame and the offset to create the physical address.
    
    uint16_t page_num = virtual_address >> SHIFT_AMOUNT;   // Upper 4 bits
    uint16_t offset   = virtual_address & OFFSET_MASK;     // Lower 12 bits
    
    int frame = page_table[page_num];
    
    if (frame == -1) {
        printf("Page Fault!\n");
        return 0;
    }
    
    // Physical address = (frame << 12) | offset
    uint32_t physical_address = ((uint32_t)frame << SHIFT_AMOUNT) | offset;
    return physical_address;
}

int main() {
    uint16_t va1 = 0x1A2B; // Page 1, Offset 0xA2B
    uint16_t va2 = 0x3004; // Page 3, Offset 0x004 (Should fault)

    printf("VA: 0x%04X -> PA: 0x%05X\n", va1, translate_address(va1));
    printf("VA: 0x%04X -> PA: 0x%05X\n", va2, translate_address(va2));

    return 0;
}
