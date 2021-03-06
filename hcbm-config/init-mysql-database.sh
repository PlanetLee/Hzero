#!/usr/bin/env bash
mkdir -p target
if [ ! -f target/choerodon-tool-liquibase.jar ]
then
    curl https://nexus.choerodon.com.cn/repository/choerodon-release/io/choerodon/choerodon-tool-liquibase/0.9.2.RELEASE/choerodon-tool-liquibase-0.9.2.RELEASE.jar -o target/choerodon-tool-liquibase.jar
fi

java -Dspring.datasource.url="jdbc:mysql://localhost:3306/hzero_config?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	 -Dspring.datasource.username=root \
	 -Dspring.datasource.password=zxcv1230 \
	 -Ddata.drop=false \
	 -Ddata.init=init \
	 -Ddata.dir=src/main/resources \
	 -jar target/choerodon-tool-liquibase.jar
