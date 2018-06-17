apt-get install fakeroot build-essential devscripts dh-make
wget -O 3proxy-0.9-devel.zip  https://github.com/z3APA3A/3proxy/archive/devel.zip
unzip 3proxy-0.9-devel.zip
mv 3proxy-devel 3proxy-0.9-devel
cd 3proxy-0.9-devel
wget -O Makefile.Linux https://raw.githubusercontent.com/VProgNet/3proxy-misc/master/Makefile.Linux
ln -s Makefile.Linux Makefile
make
make clean
dh_make -p 3proxy-devel_0.9.0 --createorig
echo "override_dh_usrlocal:" >> debian/rules
dpkg-buildpackage
cd ..
dpkg -i 3proxy-devel_0.9.0-1_amd64.deb
/usr/bin/install -p /usr/local/3proxy/logs/
chown -R proxy:proxy /usr/local/3proxy/logs/
wget -O clear_logs.sh https://raw.githubusercontent.com/VProgNet/3proxy-misc/master/clear_logs.sh
chmod +x clear_logs.sh
wget -O 3proxy.cfg https://raw.githubusercontent.com/VProgNet/3proxy-misc/master/3proxy.cfg
mv /etc/3proxy/3proxy.cfg /etc/3proxy/3proxy.cfg.back
mv 3proxy.cfg /etc/3proxy/3proxy.cfg
/etc/init.d/3proxy start
bash clear_logs.sh
