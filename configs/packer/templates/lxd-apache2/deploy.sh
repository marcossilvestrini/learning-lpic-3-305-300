#! /bin/bash

systemctl enable apache2
systemctl restart apache2
echo "Imagem Construida via Packer" > /PACKER-IMAGE
