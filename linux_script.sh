#!/bin/bash
dither() {
  echo "Dithering the picture"
    convert "$1" -colorspace gray -ordered-dither o8x8 "output/$outputPath"
    echo "Dithering complete, written to $outputPath"
}
transform() {
  echo "Transforming the picture"
  echo
  echo "$1 $2x$3"
   convert "$1" -resize "$2x$3!" "$outputPath"
  echo "Transforming complete, written to $outputPath"
}
grayscale() {
  echo "Grayscaling the picture"
   convert "$1" -colorspace GRAY "$outputPath"
   echo "Grayscaling complete, written to $outputPath"
}
conv() {
  echo "Converting the picture"
  convert "$pathToPicture" "$outputPath"
}
getPath() {
  echo "Which picture do you want to modify(default picture.png)?"
  read -r pathToPicture
  if [[ $pathToPicture == "" ]]; then
    pathToPicture="picture.png"
    fi
  if [[ ! -f $pathToPicture ]]; then
    clear
    echo "No File named $pathToPicture found"
    getPath
    fi
}
casing(){
echo "Which operation do you want to perform(greyscale(g),transform(t),dither(d),convert(c))"
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
        transform "$pathToPicture" "$width" "$height";;
"c")
  conv;;
*)
  clear
  echo "no valid operation"
  casing;;
esac
}
main() {
  clear
  local pathToPicture=""
  getPath
  echo "-----------------------------"
  echo "Filename: $pathToPicture"
  echo $(identify -format "%[fx:w]px by %[fx:h]px " "$pathToPicture")

  echo "-----------------------------"

  echo "Choose new filename(default output.png)"
  read -r outputPath
  if [[  $outputPath == "" ]]; then
      outputPath="output.png"
      fi

casing
}
main