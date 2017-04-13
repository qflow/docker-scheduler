# docker-scheduler
Runs scripts as cron scheduled jobs

```
docker run --name scheduler --restart always qflow/docker-scheduler \
 -script https://raw.githubusercontent.com/qflow/docker-scheduler/master/echo.sh
```
