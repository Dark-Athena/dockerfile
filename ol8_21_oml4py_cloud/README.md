
在
https://github.com/Dark-Athena/dockerfile/tree/main/ol8_21_oml4py
的基础上增加了dbms_cloud的预装，已配置好wallet（ORACLE/AMAZON/MICROSOFT/JD/TENCENT）
最终未压缩的镜像大小为9.55GB

## software下载地址
   - Oracle Database
       https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html
   - Oracle Application Express (APEX)
       https://www.oracle.com/technetwork/developer-tools/apex/downloads/index.html
   - Python 3.9.5
       https://www.python.org/downloads/release/python-395/

## 目录结构
```
$ tree
.
├── Dockerfile
├── README.md
├── scripts
│   ├── healthcheck.sh
│   ├── install_oml4py_server.sh
│   ├── install_os_packages.sh
│   ├── dbms_cloud_install.sql
│   ├── dbc_aces.sql
│   └── start.sh
├── wallet
│   ├── cwallet.sso
│   └── ewallet.p12
└── software
    ├── apex_21.2_en.zip
    ├── LINUX.X64_213000_db_home.zip
    ├── Python-3.9.5.tgz
    └── put_software_here.txt

$
```
构建及运行命令参考
```
docker build -t ol8_21_cloud:2.1 .

docker run -dit --name ol8_21_cloud_con -p 1521:1521 -p 5501:5500 --shm-size="1G" ol8_21_cloud:2.1

