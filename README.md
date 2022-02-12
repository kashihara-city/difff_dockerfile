# 説明

[meso-cacase/difff](https://github.com/meso-cacase/difff)の、保存・公開機能がついているマスターブランチ（現在 ver6.1）をhttpdで動作させるための dockerfile です。

### 比較結果の保存先にDocker Volumeを使う場合の使用例
```shell
$ cd ~
$ wget https://raw.githubusercontent.com/kashihara-city/difff_dockerfile/main/Dockerfile
$ docker build -t difff ./
$ docker run --name difff -d -v difffdata:/usr/local/apache2/htdocs/data -p 80:80 difff
```
