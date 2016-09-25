Generate quassel password :
 
echo "md5`echo -n "passwordusername" | md5sum | awk '{print $1}'`"


su - quassel -c "quasselcore --select-backend=PostgreSQL --configdir=/srv/quassel"

