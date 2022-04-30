{ stdenv
, emacs
, gnugrep
, makeWrapper
, useClient ? false
}:
stdenv.mkDerivation {
  pname   = "my-emacs";
  version = "0.0.1";
  src = ./bin/my-emacs;
  nativeBuildInputs = [makeWrapper];
  dontConfigure = true;
  dontBuild = true;
  dontCheck = true;
  installPhase = ''
    mkdir -p $out/bin;
    cat $src > $out/bin/.my-emacs-unwrapped;
    chmod +x $out/bin/.my-emacs-unwrapped;
    makeWrapper $out/bin/.my-emacs-unwrapped $out/bin/my-emacs               \
      --argv0 my-emacs                                                       \
      ${if useClient then "--set USE_CLIENT ':'" else "--unset USE_CLIENT"}  \
      --set GREP "${gnugrep}/bin/grep"                                       \
      --set EMACS "${emacs}/bin/emacs"                                       \
      --set EMACS "${emacs}/bin/emacsclient"                                 \
      ;
  '';
}
