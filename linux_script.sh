#!/bin/bash
function dither() {
  echo "Dithering the picture"
    convert "$1" -colorspace gray -ordered-dither o8x8 output.png
    echo "Dithering complete, written to output.png"
}
function transform() {
  echo "Transforming the picture"
  echo
  echo "$1 $2x$3"
   convert "$1" -resize "$2x$3!" output.png
  echo "Transforming complete, written to output.png"
}
function grayscale() {
  echo "Grayscaling the Picture"
   convert "$1" -colorspace GRAY output.png
   echo "Grayscaling complete, written to output.png"
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
        read -r -p "Specify a height " height
        read -r -p "Specify a width " width
        echo "You are resizing to width:$width and height:$height"
        transform $pathtoPicture "$width" "$height"
esac
}
main