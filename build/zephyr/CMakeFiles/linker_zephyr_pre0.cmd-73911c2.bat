@echo off
cd /D C:\Users\Arvind\zephyrproject\zephyr\FW_Zephyr_IG_LTE\build\zephyr || (set FAIL_LINE=2& goto :ABORT)
C:\Users\Arvind\zephyr-sdk-0.16.5-1\xtensa-espressif_esp32_zephyr-elf\bin\xtensa-espressif_esp32_zephyr-elf-gcc.exe -x assembler-with-cpp -undef -MD -MF linker_zephyr_pre0.cmd.dep -MT linker_zephyr_pre0.cmd -D_LINKER -D_ASMLANGUAGE -imacros C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build/zephyr/include/generated/autoconf.h -IC:/Users/Arvind/zephyrproject/zephyr/include -IC:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build/zephyr/include/generated -IC:/Users/Arvind/zephyrproject/zephyr/soc/espressif -IC:/Users/Arvind/zephyrproject/zephyr/lib/libc/common/include -IC:/Users/Arvind/zephyrproject/zephyr/soc/espressif/common/include -IC:/Users/Arvind/zephyrproject/zephyr/soc/espressif/esp32/. -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/include/bt -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/include/crypto -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../esp_shared/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../esp_shared/include/wifi -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../esp_shared/components/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/hal/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/hal/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/hal/platform_port/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_hw_support/include/soc -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_hw_support/port/esp32 -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_hw_support/port/esp32/private_include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_hw_support/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_common/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_pm/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_rom/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_rom/include/esp32/rom -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_rom/esp32/ld -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/soc/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/xtensa/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/xtensa/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/soc/include/soc -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/soc/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/soc/src/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/driver/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/driver/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_phy/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_phy/include/esp32 -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_phy/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_wifi/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/efuse/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/efuse/private_include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/efuse/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/efuse/esp32/private_include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_system/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_system/port/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_system/port/public_compat -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_wifi/esp32/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_timer/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_timer/private_include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_netif/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/esp_event/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/log/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/esp_supplicant/src -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/esp_supplicant/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/include/esp_supplicant -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/port/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/src -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/src/crypto -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/src/utils -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/wpa_supplicant/src/eap_peer -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/spi_flash/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/spi_flash/include/spi_flash -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/spi_flash/private_include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/bootloader_support/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/bootloader_support/include_bootloader -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/heap/include -IC:/Users/Arvind/zephyrproject/modules/hal/espressif/zephyr/esp32/../../components/mbedtls/port/include -IC:/Users/Arvind/zephyrproject/zephyr/soc/espressif/esp32 -D__GCC_LINKER_CMD__ -DLINKER_ZEPHYR_PREBUILT -E C:/Users/Arvind/zephyrproject/zephyr/soc/espressif/esp32/default.ld -P -o linker_zephyr_pre0.cmd || (set FAIL_LINE=3& goto :ABORT)
"C:\Program Files\CMake\bin\cmake.exe" -E cmake_transform_depfile Ninja gccdepfile C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE C:/Users/Arvind/zephyrproject/zephyr C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build/zephyr C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build/zephyr/linker_zephyr_pre0.cmd.dep C:/Users/Arvind/zephyrproject/zephyr/FW_Zephyr_IG_LTE/build/CMakeFiles/d/0425bb16ae1e9ebd52781708592185c8658d63d462c10266b6a82c38aa9dec92.d || (set FAIL_LINE=4& goto :ABORT)
goto :EOF

:ABORT
set ERROR_CODE=%ERRORLEVEL%
echo Batch file failed at line %FAIL_LINE% with errorcode %ERRORLEVEL%
exit /b %ERROR_CODE%