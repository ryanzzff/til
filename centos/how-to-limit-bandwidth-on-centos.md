# How to limit bandwidth on CentOS

## Installation

```bash
sudo yum install -y epel-release && sudo yum install -y wondershaper
```

## Limit the bandwidth

Syntax

```bash
sudo wondershaper <adapter> <max-download-speed> <max-upload-speed>
```

### Why?

Sometimes you may want to test your application's behavior if the network connection is not stable.

### Recommendation

If you connect the CentOS machine remotely, it is preferred to reset the bandwidth to normal after a timeout, otherwise, you may have a risk that you will never able to reconnect to the machine unless you're connecting to it physically.

The sample script to limit the download/upload bandwidth to 2000 Kbps for 30 seconds:

{% code title="test\_bw.sh" %}
```bash
#!/bin/sh
sudo wondershaper eth0 2000 2000
sleep 30
sudo wondershaper clear eth0
```
{% endcode %}





