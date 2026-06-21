#pragma once

#define MANUFACTURER "Nathan LC"
#define PRODUCT "daedapad"

#define ENCODER_ENABLE = yes
#define ENCODER_MAP_ENABLE = yes

#define OLED_ENABLE = yes
#define OLED_DRIVER = ssd1306
#define OLED_DISPLAY_128X32
#define OLED_TIMEOUT 0
#define OLED_FONT_H "keyboards/daedapad/lib/glcdfont.c"
#define OLED_FONT_WIDTH 5
#define OLED_FONT_HEIGHT 8
#define OLED_brightness 255
#define I2C_DRIVER I2CD1
#define I2C1_SDA_PIN GP12
#define I2C1_SCL_PIN GP13
#define I2C1_CLOCK_SPEED 40000