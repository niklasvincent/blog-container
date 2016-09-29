# blog-container
Docker container for serving niklaslindblad.se

## Install systemd service

    cp docker-blog.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl start docker-blog.service
