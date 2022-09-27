server {
    listen       80;
    server_name  {{APP_DOMAIN}};
    charset utf-8;
    index index.php index.html;
    root /apps/modstartcms/public;
    autoindex off;

    add_header Access-Control-Allow-Origin '*';
    add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
    add_header Access-Control-Allow-Headers '*';

    location ^~ /.git {
        deny all;
    }

    location / {
        if ($request_method = 'OPTIONS') {
            return 200;
        }
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ \.(gif|jpg|jpeg|png|bmp|ico|css|js)$ {
       expires max;
    }

    location ~* \.(eot|ttf|woff|woff2)$ {
        add_header Access-Control-Allow-Origin '*';
    }
}