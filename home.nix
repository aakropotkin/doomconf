{ pkgs, config }:
let
  emacs-client-wrapper = pkgs.callPackage ./default.nix {
    emacs = config.programs.emacs.finalPackage;
    useClient = config.services.emacs.client.enable;
  };
in {
  programs.emacs.enable = true;
  services.emacs = {
    enable = true;
    client.enable = true;
  };
  home.packages = [
    /* Emacs requires GNOME Virtual File System for userspace VFS back-ends.
     * This allows editing files over various protocols as if they were regular
     * local files on disk.
     * Provides support for:
     *   SFTP, FTP, WebDAV, SMD, Udev, OBEX, MTP, AFP, HTTP, NFS, among others
     */
    pkgs.gnome3.gvfs
    #emacs-client-wrapper
    cmake
    libvterm
  ];
}
