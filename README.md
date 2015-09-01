Openswitch Development Environment
-----------------------------------------------

This is an attempt to use Vagrant and Dockers to provide an easy to setup development environment for the [Openswitch](openswitch.net) project.
 
 Skip steps 1-3 if Virtualbox and Vagrant (and the required plugins) are already installed.
 
 1. Download and install Virtualbox from [virtualbox.org](https://www.virtualbox.org/)
 2. Download and install Vagrant from [vagrantup.com](vagrantup.com)
 3. Install [Vagrant plugins](https://docs.vagrantup.com/v2/plugins/usage.html)

   ```
	% vagrant plugin install vagrant-reload
   ```
 4. Download and unzip the [Openswitch Vagrant files](https://github.com/shadansari/openswitch-vagrant/archive/master.zip) into a workspace folder.
 5. If you are behind a proxy, install the vagrant-proxyconf:
```
	% vagrant plugin install vagrant-proxyconf
```
and set the proxy host and port in the host/Vagrantfile:
```
        config.proxy.http = "http://proxy.example.com:8080"   
        config.proxy.https = "http://proxy.example.com:8080" 
```
 6. Run vagrant up.

   ```
	% cd openswitch-vagrant-master
	% vagrant up
   ```

The first "vagrant up" can take a while since the entire Openswitch repository is fetched and built.

What you get
-------
If everything goes well, your VM should now have the Openswitch development environment in **~/ops-build**. (The username/password for the VM is the default vagrant/vagrant). The VM has an instance of Openswitch running inside a docker container in the VM.  

Login to the Openswitch instance
----------------------------------------
To login to the Openswitch instance, run a shell on the docker instance and invoke the Openswitch **vtysh** CLI:
```
vagrant@ops-host:~/ops-build$ docker exec -ti ops bash
bash-4.3# vtysh
2015-09-01T23:31:47Z|00001|reconnect|INFO|unix:/var/run/openvswitch/db.sock: connecting...
2015-09-01T23:31:47Z|00002|reconnect|INFO|unix:/var/run/openvswitch/db.sock: connected
```

Fetch Openswitch repos
-----------------------------

Build Openswitch
--------------------

Run Openswitch
-------------------

Caveats
-------
 1. Only tested on Windows 7.
 2. Bails out on Ubuntu (needs to fix this)
 3. Tested with Vagrant 1.7.4 and Dockers 5.0. Latest versions of both are recommended as Docker support is not present in older versions of vagrant.

