# Vagrant without RTFM!!

El presente es un repositorio creado con ejemplos básicos e introductorios para la utilización de [Vagrant][1]. Si bien son ejemplos simples, el enfoque es hacia una persona con interéses de integrar esta herramienta dentro de su proceso de CI/CD



## Simple
Este directorio es el ejemplo más simple. Se inicializa un archivo de configuración de Vagrant con un box de _centos/7_, instalar Apache2 y mostrar un index simple ubicado en la carpeta compartida de vagrant.


## Bash
Luego de tener claro el proceso manual para provisionar nuestra(s) máquina(s), se automatiza el proceso de instalación a través de la utilización de bash.

En este ejemplo, además de utilizar un script de provisionamiento, se modifica la configuración para que además se realice un [_"Port Forward"_][2] desde la virtual machine (guest) hacia la máquina física (host) exponiendo el servidor apache.

## Chef
Ya teniendo claros los requimientos y el proceso de instalación de cada componente, se procede a la utilización de una herramienta de provisionamiento más madura. En este caso, se muestra el ejemplo utilizando [Chef][3]


---

[1]:https://www.vagrantup.com
[2]:https://www.vagrantup.com/docs/networking/forwarded_ports.html
[3]: https://www.chef.io/chef/