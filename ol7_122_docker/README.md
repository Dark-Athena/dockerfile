基于 https://github.com/oraclebase/dockerfiles/tree/master/database/ol7_122 修改了部分构建脚本  
1. 将原始镜像从slim版改成正常版（slim版os指令严重缺失）
2. 修改为多阶段构建，以节省大小

（我还没测试，数据库安装包正在龟速下载中...）

以下是原作者提供的信息：   

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
│   ├── healthcheck.sh
│   └── start.sh
└── software
    ├── apex_21.2_en.zip
    ├── linuxx64_12201_database.zip
    └── put_software_here.txt

$
```

If you are using an external host volume for persistent storage, the build expects it to owned by a group with the group ID of 1042. This is described here.

[Docker : Host File System Permissions for Container Persistent Host Volumes](https://oracle-base.com/articles/linux/docker-host-file-system-permissions-for-container-persistent-host-volumes)
