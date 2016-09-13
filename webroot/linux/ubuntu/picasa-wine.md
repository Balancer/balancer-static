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

```bash
sudo wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks
```

### 4. Скачиваем cab, который побит в winetricks:

```bash
mkdir -p ~/.cache/winetricks/ie8
wget "https://github.com/Winetricks/winetricks/raw/master/files/winetest.cat" -O ~/.cache/winetricks/ie8/winetest.cat
```

### 5. Устанавливаем ie8 32 бит

```bash
env WINEARCH=win32 WINEPREFIX=~/.wine32 winetricks ie8
```

### 6. Устанавливаем Picasa

```bash
env WINEARCH=win32 WINEPREFIX=~/.wine32 wine picasa39-setup.exe
```

(скачать: http://gateway.ipfs.io/ipfs/QmX27TEgZFqrT1zfo7YhPMhN7q3feGwdmuPLUDpzrz4pZe )
