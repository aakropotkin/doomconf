{ stdenv
, emacs
, gnugrep
, makeWrapper
, cmake
, gcc
, rnix-lsp
, libvterm
#, libvterm-static
, useClient ? false
}:
stdenv.mkDerivation {
  pname   = "emacs-client-wrapper";
  version = "0.0.1";
  src = ./bin/emacs-client-wrapper;
  nativeBuildInputs = [makeWrapper];
  propagatedBuildInputs = [
    rnix-lsp
    libvterm
    cmake
    gcc
    autoconf
    automake
    libtool
  ];
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  dontCheck = true;
  LIBRARY_PATH_EXTRA = builtins.concatStringsSep ":" ( map ( x: "${x}/lib" ) [
    libvterm
#    libvterm-static
  ] );
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
      --set EMACSC "${emacs}/bin/emacsclient"                                \
      --set CMAKE "${cmake}/bin/cmake"                                       \
      --set RNIX_LSP "${rnix-lsp}/bin/rnix-lsp"                              \
      --set LIBVTERM_PREFIX "${libvterm}"                                    \
      --set CC "${gcc}/bin/cc"                                               \
      ;
  '';
}
