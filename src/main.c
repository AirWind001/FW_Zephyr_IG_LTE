// #include <zephyr.h>
// #include <sys/printk.h>
#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/drivers/uart.h>

#include <stdio.h>
#include <string.h>
/* Define the UART device name */
#define UART_IDENTIFIER DT_ALIAS(uart_0)

/* Define the UART buffer size */
#define UART_BUF_SIZE 128

/* Define the maximum number of retries */
#define MAX_RETRIES 10

/* Define the timeout in milliseconds for each response */
#define RESPONSE_TIMEOUT_MS 2000

/* Function to send an AT command and wait for a response */
static int send_at_command(const struct device *uart_dev, const char *command, const char *expected_response)
{
    uint8_t rx_buf[UART_BUF_SIZE] = {0};
    int bytes_read;
    int ret = 0;

    for (int attempt = 0; attempt < MAX_RETRIES; attempt++) {
        /* Send the AT command */
        for (int i = 0; i < strlen(command); i++) {
            uart_poll_out(uart_dev, command[i]);
        }

        /* Initialize the index for storing the response */
        int idx = 0;

        /* Wait for the response with a timeout */
        int64_t end_time = k_uptime_get() + RESPONSE_TIMEOUT_MS;
        while (k_uptime_get() < end_time) {
            uint8_t c;
            bytes_read = uart_poll_in(uart_dev, &c);
            if (bytes_read == 0) {  // 0 means a byte was read
                rx_buf[idx++] = c;
                if (idx >= UART_BUF_SIZE) {
                    idx = UART_BUF_SIZE - 1;
                }
                /* Null-terminate the received string */
                rx_buf[idx] = '\0';
                /* Check if the expected response is received */
                if (strstr(rx_buf, expected_response) != NULL) {
                    return 0;
                }
            } else {
                /* Sleep for a short period to yield CPU */
                k_sleep(K_MSEC(100));
            }
        }

        /* Print debug information */
        printk("Attempt %d: No response or unexpected response: %s\n", attempt + 1, rx_buf);
    }

    /* If we exit the loop, an error occurred */
    printk("I give up\n");
    return -1;
}

int main(void)
{
    const struct device *uart_dev;
    int ret;

    /* Get the UART device */
    uart_dev = DEVICE_DT_GET(UART_IDENTIFIER);
    if (!uart_dev) {
        printk("Failed to get UART device\n");
        return 1;
    }

    printk("LTE Modem AT Command Test\n");

    /* Initialize modem - send AT command */
    ret = send_at_command(uart_dev, "AT\r\n", "OK\r\n");
    if (ret != 0) {
        printk("Failed to initialize modem\n");
        return 1;
    }

    /* Connect to the internet - send AT command */
    ret = send_at_command(uart_dev, "AT+CGATT=1\r\n", "OK\r\n");
    if (ret != 0) {
        printk("Failed to connect to the internet\n");
        return 1;
    }

    printk("Connected to the internet\n");

    /* Your code to perform further actions with the internet connection */

    return 0; // Return 0 to indicate successful execution
}
