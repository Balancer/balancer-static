# Индикаторы

### Is an Internet connectivity indicator applet available for the Unity panel?

http://askubuntu.com/questions/100306/is-an-internet-connectivity-indicator-applet-available-for-the-unity-panel

```bash
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor
```

```bash
#!/bin/bash

if ping -c 1 -W 2 google.com > /dev/null; then
	echo "Up"
else
	echo "Down"
fi
```

```bash
indicator-sysmonitor &
```