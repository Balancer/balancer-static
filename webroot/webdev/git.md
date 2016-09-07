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

Merge files into the new repository

```bash
git clone git-repository-B-url
cd git-repository-B-dir
git remote add repo-A-branch repo-A-tmp-dir
git pull repo-A-branch master
git remote rm repo-A-branch
```

## Конвертация Mercurial в Git

http://stackoverflow.com/questions/16037787/convert-mercurial-project-to-git

```bash
cd ~
git clone git://repo.or.cz/fast-export.git
git init git_repo
cd git_repo
~/fast-export/hg-fast-export.sh -r /path/to/old/mercurial_repo
git checkout HEAD
```
