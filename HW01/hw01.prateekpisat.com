server {
        listen 80;
        listen [::]:80;

        root /home/user1/www/hw01.prateekpisat.com;

        index index.html index.htm index.nginx-debian.html;

        server_name hw01.prateekpisat.com www.hw01.prateekpisat.com;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
