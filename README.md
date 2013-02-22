mkbuildchroot
=============

Scripts used to create chroots to host multiple jenkins slaves on a single host.
This can be needed for various reasons, but we need it here because when building
debian packages for arm with pbuilder, qemu cannot emulate multiple cores, and
the base tarball cannot be shared. We then need chroots which share everything
but /var
