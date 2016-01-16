---
Author: Balancer <balancer@balancer.ru>
Date: 2016-01-17 02:21:38.302683391 +0300
Keywords:
    - mysql
    - mariadb
    - innodb
    - оптимизация
    - администрирование
    - компьютеры
---

# Быстрый перезапуск MySQL

MySQL на тяжело загруженных машинах перезагружается иногда многими
минутами доводя время простоя сервисов до неприличных величин. Можно
значительно сократить период такого простоя.

Сперва в консольном mysql уменьшим до 0 долю «грязных» страниц:

```mysql
SET global innodb_max_dirty_pages_pct = 0;
```

После этого станем наблюдать (показатель обновляется каждые 10 секунд) за
долей таких «грязных» страниц в системе:

```bash
$ sudo mysqladmin ext -i10 | grep dirty
| Innodb_buffer_pool_bytes_dirty                | 110968832                   |
| Innodb_buffer_pool_pages_dirty                | 6773                        |
| Innodb_buffer_pool_bytes_dirty                | 106364928                   |
| Innodb_buffer_pool_pages_dirty                | 6492                        |
...
| Innodb_buffer_pool_bytes_dirty                | 7471104                     |
| Innodb_buffer_pool_pages_dirty                | 456                         |
| Innodb_buffer_pool_bytes_dirty                | 917504                      |
| Innodb_buffer_pool_pages_dirty                | 56                          |
| Innodb_buffer_pool_bytes_dirty                | 278528                      |
| Innodb_buffer_pool_pages_dirty                | 17                          |
| Innodb_buffer_pool_bytes_dirty                | 671744                      |
| Innodb_buffer_pool_pages_dirty                | 41                          |
| Innodb_buffer_pool_bytes_dirty                | 5210112                     |
| Innodb_buffer_pool_pages_dirty                | 318                         |
^C
```

Как только показатель станет близок к нулю и перестанет обновляться — перезапускаем mysql.

```bash
$ sudo service mysql restart
mysql stop/waiting
mysql start/running, process 19221
```

На этот раз перезапуск произойдёт не за минуты, а за секунды.
