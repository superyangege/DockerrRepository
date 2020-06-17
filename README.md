# DockerrRepository
存放Docker相关文档，项目

## 启动
```
docker image build -t 20200618_nginx_php ./
docker container run -p 8080:80 -itd 20200618_nginx_php
```

## 访问
访问机器 ip:8080/test.php，即可访问到测试的php页面，如果需要编写其他php文件，可以进入容器内/usr/local/nginx/html/ 内调试
