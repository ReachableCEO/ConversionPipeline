docker run --rm -it \
  -v /var/www/show.turnsys.com/recordings:/config \
  linuxserver/ffmpeg \
  -i /config/$1 \
  -vn -ar 44100 -ac 2 -ab 129k  -f mp3 \
  /config/PublishedAudio/output2.mp4




#ffmpeg -i source_video.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 sound.mp3
