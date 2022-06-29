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

## Run as Cron job

To have this script automatically run after bootup, configure it to run as a cron job.

On Linux, use the command:

`crontab -e`

Then in the editor, add to the last line:

`@reboot /bin/bash -e <path_to_rapt-mqtt-bridge>/rapt-mqtt-cron.sh`

Then edit `rapt-mqtt-cron.sh` in this repo and choose the arguments
that you desire. The reason to run under a specific user instead of
root is because several environment variables must be setup. It may be
better to set them up under a user besides root but it is up to
you. Be sure to put them in your $HOME/.profile file since some
$HOME/.bashrc files do not execute if not an interactive shell.
