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

### 5. Устанавливаем ie7 32 бит

```bash
env WINEARCH=win32 WINEPREFIX=~/.wine32 winetricks ie7
```

### 6. Запускаем IE и логинимся в Gmail:

```bash
env WINEARCH=win32 WINEPREFIX=~/.wine32 wine 'C:\Program Files\Internet Explorer\iexplore'
```

Тут тонкость. Логин в Picasa сам по себе не работает. Нужно, чтобы куки
прописались из IE. Он тоже не залогинится и зависнет после ввода пароля,
но нужные куки окажутся прописаны. Главное — некоторое время подождать.
Сколько точно — не ясно. Для надёжности — около минуты.

### 7. Устанавливаем Picasa

```bash
env WINEARCH=win32 WINEPREFIX=~/.wine32 wine picasa39-setup.exe
```

(скачать: http://gateway.ipfs.io/ipfs/QmX27TEgZFqrT1zfo7YhPMhN7q3feGwdmuPLUDpzrz4pZe )

### 8. Запускаем Picasa и логинимся в Gmail

Тут такая же проблема, как в пункте 6. Придётся сколько-то подождать.
Потом закрыть подвисшее окно и запустить логин снова. Когда повезёт,
появится диалог выбора аккаунта или плюс-страницы. Можно его выбрать и
авторизация благополучно завершится.
