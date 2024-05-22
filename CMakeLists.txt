cmake_minimum_required(VERSION 3.22)
set(BOARD esp32_devkitc_wrover/esp32/procpu)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(FW_Zephyr_IG_LTE)

# Include directories
# zephyr_include_directories(mqtt)
# zephyr_include_directories(modbus)
# zephyr_include_directories(modem)

target_sources(app PRIVATE src/main.c)
target_sources(app PRIVATE src/mqtt_IG/mqtt_IG.c)
target_sources(app PRIVATE src/modbus_IG/modbus_IG.c)
target_sources(app PRIVATE src/modem_IG/modem_IG.c)