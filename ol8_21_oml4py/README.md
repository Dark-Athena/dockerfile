# Oracle Database on Docker

The following article provides a description of this Dockerfile.  

这个dockerfile 是我基于 oracle-base(Tim hook) 的[文件](https://github.com/oraclebase/dockerfiles/tree/master/database/ol8_21)修改的，加入了21c的新特性OML4PY的支持  
[Install OML4Py for On-Premises Databases](https://docs.oracle.com/en/database/oracle/machine-learning/oml4py/1/mlpug/install-oml4py-premises-databases.html)
oracle官方的这个文档有些地方说得不对，导致我在部署的时候出现了不少问题，后来我总算弄清楚了应该要怎么部署，  
为了方便更多的爱好者能试用oml4py，我特意制作了这个dockerfile，使用者可自行构建一个包含有支持oml4py的oracle21c数据库的oracle linux8的docker镜像   
只需要将项目下载到本地后，按照下方目录中，将software需要的文件放进去，  
然后在此目录执行下面这一条命令即可创建镜像   
```
docker build -t ol8_21_oml4py:latest .
```
创建容器的命令
```
docker run -dit --name ol8_21_con -p 1521:1521 -p 5500:5500  --shm-size="1G" ol8_21_oml4py:latest
```
或者同时挂载本地目录为数据文件及配置文件目录
```
docker run -dit --name ol8_21_con -p 1521:1521 -p 5500:5500  --shm-size="1G" -v F:\oracle21c4\:/u02 ol8_21_oml4py:latest
```

第一次启动会初始化数据库，需要等几分钟才能进入，可查看日志监控进度   
```
docker logs --follow ol8_21_con
```

sys用户的默认登录密码为 SysPassword1   

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
│   └── start.sh
└── software
    ├── apex_21.2_en.zip
    ├── LINUX.X64_213000_db_home.zip
    ├── Python-3.9.5.tgz
    └── put_software_here.txt

$
```

## 已知问题
打pyqatmlcfg.sql这个脚本时会报参数错误，但不影响ORACLE使用PYTHON函数，暂不清楚问题原因

## 有关此dockerfile原作者提供的其他信息

[Docker : Oracle Database on Docker](https://oracle-base.com/articles/linux/docker-oracle-database-on-docker)

If you are using an external host volume for persistent storage, the build expects it to owned by a group with the group ID of 1042. This is described here.

[Docker : Host File System Permissions for Container Persistent Host Volumes](https://oracle-base.com/articles/linux/docker-host-file-system-permissions-for-container-persistent-host-volumes)
