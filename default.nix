{ stdenv
, emacs
, gnugrep
, makeWrapper
, rnix-lsp
, libvterm
, useClient ? false
}:
stdenv.mkDerivation {
  pname   = "emacs-client-wrapper";
  version = "0.0.1";
  src = ./bin/emacs-client-wrapper;
  nativeBuildInputs = [makeWrapper];
  propagatedBuildInputs = [rnix-lsp libvterm];
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  dontCheck = true;
  installPhase = ''
    mkdir -p $out/bin;
    cat $src > $out/bin/.emacs-client-wrapper-unwrapped;
    chmod +x $out/bin/.emacs-client-wrapper-unwrapped;
    makeWrapper                                                              \
      $out/bin/.emacs-client-wrapper-unwrapped                               \
      $out/bin/emacs-client-wrapper                                          \
      --argv0 emacs-client-wrapper                                           \
      ${if useClient then "--set USE_CLIENT ':'" else "--unset USE_CLIENT"}  \
      --set GREP "${gnugrep}/bin/grep"                                       \
      --set EMACS "${emacs}/bin/emacs"                                       \
      --set EMACS "${emacs}/bin/emacsclient"                                 \
      ;
  '';
}
