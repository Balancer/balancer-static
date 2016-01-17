---
Author: Balancer <balancer@balancer.ru>
Keywords:
    - mysql
    - charset
    - latin1
    - utf8
    - fix
    - admin
    - администрирование
---

# Исправление записи utf8 как latin1 в MySQL

Есть распространённая ошибка, когда в MySQL дефолтовый с latin1 пишут 
utf8. После исправления или при выставлении нормального чарсета русский 
превращается в тыкву типа «Ð”ÐµÐ»Ð¾Ð²Ð°Ñ� Ð�Ð²Ð¸Ð°Ñ†Ð¸Ñ�».

Такое преобразование исправляет ошибку средствами самого mysql без 
всяких дампов/загрузок: 

```mysql
CONVERT(CAST(CONVERT(field USING latin1) AS BINARY) USING utf8)
```

Т.е. что-то типа:

```mysql
UPDATE ox_campaigns SET campaignname = CONVERT(CAST(CONVERT(campaignname USING latin1) AS BINARY) USING utf8) WHERE campaignname LIKE '%Ð%';
```

Последний LIKE — чтобы не перекодировались строки, куда уже после 
исправления кодировки соединения корректный русский запишется.

## Также кросспост в:

* http://juick.com/Balancer/2817886
