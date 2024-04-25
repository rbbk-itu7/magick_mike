#!/bin/bash
function dither() {
  echo "Dithering the picture"
    convert $1 -colorspace gray -ordered-dither o8x8 output.png
    echo "Dithering complete, written to output.png"
}
function transform() {
  echo "Transforming the picture"
   convert $1 -transform 320x240 output.png
  echo "Transforming complete, wirtten to ouutput.png"
}
function grayscale() {
  echo "Grayscaling the Picture"
   convert $1 -colorspace GRAY output.png
   echo "Grayscaling complete"
}
function main() {
  echo "Which picture do you want to modify(default picture.png)?"
  read -r pathtoPicture
  if [[ $pathtoPicture == "" ]]; then
    pathtoPicture="picture.png"
    fi
  echo "You chose $pathtoPicture"
  echo "Which operation do you want to perform(greyscale(g),transform(t),dither(d))"
  read -r option
case $option in

"g")
grayscale $pathtoPicture;;
"d")
dither $pathtoPicture;;
"t")
read -r -p "Specify a height" height
        read -r -p "Specify a height" height
        read -r -p "Specify a width" width
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

