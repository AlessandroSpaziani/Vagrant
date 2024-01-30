# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Variabili globali
  BOX_IMAGE = "ubuntu/jammy64"
  PROXY_URL = "http://10.20.5.51:8888"
  NO_PROXY = "localhost,127.0.0.1"
  PROXY_ENABLE = true
  
  #----------------------------------- INIZIO CONFIGURAZIONE MACCHINA WEB -----------------------------------
  config.vm.define "web" do |webconfig|
    # Variabili
    BASE_INT_NETWORK = "10.10.20.10"
	BASE_HOST_ONLY_NETWORK = "192.168.56.10"
	VM_NAME_WEB = "web.m340"
	
	webconfig.vm.box = BOX_IMAGE
	
	# Configurazione proxy
	if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE == true
	  webconfig.proxy.http = PROXY_URL
      webconfig.proxy.https = PROXY_URL
      webconfig.proxy.no_proxy = NO_PROXY
	end
	
	# Configurazione macchina
	webconfig.vm.hostname = VM_NAME_WEB
	webconfig.vm.synced_folder "./site", "/var/www/html"
	webconfig.vm.network "private_network", ip: BASE_INT_NETWORK, virtualbox__intnet: "intnet"
	webconfig.vm.network "private_network", ip: BASE_HOST_ONLY_NETWORK
	webconfig.vm.provision "shell", path: "scripts/install_apache_and_php.sh"
	
	# Opzioni specifiche per virtualbox
    webconfig.vm.provider "virtualbox" do |vb|
      vb.name = VM_NAME_WEB
	  vb.gui = true
	  vb.memory = "1024"
    end
	
  end
  #----------------------------------- FINE CONFIGURAZIONE MACCHINA WEB -----------------------------------


  #----------------------------------- INIZIO CONFIGURAZIONE MACCHINA DB -----------------------------------
  config.vm.define "db" do |dbconfig|
    # Variabili
    BASE_INT_NETWORK = "10.10.20.11"
	VM_NAME_DB = "db.m340"
	
	dbconfig.vm.box = BOX_IMAGE
	
	# Configurazione proxy
	if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE == true
	  dbconfig.proxy.http = PROXY_URL
      dbconfig.proxy.https = PROXY_URL
      dbconfig.proxy.no_proxy = NO_PROXY
	end
	
	# Configurazione macchina
	dbconfig.vm.hostname = VM_NAME_DB
	dbconfig.vm.synced_folder "./site", "/var/www/html"
	dbconfig.vm.network "private_network", ip: BASE_INT_NETWORK, virtualbox__intnet: "intnet"
	dbconfig.vm.provision "shell", path: "scripts/install_mysql.sh"
	
  	# Opzioni specifiche per virtualbox
    dbconfig.vm.provider "virtualbox" do |vb|
      vb.name = VM_NAME_DB
	  vb.gui = true
	  vb.memory = "1024"
    end
	
  end
  #----------------------------------- FINE CONFIGURAZIONE MACCHINA DB -----------------------------------

end