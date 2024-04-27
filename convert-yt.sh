docker run --rm -it \
  -v $(pwd):/config \
  linuxserver/ffmpeg \
  -i /config/input.flv \
  -c:v libx264 \
  -vf scale=1280:720 \
  -preset slow -crf 18 \
  -c:a copy \
  -pix_fmt yuv420p \
  -c:a copy \
  /config/output.mkv


#output.mkv
#-b:v 4M \
