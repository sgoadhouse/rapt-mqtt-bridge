# rapt-mqtt-bridge
Python script which accesses RAPT IoT RESTful API to read data from RAPT Pills and publish recent updates on MQTT

## RAPT Pill

An inexpensive, battery powered, WiFi liquid density meter used for
brewing beer and other fermentation liquids. It is very similar to the
[iSpindle](https://www.ispindel.de/docs/README_en.html) but refined by
[KegLand in Australia](https://www.kegland.com.au). For more
information, see [Yellow RAPT Pill - Hydrometer & Thermometer](https://www.kegland.com.au/rapt-pill-hydrometer-thermometer-wifi-bluetooth.html).

To order one from outside of Australia, see the
[RAPT Pill on Kegland's Aliexpress store](https://www.aliexpress.com/item/3256803788846616.html)

Once configuraed properly, the RAPT Pill will send its data to its
[IoT data collector](https://app.rapt.io). This script uses the
RESTful API for this data collector to then fetch the data, parse it
and then publish as a MQTT message.

Kegland makes other RAPT devices that send their data to
https://app.rapt.io. This script currently only supports the RAPT
Pill. However, this repo can be forked and easily expanded to gather
data from other RAPT sources using this code as an example.

## MQTT

[MQTT](https://en.wikipedia.org/wiki/MQTT) is one of many IoT sensor
transport protocols. It is a convenient way to send sensor data from
various sensors in your local network to home automation systems like
[Home Assistant](https://www.home-assistant.io) or to an
[InFlux Database](https://www.influxdata.com) and then use
[Grafana](https://grafana.com) to graph. In fact Home Assistant can be
easily configured to subscribe to the MQTT data, act on it, if need
be, and then pass on to an InfluxDB that can be accessed from Grafana.