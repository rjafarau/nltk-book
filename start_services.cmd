taskkill /IM "vcxsrv.exe" /F
xlaunch -run config/config.xlaunch

docker-compose down
docker-compose build
docker-compose up

pause
