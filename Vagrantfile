
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 80, host: 8009
  config.vm.network "private_network", ip: "172.30.11.103"

  config.vm.hostname = "cgi"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.name   = "CGI sandbox"
  end

  config.vm.provision "shell", path: "bootstrap.sh"

  config.vm.provision "file", source: "examples/hello.pl", destination: "/var/www/cgi-bin/hello.pl"

  config.vm.provision "shell", inline: <<-EOF
    dos2unix /var/www/cgi-bin/* >/dev/null 2>&1
    chmod +x /var/www/cgi-bin/*
    echo "Now go to: http://localhost:8009/cgi-bin/hello.pl"
  EOF

end
