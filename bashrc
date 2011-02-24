CHOST="x86_64-pc-linux-gnu"
MAKEOPTS="-j5"
CFLAGS+=" -march=native -O2 -pipe"
CXXFLAGS+=" -march=native -O2 -pipe"
LDFLAGS+=" -Wl,-O2"

case "${CATEGORY}/${PN}" in
	"sys-apps/paludis")
		CXXFLAGS+=" -g -ggdb3 -DHAVE_FFS"
		;;
	"dev-python/docutils")
		LC_ALL="fr_FR.UTF-8"
		;;
	"net-libs/neon")
		LDFLAGS+=" -lgcrypt"
		;;
#	"gnome-base/gnome-shell"|"dev-libs/gobject-introspection"|"dev-libs/gjs"|"x11-wm/mutter")
#		CFLAGS+=" -g -ggdb3 -O0"
#		;;
    "net-libs/xulrunner"|"www-client/firefox")
        WANT_MP=y
#		CXXFLAGS+=" -g -ggdb3 -O0"
        ;;
esac

