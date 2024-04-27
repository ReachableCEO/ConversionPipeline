#!/bin/bash

set -euo pipefail

ShowTitle="TheProducerNeverSleeps"
RecordingsDir="/var/www/show.turnsys.com/recordings/TimeShifted/RawCapture"


echo "Building file list..."
rm -f $RecordingsDir/ToCombine-${ShowTitle}
for f in $RecordingsDir/$ShowTitle*.flv ; do echo "file '$f'" >> $RecordingsDir/ToCombine-${ShowTitle}; done


echo "Combining..."

docker run --rm -it \
  -v $RecordingsDir:/config \
  linuxserver/ffmpeg \
  -f concat  \
  -err_detect ignore_err \
  safe 0 -i /config/ToCombine-${ShowTitle} \
  -c copy /config/CombinedOutput-${ShowTitle}.flv

#ffmpeg -f concat -safe 0 -i ToCombine.txt -c copy /var/www/show.turnsys.com/recordings/TimeShifted/RawCapture/output-TheProducerNeverSleeps.flv
