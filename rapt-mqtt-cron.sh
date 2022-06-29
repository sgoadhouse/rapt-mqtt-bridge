# Give system time to boot up
sleep 60
# Get environment variables needed by rapt-mqtt.py
source $HOME/.profile
# Run the Python script with desired options
python3 $(dirname "$0")/rapt-mqtt.py -n 15 -f -s &
