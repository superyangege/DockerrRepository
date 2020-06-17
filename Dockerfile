From docker.io/centos:centos7

LABEL maintainer="1020985033@qq.com"

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm 
RUN	yum -y install php72w php72w-cli php72w-common php72w-devel php72w-embedded php72w-fpm php72w-gd php72w-mbstring php72w-mysqlnd php72w-opcache php72w-pdo php72w-xml

RUN yum -y install wget
RUN yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel
WORKDIR /usr/local

COPY ./nginx-1.16.1.tar.gz ./
COPY ./start.sh ./
RUN tar -zxvf nginx-1.16.1.tar.gz
RUN cd nginx-1.16.1;./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre
RUN cd nginx-1.16.1;make && make install
COPY ./nginx.conf nginx/conf/
COPY ./test.php nginx/html/

EXPOSE 80
EXPOSE 3306

ENTRYPOINT ["bash", "./start.sh"]
