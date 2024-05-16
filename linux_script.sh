#!/bin/bash
dither() {
  echo "Dithering the picture"
    convert "$1" -colorspace gray -ordered-dither o8x8 output.png
    echo "Dithering complete, written to output.png"
}
transform() {
  echo "Transforming the picture"
  echo
  echo "$1 $2x$3"
   convert "$1" -resize "$2x$3!" output.png
  echo "Transforming complete, written to output.png"
}
grayscale() {
  echo "Grayscaling the Picture"
   convert "$1" -colorspace GRAY output.png
   echo "Grayscaling complete, written to output.png"
}
getPath() {
  echo "Which picture do you want to modify(default picture.png)?"
  read -r pathToPicture
  if [[ $pathToPicture == "" ]]; then
    pathToPicture="picture.png"
    fi
  echo "You chose $pathToPicture"
  if [[ ! -f $pathToPicture ]]; then
    clear
    echo "No File named $pathToPicture found"
    getPath
    fi
}
main() {
  clear
  local pathToPicture=""
  getPath
  echo "-----------------------------"
  echo "Which operation do you want to perform(greyscale(g),transform(t),dither(d))"
  read -r option
case $option in

"g")
grayscale "$pathToPicture";;
"d")
dither "$pathToPicture";;
"t")
        read -r -p "Specify a height " height
        read -r -p "Specify a width " width
        echo "You are resizing to width:$width and height:$height"
        transform "$pathToPicture" "$width" "$height"
esac
}
main