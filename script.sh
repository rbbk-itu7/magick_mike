#!/bin/bash
echo "Which picture do you want to modify?"
read pathtoPicture
echo "You chose $pathtoPicture"
echo "Which operation do you want to perform(greyscale,transform,diddel)"
read option

"C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" $pathtoPicture -colorspace Transparent output.png