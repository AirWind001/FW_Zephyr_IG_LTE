#include "mqtt_IG.h"
#include "../main.h"

LOG_MODULE_REGISTER(mqtt_publisher, LOG_LEVEL_DBG);

#define MQTT_BROKER_ADDR "broker.hivemq.com"
#define MQTT_BROKER_PORT 1883

#define MQTT_CLIENTID "zephyr_publisher"
#define MQTT_TOPIC "zephyr/test"

static struct mqtt_client client;
static struct sockaddr_storage broker;
static uint8_t rx_buffer[128];
static uint8_t tx_buffer[128];
static uint8_t payload[] = "Hello from Zephyr";

static void mqtt_evt_handler(struct mqtt_client *const c, const struct mqtt_evt *evt)
{
    switch (evt->type) {
    case MQTT_EVT_CONNACK:
        LOG_INF("MQTT client connected");
        break;
    case MQTT_EVT_DISCONNECT:
        LOG_INF("MQTT client disconnected");
        break;
    case MQTT_EVT_PUBACK:
        LOG_INF("Publishing complete");
        break;
    default:
        LOG_INF("MQTT event: %d", evt->type);
        break;
    }
}

static int init_mqtt(void)
{
    int rc;
    struct mqtt_sec_config *tls_config = NULL;
    struct mqtt_utf8 client_id = {
        .utf8 = (uint8_t *)MQTT_CLIENTID,
        .size = strlen(MQTT_CLIENTID)
    };

    mqtt_client_init(&client);

    broker.ss_family = AF_INET;
    net_sin(&broker)->sin_port = htons(MQTT_BROKER_PORT);
    net_addr_pton(AF_INET, MQTT_BROKER_ADDR, &net_sin(&broker)->sin_addr);

    client.broker = &broker;
    client.evt_cb = mqtt_evt_handler;
    client.client_id = client_id;
    client.user_name = NULL;
    client.password = NULL;
    client.protocol_version = MQTT_VERSION_3_1_1;
    client.rx_buf = rx_buffer;
    client.rx_buf_size = sizeof(rx_buffer);
    client.tx_buf = tx_buffer;
    client.tx_buf_size = sizeof(tx_buffer);
    client.transport.type = MQTT_TRANSPORT_NON_SECURE;

    rc = mqtt_connect(&client);
    if (rc != 0) {
        LOG_ERR("mqtt_connect: %d", rc);
        return rc;
    }

    return 0;
}

static void mqtt_publish_ig(void)
{
    struct mqtt_publish_param param;
    param.message.topic.qos = MQTT_QOS_0_AT_MOST_ONCE;
    param.message.topic.topic.utf8 = (uint8_t *)MQTT_TOPIC;
    param.message.topic.topic.size = strlen(MQTT_TOPIC);
    param.message.payload.data = payload;
    param.message.payload.len = strlen(payload);
    param.message_id = sys_rand32_get();
    param.dup_flag = 0;
    param.retain_flag = 0;

    mqtt_publish(&client, &param);
}

void mqtt_ig(void)
{
	int rc = init_mqtt();
    if (rc != 0) {
        LOG_ERR("MQTT initialization failed");
        return;
    }
    mqtt_publish_ig();

    while (1) {
        mqtt_input(&client);
        mqtt_live(&client);
        k_sleep(K_MSEC(100));
    }
}
