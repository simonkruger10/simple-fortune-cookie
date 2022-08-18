url='localhost:8080'
status=$(curl -s -o /dev/null -w "%{http_code}" ${url})
if [ $status == 200 ]
then
  echo 'Response ok'
  exit 0
fi
  echo "Unable to acces ${url}"
  exit 1