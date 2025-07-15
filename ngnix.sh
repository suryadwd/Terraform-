  
    sudo pacman -Syu --noconfirm
    sudo pacman -S nginx --noconfirm
    sudo systemctl enable --now nginx
    echo "<h1> Learning terraform  </h1>"  > /var/www/html/index.html
    # echo "<h1> Learning terraform  </h1>"  | sudo tee /var/www/html/index.html   # tee -> is use to append the in the given lovation