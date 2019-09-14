taskkill /IM "vcxsrv.exe" /F
xlaunch -run config/config.xlaunch

docker-compose stop
docker-compose start
docker-compose logs --tail 3

pause
