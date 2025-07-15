  
    sudo apt update -y
    sudo apt install nginx -y
    sudo systemctl enable nginx
    sudo systemctl start nginx
    echo "<h1> Learning terraform  </h1>"  > /var/www/html/index.html
    # echo "<h1> Learning terraform  </h1>"  | sudo tee /var/www/html/index.html   # tee -> is use to append the in the given lovationclear
    #updated 