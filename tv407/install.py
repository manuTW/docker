#!/share/CACHEDEV1_DATA/.qpkg/container-station/bin/python
#to be executed at directory where
#   `pwd`/firmware and `pwd`/modules will be created for container install

import os, sys, re

VER_TUP=('3.12.6-SMP-mod_unload', '3.10.20-al-2.5.3_sa-SMP-mod_unload-ARMv7-p2v8',\
 '3.19.8-SMP-mod_unload')
CWD=os.path.abspath(os.path.realpath(__file__))
CWD=os.path.dirname(CWD)
SYSLIB='/lib/firmware'
if os.path.exists(CWD+'/firmware'):
	ans=raw_input(CWD+'/firmware exists, do you like to continue ?')
	if not re.match(r'y', ans, re.I):
		os.sys.exit(-1)
	os.system('rm -rf firmware modules')

os.system('mkdir -p firmware modules')
if os.path.exists(SYSLIB):
	print SYSLIB+' exists'
	if not os.path.islink(SYSLIB):
		print SYSLIB+' is not a link'
		os.sys.exit(-1)
os.system('rm -f '+SYSLIB)
os.system('ln -s '+CWD+'/firmware '+SYSLIB)
cmd='docker run -it --rm '
cmd+='-v '+CWD+'/firmware:/lib/firmware '
cmd+='-v '+CWD+'/modules:/lib/modules '
cmd+='-v '+CWD+'/modules:/app_dir '
cmd+='-e "LIB_FIRMWARE=/lib/firmware" '
cmd+='-e "LIB_MODULE=/lib/modules" '
cmd+='-e "APP_DIR=/app_dir" '
cmd+='-e "VERMAGIC=3.10.20-al-2.5.3_sa-SMP-mod_unload-ARMv7-p2v8" '
cmd+='manuchen/tv407_arm /bin/bash /usr/local/bin/myinstall install'
print cmd
if len(sys.argv) is 1:
	os.system(cmd)
