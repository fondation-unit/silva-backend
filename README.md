Silva-Backend
===

## API documentation

**User endpoints :**

|Endpoint|Method|Parameters|Description|
|--------|------|----------|-----------|
|`/signup`|POST|`user[email]`, `user[password]`|User signup|
|`/login`|POST|`user[email]`, `user[password]`|User login|
|`/password`|POST|`user[email]`|Password recover request|
|`/password`|PATCH|`user[reset_password_token]`, `user[password]`, `user[password_confirmation]`|Password change request|
|`/current_user`|PATCH|Bearer token|Current user object|

## Deployment

- Ensure that Puma config is correct
- Ensure that the project folder has the required `shared/pids`, `shared/sockets`, `shared/tmp`, `shared/logs` folders
- Edit `config/initializers/cors.rb` to match the client domain name

## Nginx

### server.conf

```conf
upstream app {
  server unix:///...../silva-backend/shared/sockets/puma.sock fail_timeout=0;
}

server {
  server_name .....;
  root /...../silva-backend/public;
  try_files $uri/index.html $uri @app;

  location / {
    proxy_pass http://app;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-Proto https;
    proxy_redirect off;
    proxy_read_timeout 600;
    proxy_connect_timeout 600;
  }

  client_max_body_size 4G;
  keepalive_timeout 10;
}
```

### client.conf

```conf
server {
  server_name .....;

  location / {
    proxy_pass http://SERVER_ID:9000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}
```
