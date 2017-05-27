# Configuración con Provisionamiento con Chef

Esta vez, modificaremos el método de provisionamiento, utilizando chef. 

## Procedimiento a ejecutar

Lo primero será crear el directorio, copiar el Vagrantfile, crear el index, y crearemos la estructura de archivos para chef

```bash
mkdir chef
cd chef
cp ../bash/Vagrantfile .
echo "<strong>Hello meetup with chef!!</strong>" > index.html
mkdir -p cookbooks/apache2/recipes
```

Luego, modificaremos nuestro vagrantfile para que esta vez, en vez de bash reciva chef_solo para su provisionamiento. Recordar que también puede provisionarse a través de Chef conectandose a un servidor maestro.

```
config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "apache2"
```

Terminaremos la configuración creando nuestra receta en el archivo default.rb (dentro del directorio recipes):

```ruby
execute "apt-get update"

package "apache2"

execute "rm -rf /var/www/html"

link "/var/www/html" do
    to "/vagrant"
end
```


Ahora probamos que todo funcione ok:

```bash
$ vagrant status
Current machine states:

default                   not created (virtualbox)
[...]
$ vagrant up
[...]
==> default: Running provisioner: chef_solo...
    default: Installing Chef (latest)...
==> default: Generating chef JSON and uploading...
==> default: Running chef-solo...
[...]
$ curl localhost:8080
<strong>Hello meetup with chef!!</strong>
$ vagrant destroy --force
```

