#please run "git clone https://github.com/Forward489/thesis-cloud.git && cd thesis-cloud && sh startup-kit-cloud9.sh"

touch /var/www/html/tes.php
echo "<?php \n\tphpinfo(); \n?>" >> /var/www/html/tes.php
sudo chown ubuntu:ubuntu /var/www/html
sudo ln -s /var/www/html/ ~/environment/public-html
cd ..
sudo rm -r thesis-cloud