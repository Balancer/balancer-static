# Быстрая установка Docker

## Ubuntu

В 14.10+ Docker уже в основном репозитории. Более ранние:

```bash
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo bash -c 'echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list'

sudo apt-get update && sudo apt-get install docker-engine
```