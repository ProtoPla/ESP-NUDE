#include <cstdint>

#define GPIO_ENABLE_REG   *((volatile uint32_t*) 0x3FF44020)
#define GPIO_OUT_SET_REG  *((volatile uint32_t*) 0x3FF44008)
#define GPIO_OUT_CLR_REG  *((volatile uint32_t*) 0x3FF4400C)

#define LED_GPIO 2

void delay(volatile uint32_t t) {
    while (t--) {
        for (volatile int i = 0; i < 10000; i++);
    }
}

extern "C" __attribute__((section(".text.main")))
int main() {
    GPIO_ENABLE_REG |= (1 << LED_GPIO);

    while (true) {
        GPIO_OUT_SET_REG = (1 << LED_GPIO);
        delay(100);
        GPIO_OUT_CLR_REG = (1 << LED_GPIO);
        delay(100);
    }
}
