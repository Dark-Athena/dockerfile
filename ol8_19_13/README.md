# 预装dbms_cloud的oracle 19.13的docker构建脚本

基于Tim Hall的docker构建脚本修改而来   
- 增加19.13版本打补丁（请自行下载补丁包,未下载补丁包则为默认的19.3版本，无法安装dbms_cloud） 
- 预装dbms_cloud包，并已配置好wallet及acl/ace(ORACLECLOUD/AWS/AZURE/京东云OSS/腾讯云COS) 
- 修改初始镜像为oraclelinux:8  
- 修改为多阶段构建，最终未压缩的docker镜像大小为10.28GB  

# 该版本目录结构为   

```
$ tree
.
├── Dockerfile
├── README.md
├── scripts
│   ├── healthcheck.sh
│   ├── oracle_software_patch.sh
│   ├── dbc_aces.sql
│   ├── dbms_cloud_install.sql
│   ├── install_os_packages.sh
│   └── start.sh
└── software
    ├── apex_21.2_en.zip
    ├── LINUX.X64_193000_db_home.zip
    ├── p6880880_190000_Linux-x86-64.zip
    ├── p33192694_190000_Linux-x86-64.zip
    ├── p33192793_190000_Linux-x86-64.zip
    └── put_software_here.txt

$
```

# 构建及运行命令参考
```
docker build -t ol8_19_13:latest .

docker run -dit --name ol8_19_13_con -p 1521:1521 -p 5500:5500 --shm-size="1G" ol8_19_13:latest
```
# 注意事项，容器第一次启动后，数据库会开始创建，需要不少时间，可查看日志跟踪进度
```
docker logs --follow ol8_19_13_con
```

----------
以下是原作者提供的其他信息   
# Oracle Database on Docker

The following article provides a description of this Dockerfile.

[Docker : Oracle Database on Docker](https://oracle-base.com/articles/linux/docker-oracle-database-on-docker)

Directory contents when software is included.

```
$ tree
.
├── Dockerfile
├── README.md
├── scripts
│   ├── healthcheck.sh
│   └── start.sh
└── software
    ├── apex_21.2_en.zip
    ├── LINUX.X64_193000_db_home.zip
    └── put_software_here.txt

$
```

If you are using an external host volume for persistent storage, the build expects it to owned by a group with the group ID of 1042. This is described here.

[Docker : Host File System Permissions for Container Persistent Host Volumes](https://oracle-base.com/articles/linux/docker-host-file-system-permissions-for-container-persistent-host-volumes)
