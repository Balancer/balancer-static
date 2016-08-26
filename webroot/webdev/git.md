# Git

## Перенос каталога из одного репозитория в другой

http://zzamboni.org/new/blog/moving-files-between-git-repositories-preserving-history/

```(directory1 is the one you want to preserve)```

```bash
git clone git-repository-A-url repo-A-tmp-dir
cd repo-A-tmp
git remote rm origin   # for safety
git filter-branch --tree-filter 'rm -rf $(git ls-files | egrep -v directory1)' -- --all
```
