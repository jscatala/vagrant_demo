# Configuración por defecto

_L.-_: Comando ejecutado en la máquina física
_R.-_: Comando ejecutado en la máquina virtual

##Procedimiento a ejecutar




```
L.- mkdir simple
L.- cd simple
L.- vagrant init XenialXerus64
L.- ls
README.md    Vagrantfile
L.- echo "<strong> Hello meetup</strong>" > index.html
L.- vagrant status
Current machine states:

default                   not created (virtualbox)
[...]
L.- vagrant up
L.- vagrant status
Current machine states:

default                   running (virtualbox)
[...]
L.- vagrant ssh

R.- sudo apt-get update 
R.- sudo apt-get install -y apache2
R.- sudo rm -rf /var/www/html
R.- sudo ln -fs /vagrant /var/www/html

R.- curl: localhost
<strong> Hello meetup</strong>

R.- exit
L.- vagrant destroy --force
```

