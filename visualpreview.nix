{ epub-thumbnailer, ffmpegthumbnailer, fontpreview, imagemagick, kitty
, poppler_utils, writeShellApplication }:

writeShellApplication {
  name = "visualpreview";
  runtimeInputs = [
    epub-thumbnailer
    ffmpegthumbnailer
    fontpreview
    imagemagick
    kitty
    poppler_utils
  ];
  text = builtins.readFile ./visualpreview.sh;
}
