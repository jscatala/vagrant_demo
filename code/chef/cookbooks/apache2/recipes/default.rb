execute "apt-get update"

package "apache2"

execute "rm -rf /var/www/html"

link "/var/www/html" do
    to "/vagrant"
end

