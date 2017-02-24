# Работа со временем

```bash
# Show the full last modified epoch time including nanoseconds of /etc/passwd (GNU version)
date -d "$(stat -c %y /etc/passwd)" +%s.%N
```
