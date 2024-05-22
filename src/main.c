// #include <zephyr.h>
// #include <sys/printk.h>
#include <stdio.h>


#include "main.h"

#include "mqtt_IG/mqtt_IG.h"
#include "modbus_IG/modbus_IG.h"
#include "modem_IG/modem_IG.h"

int main(void)
{	
	modem_ig();

	modbus_ig();

	mqtt_ig();	
	
	return 0;
}
