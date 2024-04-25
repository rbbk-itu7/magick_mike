#!/bin/bash
function dither() {
    "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" convert $1 -colorspace gray -ordered-dither o8x8 output.png
}
function transform() {
  "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" $1 -transform 320x240 output.png
}
function grayscale() {
   "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" $1 -colorspace GRAY output.png
}
function main() {
  echo "Which picture do you want to modify?"
  read pathtoPicture
  if [[ $pathtoPicture == "" ]]; then
    pathtoPicture="picture.png"
    fi
  echo "You chose $pathtoPicture"
  echo "Which operation do you want to perform(greyscale(g),transform(t),dither(d))"
  read option
case $option in



"g")
grayscale $pathtoPicture;;
"d")
dither $pathtoPicture;;
"t")
read -p "Specify a height" height
        read -p "Specify a height" height
        read -p "Specify a width" width
        echo "You are resizing to width:$width and height:$height"
        transform $pathtoPicture $width $height
esac
}
main
read t

#"C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" $pathtoPicture -color-matrix \
                                                                                                     ##                                                           " 1.5 0.0 0.0 1.3, 0.0, -0.157 \
                                                                                                     ##                                                             0.0 1.5 0.0 0.0, 0.0, -0.157 \
                                                                                                     ##                                                             0.0 1.0 1.5 0.0, 0.0, -0.157 \
                                                                                                     ##                                                             2.0 0.0 0.0 1.0, 0.0,  0.0 \
                                                                                                     ##                                                             0.0 0.0 0.0 0.0, 1.0,  0.0 \
                                                                                                     ##                                                             0.0 0.0 0.0 0.0, 0.0,  1.0" kittens.png

