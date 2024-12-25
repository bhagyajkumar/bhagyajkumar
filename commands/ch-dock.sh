docker run -d \
--name firefox \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Etc/UTC \
-e FIREFOX_CLI=https://google.com/ \
-p 3000:3000 \
-p 3001:3001 \
--shm-size="1gb" \
--restart unless-stopped \
lscr.io/linuxserver/firefox:latest
