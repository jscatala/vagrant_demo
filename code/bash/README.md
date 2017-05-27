# Configuración con Provisionamiento por Bash

Todos los comandos se ejecutarán en nuestra máquina física

## Procedimiento a ejecutar

Primero copiaremos el Vagrant original:

```bash
 mkdir bash
 cd bash
 grep -Ev "^$|#.*$" ../simple/Vagrantfile | tee Vagrantfile
 echo "<strong> Hello meetup with bash!!</strong>" > index.html
```


Luego agregaremos en el Vagrantfile, inmediatamente después de la línea donde definimos nuestro box la configuración para nuestro port forward y el script de provisionamiento:

```bash
  config.vm.network "forwarded_port", guest:80, host:8080
  config.vm.provision "shell",
      path:"bootstrap.sh"
```

Es importante mencionar que el _host_, es nuestra máquina física y el _guest_ es nuestra máquina virtual. Creamos el script de provisionamiento en la misma carpeta que nuestro Vagrantfile, que llamaremos _bootstrap.sh_:

```bash
#!/usr/bin/env bash

echo "Updating machine and installing Apache2"
apt-get update
apt-get install -y apache2

echo "sync directories"
rm -rf /var/www/html
ln -fs /vagrant /var/www/html
```

Y luego probaremos:

```bash
$ vagrant status
Current machine states:

default                   not created (virtualbox)
[...]

$ vagrant up
[...]
==> default: Forwarding ports...
    default: 80 (guest) => 8080 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
[...]
==> default: Running provisioner: shell...
[...]
$ curl localhost:8080
<strong>Hello meetup with bash!!</strong>

$ vagrant destroy --force
```

