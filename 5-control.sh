# prompting user to open site in browser
echo "Site is up and healthy. Open $site_name in any browser to view it."
echo "Or click on the link -> http://localhost:8000"

# Adding subcommands to enbale/disable
if [ "$2" == "enable" ]; then
 docker-compose start
elif [ "$2" == "disable" ]; then
 docker-compose stop
fi

# Adding subcommands to delete site
if [ "$2" == "delete" ]; then
 docker-compose down -v
 #removing hosts entry
 sed -i "/$site_name/d" /etc/hosts
 #removing all local files
 rm -rf ./
fi
