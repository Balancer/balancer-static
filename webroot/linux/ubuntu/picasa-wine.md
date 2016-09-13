# Установка Google Picasa под Wine на 64-разрядной Ubuntu

### 1. Установка Wine

```bash
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install --install-recommends winehq-devel
```

### 2. Установка winetricks

```bash
sudo apt install winetricks
```

### 3. Обновление winetricks до последней версии

Иначе не поставится ie8

```
sudo wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/

```bash
mkdir -p ~/.cache/winetricks/ie8
wget "https://github.com/Winetricks/winetricks/raw/master/files/winetest.cat" -O ~/.cache/winetricks/ie8/winetest.cat
```

### 4. Устанавливаем ie8 32 бит

```bash
env WINEARCH=win32 WINEPREFIX=~/.google/picasa/3.0/ winetricks ie8
```