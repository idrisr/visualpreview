{ epub-thumbnailer, ffmpegthumbnailer, fontpreview, imagemagick, kitty
, poppler_utils, nix-derivation, writeShellApplication }:

writeShellApplication {
  name = "visualpreview";
  runtimeInputs = [
    epub-thumbnailer
    ffmpegthumbnailer
    fontpreview
    imagemagick
    kitty
    poppler_utils
    nix-derivation
  ];
  text = builtins.readFile ./visualpreview.sh;
}
