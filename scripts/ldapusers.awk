BEGIN { FS=":" }
{ print "dn: uid=" $1 ", dc=exemple, dc=com cn: " $2 " " $3 " sn: " $3 " telephoneNumber: " $4; }
