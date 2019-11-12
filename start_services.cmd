taskkill /IM "vcxsrv.exe" /F
xlaunch -run docker/jupyter/config.xlaunch

docker-compose down
docker-compose build
docker-compose up

pause
