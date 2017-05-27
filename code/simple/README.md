# Configuración por defecto

_L$_ : Comando ejecutado en la máquina física

_R$_ : Comando ejecutado en la máquina virtual

## Procedimiento a ejecutar

En el presente directorio, se va a generar una máquina con la configuración por defecto, utilizando el box XenialXerus64. Se instalará de forma manual Apache2 y se linkeará el directorio compartido por defecto (_/vagrant_ en la máquina virtual) a la configuración de apache.


```
L$ mkdir simple
L$ cd simple
L$ vagrant init XenialXerus64
L$ ls
README.md    Vagrantfile
L$ echo "<strong> Hello meetup</strong>" > index.html
L$ vagrant status
Current machine states:

default                   not created (virtualbox)
[...]
L$ vagrant up
L$ vagrant status
Current machine states:

default                   running (virtualbox)
[...]
L$ vagrant ssh

R$ sudo apt-get update 
R$ sudo apt-get install -y apache2
R$ sudo rm -rf /var/www/html
R$ sudo ln -fs /vagrant /var/www/html

R$ curl: localhost
<strong> Hello meetup</strong>

R$ exit
L$ vagrant destroy --force
```

