# Makefile.in generated by automake 1.8.5 from Makefile.am.
# src/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
# 2003, 2004  Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.




SOURCES = $(applock_cp_plugin_la_SOURCES) $(applock_daemon_SOURCES)

srcdir = .
top_srcdir = ..

pkgdatadir = $(datadir)/applock
pkglibdir = $(libdir)/applock
pkgincludedir = $(includedir)/applock
top_builddir = ..
am__cd = CDPATH="$${ZSH_VERSION+.}$(PATH_SEPARATOR)" && cd
INSTALL = /scratchbox/tools/bin/install -c
install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c
INSTALL_HEADER = $(INSTALL_DATA)
transform = $(program_transform_name)
NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
host_triplet = arm-unknown-linux-gnueabi
daemon_PROGRAMS = applock_daemon$(EXEEXT)
subdir = src
DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in
ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
am__aclocal_m4_deps = $(top_srcdir)/configure.ac
am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
	$(ACLOCAL_M4)
mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
CONFIG_HEADER = $(top_builddir)/config.h
CONFIG_CLEAN_FILES =
am__installdirs = "$(DESTDIR)$(hildoncplibdir)" "$(DESTDIR)$(daemondir)"
hildoncplibLTLIBRARIES_INSTALL = $(INSTALL)
LTLIBRARIES = $(hildoncplib_LTLIBRARIES)
am__DEPENDENCIES_1 =
applock_cp_plugin_la_DEPENDENCIES = $(am__DEPENDENCIES_1)
am_applock_cp_plugin_la_OBJECTS =  \
	applock_cp_plugin_la-applock_cp_plugin.lo \
	applock_cp_plugin_la-applock_shared.lo
applock_cp_plugin_la_OBJECTS = $(am_applock_cp_plugin_la_OBJECTS)
daemonPROGRAMS_INSTALL = $(INSTALL_PROGRAM)
PROGRAMS = $(daemon_PROGRAMS)
am_applock_daemon_OBJECTS = applock_daemon-applock_daemon.$(OBJEXT) \
	applock_daemon-applock_shared.$(OBJEXT)
applock_daemon_OBJECTS = $(am_applock_daemon_OBJECTS)
applock_daemon_DEPENDENCIES = $(am__DEPENDENCIES_1)
DEFAULT_INCLUDES = -I. -I$(srcdir) -I$(top_builddir)
depcomp = $(SHELL) $(top_srcdir)/depcomp
am__depfiles_maybe = depfiles
DEP_FILES = ./$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Plo \
	./$(DEPDIR)/applock_cp_plugin_la-applock_shared.Plo \
	./$(DEPDIR)/applock_daemon-applock_daemon.Po \
	./$(DEPDIR)/applock_daemon-applock_shared.Po
COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
LTCOMPILE = $(LIBTOOL) --mode=compile $(CC) $(DEFS) \
	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
	$(AM_CFLAGS) $(CFLAGS)
CCLD = $(CC)
LINK = $(LIBTOOL) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
	$(AM_LDFLAGS) $(LDFLAGS) -o $@
SOURCES = $(applock_cp_plugin_la_SOURCES) $(applock_daemon_SOURCES)
DIST_SOURCES = $(applock_cp_plugin_la_SOURCES) \
	$(applock_daemon_SOURCES)
ETAGS = etags
CTAGS = ctags
DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
ACLOCAL = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run aclocal-1.8
ALL_LINGUAS = en_GB fr_FR
AMDEP_FALSE = #
AMDEP_TRUE = 
AMTAR = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run tar
APPLOCK_CFLAGS = -DMAEMO_CHANGES -DMAEMO_GTK -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/hildon-1 -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include -I/usr/include/gconf/2  
APPLOCK_LIBS = -lcodelockui -lhildon-1 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgmodule-2.0 -losso -lgconf-2 -ldbus-glib-1 -ldbus-1 -lpthread -lgobject-2.0 -lglib-2.0  
AR = ar
AUTOCONF = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run autoconf
AUTOHEADER = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run autoheader
AUTOMAKE = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run automake-1.8
AWK = gawk
CATALOGS =  en_GB.gmo fr_FR.gmo
CATOBJEXT = .gmo
CC = gcc
CCDEPMODE = depmode=gcc3
CFLAGS = -g -O2
CPP = gcc -E
CPPFLAGS = 
CXX = g++
CXXCPP = g++ -E
CXXDEPMODE = depmode=gcc3
CXXFLAGS = -g -O2
CYGPATH_W = echo
DATADIRNAME = share
DEFS = -DHAVE_CONFIG_H
DEPDIR = .deps
DSYMUTIL = 
ECHO = echo
ECHO_C = 
ECHO_N = -n
ECHO_T = 
EGREP = /scratchbox/tools/bin/grep -E
EXEEXT = 
F77 = 
FFLAGS = 
GETTEXT_PACKAGE = applock
GMOFILES =  en_GB.gmo fr_FR.gmo
GMSGFMT = /scratchbox/tools/bin/msgfmt
GREP = /scratchbox/tools/bin/grep
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = ${SHELL} $(install_sh) -c -s
INSTOBJEXT = .mo
INTLLIBS = 
INTLTOOL_CAVES_RULE = %.caves:     %.caves.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_DESKTOP_RULE = %.desktop:   %.desktop.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_DIRECTORY_RULE = %.directory: %.directory.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_EXTRACT = /scratchbox/devkits/doctools/bin/intltool-extract
INTLTOOL_KBD_RULE = %.kbd:       %.kbd.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -m -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_KEYS_RULE = %.keys:      %.keys.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -k -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_MERGE = /scratchbox/devkits/doctools/bin/intltool-merge
INTLTOOL_OAF_RULE = %.oaf:       %.oaf.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -o -p $(top_srcdir)/po $< $@
INTLTOOL_PERL = /scratchbox/tools/bin/perl
INTLTOOL_POLICY_RULE = %.policy:    %.policy.in    $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_PONG_RULE = %.pong:      %.pong.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_PROP_RULE = %.prop:      %.prop.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_SCHEMAS_RULE = %.schemas:   %.schemas.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -s -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_SERVER_RULE = %.server:    %.server.in    $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -o -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_SERVICE_RULE = %.service: %.service.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_SHEET_RULE = %.sheet:     %.sheet.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_SOUNDLIST_RULE = %.soundlist: %.soundlist.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_THEME_RULE = %.theme:     %.theme.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_UI_RULE = %.ui:        %.ui.in        $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_UPDATE = /scratchbox/devkits/doctools/bin/intltool-update
INTLTOOL_XAM_RULE = %.xam:       %.xml.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
INTLTOOL_XML_NOMERGE_RULE = %.xml:       %.xml.in       $(INTLTOOL_MERGE) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u /tmp $< $@
INTLTOOL_XML_RULE = %.xml:       %.xml.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@
LDFLAGS = 
LIBOBJS = 
LIBS = 
LIBTOOL = $(SHELL) $(top_builddir)/libtool
LN_S = ln -s
LTLIBOBJS = 
MAKEINFO = ${SHELL} /home/minik/lock_apps/applock-0.1/missing --run makeinfo
MKINSTALLDIRS = ./mkinstalldirs
MSGFMT = /scratchbox/tools/bin/msgfmt
MSGFMT_OPTS = -c
MSGMERGE = /scratchbox/tools/bin/msgmerge
NMEDIT = 
OBJEXT = o
PACKAGE = applock
PACKAGE_BUGREPORT = 
PACKAGE_NAME = applock
PACKAGE_STRING = applock 0.1
PACKAGE_TARNAME = applock
PACKAGE_VERSION = 0.1
PATH_SEPARATOR = :
PKG_CONFIG = /scratchbox/tools/bin/pkg-config
POFILES =  en_GB.po fr_FR.po
POSUB = po
PO_IN_DATADIR_FALSE = 
PO_IN_DATADIR_TRUE = 
RANLIB = ranlib
SED = /scratchbox/tools/bin/sed
SET_MAKE = 
SHELL = /bin/sh
STRIP = strip
USE_NLS = yes
VERSION = 0.1
XGETTEXT = /scratchbox/tools/bin/xgettext
ac_ct_CC = gcc
ac_ct_CXX = g++
ac_ct_F77 = 
am__fastdepCC_FALSE = #
am__fastdepCC_TRUE = 
am__fastdepCXX_FALSE = #
am__fastdepCXX_TRUE = 
am__include = include
am__leading_dot = .
am__quote = 
bindir = ${exec_prefix}/bin
build = arm-unknown-linux-gnueabi
build_alias = 
build_cpu = arm
build_os = linux-gnueabi
build_vendor = unknown
daemondir = /usr/sbin
datadir = ${datarootdir}
datarootdir = ${prefix}/share
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
dvidir = ${docdir}
exec_prefix = ${prefix}
hildoncpdesktopentrydir = 
hildoncplibdir = /usr/lib/hildon-control-panel
hildondesktopentrydir = 
hildoniconthemedir = /home/minik/.icons/hicolor
hildonstatusbarplugindir = 
host = arm-unknown-linux-gnueabi
host_alias = 
host_cpu = arm
host_os = linux-gnueabi
host_vendor = unknown
htmldir = ${docdir}
includedir = ${prefix}/include
infodir = ${datarootdir}/info
install_sh = /home/minik/lock_apps/applock-0.1/install-sh
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localedir = /usr/share/locale
localstatedir = ${prefix}/var
mandir = ${datarootdir}/man
mkdir_p = mkdir -p -- .
oldincludedir = /usr/include
pdfdir = ${docdir}
prefix = /usr
program_transform_name = s,x,x,
psdir = ${docdir}
sbindir = ${exec_prefix}/sbin
serviceentrydir = /usr/share/dbus-1/services
sharedstatedir = ${prefix}/com
sysconfdir = ${prefix}/etc
target_alias = 
#daemondir = $(daemondir)
applock_daemon_CFLAGS = $(APPLOCK_CFLAGS)
applock_daemon_LDADD = $(APPLOCK_LIBS)
applock_daemon_SOURCES = applock_daemon.c applock_shared.c applock_shared.h
hildoncplib_LTLIBRARIES = applock_cp_plugin.la
applock_cp_plugin_la_LDFLAGS = -module -avoid-version # $(APPLOCK_CFLAGS)
applock_cp_plugin_la_CFLAGS = -shared $(APPLOCK_CFLAGS)
applock_cp_plugin_la_LIBADD = $(APPLOCK_LIBS)
applock_cp_plugin_la_SOURCES = applock_cp_plugin.c applock_shared.c applock_shared.h
all: all-am

.SUFFIXES:
.SUFFIXES: .c .lo .o .obj
$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am  $(am__configure_deps)
	@for dep in $?; do \
	  case '$(am__configure_deps)' in \
	    *$$dep*) \
	      cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh \
		&& exit 0; \
	      exit 1;; \
	  esac; \
	done; \
	echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign  src/Makefile'; \
	cd $(top_srcdir) && \
	  $(AUTOMAKE) --foreign  src/Makefile
.PRECIOUS: Makefile
Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
	@case '$?' in \
	  *config.status*) \
	    cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh;; \
	  *) \
	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe)'; \
	    cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe);; \
	esac;

$(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh

$(top_srcdir)/configure:  $(am__configure_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
$(ACLOCAL_M4):  $(am__aclocal_m4_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
install-hildoncplibLTLIBRARIES: $(hildoncplib_LTLIBRARIES)
	@$(NORMAL_INSTALL)
	test -z "$(hildoncplibdir)" || $(mkdir_p) "$(DESTDIR)$(hildoncplibdir)"
	@list='$(hildoncplib_LTLIBRARIES)'; for p in $$list; do \
	  if test -f $$p; then \
	    f="`echo $$p | sed -e 's|^.*/||'`"; \
	    echo " $(LIBTOOL) --mode=install $(hildoncplibLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) '$$p' '$(DESTDIR)$(hildoncplibdir)/$$f'"; \
	    $(LIBTOOL) --mode=install $(hildoncplibLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) "$$p" "$(DESTDIR)$(hildoncplibdir)/$$f"; \
	  else :; fi; \
	done

uninstall-hildoncplibLTLIBRARIES:
	@$(NORMAL_UNINSTALL)
	@list='$(hildoncplib_LTLIBRARIES)'; for p in $$list; do \
	    p="`echo $$p | sed -e 's|^.*/||'`"; \
	  echo " $(LIBTOOL) --mode=uninstall rm -f '$(DESTDIR)$(hildoncplibdir)/$$p'"; \
	  $(LIBTOOL) --mode=uninstall rm -f "$(DESTDIR)$(hildoncplibdir)/$$p"; \
	done

clean-hildoncplibLTLIBRARIES:
	-test -z "$(hildoncplib_LTLIBRARIES)" || rm -f $(hildoncplib_LTLIBRARIES)
	@list='$(hildoncplib_LTLIBRARIES)'; for p in $$list; do \
	  dir="`echo $$p | sed -e 's|/[^/]*$$||'`"; \
	  test "$$dir" != "$$p" || dir=.; \
	  echo "rm -f \"$${dir}/so_locations\""; \
	  rm -f "$${dir}/so_locations"; \
	done
applock_cp_plugin.la: $(applock_cp_plugin_la_OBJECTS) $(applock_cp_plugin_la_DEPENDENCIES) 
	$(LINK) -rpath $(hildoncplibdir) $(applock_cp_plugin_la_LDFLAGS) $(applock_cp_plugin_la_OBJECTS) $(applock_cp_plugin_la_LIBADD) $(LIBS)
install-daemonPROGRAMS: $(daemon_PROGRAMS)
	@$(NORMAL_INSTALL)
	test -z "$(daemondir)" || $(mkdir_p) "$(DESTDIR)$(daemondir)"
	@list='$(daemon_PROGRAMS)'; for p in $$list; do \
	  p1=`echo $$p|sed 's/$(EXEEXT)$$//'`; \
	  if test -f $$p \
	     || test -f $$p1 \
	  ; then \
	    f=`echo "$$p1" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`; \
	   echo " $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(daemonPROGRAMS_INSTALL) '$$p' '$(DESTDIR)$(daemondir)/$$f'"; \
	   $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(daemonPROGRAMS_INSTALL) "$$p" "$(DESTDIR)$(daemondir)/$$f" || exit 1; \
	  else :; fi; \
	done

uninstall-daemonPROGRAMS:
	@$(NORMAL_UNINSTALL)
	@list='$(daemon_PROGRAMS)'; for p in $$list; do \
	  f=`echo "$$p" | sed 's,^.*/,,;s/$(EXEEXT)$$//;$(transform);s/$$/$(EXEEXT)/'`; \
	  echo " rm -f '$(DESTDIR)$(daemondir)/$$f'"; \
	  rm -f "$(DESTDIR)$(daemondir)/$$f"; \
	done

clean-daemonPROGRAMS:
	@list='$(daemon_PROGRAMS)'; for p in $$list; do \
	  f=`echo $$p|sed 's/$(EXEEXT)$$//'`; \
	  echo " rm -f $$p $$f"; \
	  rm -f $$p $$f ; \
	done
applock_daemon$(EXEEXT): $(applock_daemon_OBJECTS) $(applock_daemon_DEPENDENCIES) 
	@rm -f applock_daemon$(EXEEXT)
	$(LINK) $(applock_daemon_LDFLAGS) $(applock_daemon_OBJECTS) $(applock_daemon_LDADD) $(LIBS)

mostlyclean-compile:
	-rm -f *.$(OBJEXT)

distclean-compile:
	-rm -f *.tab.c

include ./$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Plo
include ./$(DEPDIR)/applock_cp_plugin_la-applock_shared.Plo
include ./$(DEPDIR)/applock_daemon-applock_daemon.Po
include ./$(DEPDIR)/applock_daemon-applock_shared.Po

.c.o:
	if $(COMPILE) -MT $@ -MD -MP -MF "$(DEPDIR)/$*.Tpo" -c -o $@ $<; \
	then mv -f "$(DEPDIR)/$*.Tpo" "$(DEPDIR)/$*.Po"; else rm -f "$(DEPDIR)/$*.Tpo"; exit 1; fi
#	source='$<' object='$@' libtool=no \
#	depfile='$(DEPDIR)/$*.Po' tmpdepfile='$(DEPDIR)/$*.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(COMPILE) -c $<

.c.obj:
	if $(COMPILE) -MT $@ -MD -MP -MF "$(DEPDIR)/$*.Tpo" -c -o $@ `$(CYGPATH_W) '$<'`; \
	then mv -f "$(DEPDIR)/$*.Tpo" "$(DEPDIR)/$*.Po"; else rm -f "$(DEPDIR)/$*.Tpo"; exit 1; fi
#	source='$<' object='$@' libtool=no \
#	depfile='$(DEPDIR)/$*.Po' tmpdepfile='$(DEPDIR)/$*.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(COMPILE) -c `$(CYGPATH_W) '$<'`

.c.lo:
	if $(LTCOMPILE) -MT $@ -MD -MP -MF "$(DEPDIR)/$*.Tpo" -c -o $@ $<; \
	then mv -f "$(DEPDIR)/$*.Tpo" "$(DEPDIR)/$*.Plo"; else rm -f "$(DEPDIR)/$*.Tpo"; exit 1; fi
#	source='$<' object='$@' libtool=yes \
#	depfile='$(DEPDIR)/$*.Plo' tmpdepfile='$(DEPDIR)/$*.TPlo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(LTCOMPILE) -c -o $@ $<

applock_cp_plugin_la-applock_cp_plugin.o: applock_cp_plugin.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_cp_plugin.o -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" -c -o applock_cp_plugin_la-applock_cp_plugin.o `test -f 'applock_cp_plugin.c' || echo '$(srcdir)/'`applock_cp_plugin.c; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Po"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo"; exit 1; fi
#	source='applock_cp_plugin.c' object='applock_cp_plugin_la-applock_cp_plugin.o' libtool=no \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Po' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_cp_plugin.o `test -f 'applock_cp_plugin.c' || echo '$(srcdir)/'`applock_cp_plugin.c

applock_cp_plugin_la-applock_cp_plugin.obj: applock_cp_plugin.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_cp_plugin.obj -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" -c -o applock_cp_plugin_la-applock_cp_plugin.obj `if test -f 'applock_cp_plugin.c'; then $(CYGPATH_W) 'applock_cp_plugin.c'; else $(CYGPATH_W) '$(srcdir)/applock_cp_plugin.c'; fi`; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Po"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo"; exit 1; fi
#	source='applock_cp_plugin.c' object='applock_cp_plugin_la-applock_cp_plugin.obj' libtool=no \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Po' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_cp_plugin.obj `if test -f 'applock_cp_plugin.c'; then $(CYGPATH_W) 'applock_cp_plugin.c'; else $(CYGPATH_W) '$(srcdir)/applock_cp_plugin.c'; fi`

applock_cp_plugin_la-applock_cp_plugin.lo: applock_cp_plugin.c
	if $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_cp_plugin.lo -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" -c -o applock_cp_plugin_la-applock_cp_plugin.lo `test -f 'applock_cp_plugin.c' || echo '$(srcdir)/'`applock_cp_plugin.c; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Plo"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Tpo"; exit 1; fi
#	source='applock_cp_plugin.c' object='applock_cp_plugin_la-applock_cp_plugin.lo' libtool=yes \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.Plo' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_cp_plugin.TPlo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_cp_plugin.lo `test -f 'applock_cp_plugin.c' || echo '$(srcdir)/'`applock_cp_plugin.c

applock_cp_plugin_la-applock_shared.o: applock_shared.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_shared.o -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" -c -o applock_cp_plugin_la-applock_shared.o `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Po"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_cp_plugin_la-applock_shared.o' libtool=no \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.Po' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_shared.o `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c

applock_cp_plugin_la-applock_shared.obj: applock_shared.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_shared.obj -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" -c -o applock_cp_plugin_la-applock_shared.obj `if test -f 'applock_shared.c'; then $(CYGPATH_W) 'applock_shared.c'; else $(CYGPATH_W) '$(srcdir)/applock_shared.c'; fi`; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Po"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_cp_plugin_la-applock_shared.obj' libtool=no \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.Po' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_shared.obj `if test -f 'applock_shared.c'; then $(CYGPATH_W) 'applock_shared.c'; else $(CYGPATH_W) '$(srcdir)/applock_shared.c'; fi`

applock_cp_plugin_la-applock_shared.lo: applock_shared.c
	if $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -MT applock_cp_plugin_la-applock_shared.lo -MD -MP -MF "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" -c -o applock_cp_plugin_la-applock_shared.lo `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c; \
	then mv -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo" "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Plo"; else rm -f "$(DEPDIR)/applock_cp_plugin_la-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_cp_plugin_la-applock_shared.lo' libtool=yes \
#	depfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.Plo' tmpdepfile='$(DEPDIR)/applock_cp_plugin_la-applock_shared.TPlo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_cp_plugin_la_CFLAGS) $(CFLAGS) -c -o applock_cp_plugin_la-applock_shared.lo `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c

applock_daemon-applock_daemon.o: applock_daemon.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_daemon.o -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" -c -o applock_daemon-applock_daemon.o `test -f 'applock_daemon.c' || echo '$(srcdir)/'`applock_daemon.c; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" "$(DEPDIR)/applock_daemon-applock_daemon.Po"; else rm -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo"; exit 1; fi
#	source='applock_daemon.c' object='applock_daemon-applock_daemon.o' libtool=no \
#	depfile='$(DEPDIR)/applock_daemon-applock_daemon.Po' tmpdepfile='$(DEPDIR)/applock_daemon-applock_daemon.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_daemon.o `test -f 'applock_daemon.c' || echo '$(srcdir)/'`applock_daemon.c

applock_daemon-applock_daemon.obj: applock_daemon.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_daemon.obj -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" -c -o applock_daemon-applock_daemon.obj `if test -f 'applock_daemon.c'; then $(CYGPATH_W) 'applock_daemon.c'; else $(CYGPATH_W) '$(srcdir)/applock_daemon.c'; fi`; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" "$(DEPDIR)/applock_daemon-applock_daemon.Po"; else rm -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo"; exit 1; fi
#	source='applock_daemon.c' object='applock_daemon-applock_daemon.obj' libtool=no \
#	depfile='$(DEPDIR)/applock_daemon-applock_daemon.Po' tmpdepfile='$(DEPDIR)/applock_daemon-applock_daemon.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_daemon.obj `if test -f 'applock_daemon.c'; then $(CYGPATH_W) 'applock_daemon.c'; else $(CYGPATH_W) '$(srcdir)/applock_daemon.c'; fi`

applock_daemon-applock_daemon.lo: applock_daemon.c
	if $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_daemon.lo -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" -c -o applock_daemon-applock_daemon.lo `test -f 'applock_daemon.c' || echo '$(srcdir)/'`applock_daemon.c; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo" "$(DEPDIR)/applock_daemon-applock_daemon.Plo"; else rm -f "$(DEPDIR)/applock_daemon-applock_daemon.Tpo"; exit 1; fi
#	source='applock_daemon.c' object='applock_daemon-applock_daemon.lo' libtool=yes \
#	depfile='$(DEPDIR)/applock_daemon-applock_daemon.Plo' tmpdepfile='$(DEPDIR)/applock_daemon-applock_daemon.TPlo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_daemon.lo `test -f 'applock_daemon.c' || echo '$(srcdir)/'`applock_daemon.c

applock_daemon-applock_shared.o: applock_shared.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_shared.o -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_shared.Tpo" -c -o applock_daemon-applock_shared.o `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo" "$(DEPDIR)/applock_daemon-applock_shared.Po"; else rm -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_daemon-applock_shared.o' libtool=no \
#	depfile='$(DEPDIR)/applock_daemon-applock_shared.Po' tmpdepfile='$(DEPDIR)/applock_daemon-applock_shared.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_shared.o `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c

applock_daemon-applock_shared.obj: applock_shared.c
	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_shared.obj -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_shared.Tpo" -c -o applock_daemon-applock_shared.obj `if test -f 'applock_shared.c'; then $(CYGPATH_W) 'applock_shared.c'; else $(CYGPATH_W) '$(srcdir)/applock_shared.c'; fi`; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo" "$(DEPDIR)/applock_daemon-applock_shared.Po"; else rm -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_daemon-applock_shared.obj' libtool=no \
#	depfile='$(DEPDIR)/applock_daemon-applock_shared.Po' tmpdepfile='$(DEPDIR)/applock_daemon-applock_shared.TPo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_shared.obj `if test -f 'applock_shared.c'; then $(CYGPATH_W) 'applock_shared.c'; else $(CYGPATH_W) '$(srcdir)/applock_shared.c'; fi`

applock_daemon-applock_shared.lo: applock_shared.c
	if $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -MT applock_daemon-applock_shared.lo -MD -MP -MF "$(DEPDIR)/applock_daemon-applock_shared.Tpo" -c -o applock_daemon-applock_shared.lo `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c; \
	then mv -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo" "$(DEPDIR)/applock_daemon-applock_shared.Plo"; else rm -f "$(DEPDIR)/applock_daemon-applock_shared.Tpo"; exit 1; fi
#	source='applock_shared.c' object='applock_daemon-applock_shared.lo' libtool=yes \
#	depfile='$(DEPDIR)/applock_daemon-applock_shared.Plo' tmpdepfile='$(DEPDIR)/applock_daemon-applock_shared.TPlo' \
#	$(CCDEPMODE) $(depcomp) \
#	$(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(applock_daemon_CFLAGS) $(CFLAGS) -c -o applock_daemon-applock_shared.lo `test -f 'applock_shared.c' || echo '$(srcdir)/'`applock_shared.c

mostlyclean-libtool:
	-rm -f *.lo

clean-libtool:
	-rm -rf .libs _libs

distclean-libtool:
	-rm -f libtool
uninstall-info-am:

ID: $(HEADERS) $(SOURCES) $(LISP) $(TAGS_FILES)
	list='$(SOURCES) $(HEADERS) $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	mkid -fID $$unique
tags: TAGS

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	tags=; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	if test -z "$(ETAGS_ARGS)$$tags$$unique"; then :; else \
	  test -n "$$unique" || unique=$$empty_fix; \
	  $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	    $$tags $$unique; \
	fi
ctags: CTAGS
CTAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	tags=; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	test -z "$(CTAGS_ARGS)$$tags$$unique" \
	  || $(CTAGS) $(CTAGSFLAGS) $(AM_CTAGSFLAGS) $(CTAGS_ARGS) \
	     $$tags $$unique

GTAGS:
	here=`$(am__cd) $(top_builddir) && pwd` \
	  && cd $(top_srcdir) \
	  && gtags -i $(GTAGS_ARGS) $$here

distclean-tags:
	-rm -f TAGS ID GTAGS GRTAGS GSYMS GPATH tags

distdir: $(DISTFILES)
	@srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`; \
	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's|.|.|g'`; \
	list='$(DISTFILES)'; for file in $$list; do \
	  case $$file in \
	    $(srcdir)/*) file=`echo "$$file" | sed "s|^$$srcdirstrip/||"`;; \
	    $(top_srcdir)/*) file=`echo "$$file" | sed "s|^$$topsrcdirstrip/|$(top_builddir)/|"`;; \
	  esac; \
	  if test -f $$file || test -d $$file; then d=.; else d=$(srcdir); fi; \
	  dir=`echo "$$file" | sed -e 's,/[^/]*$$,,'`; \
	  if test "$$dir" != "$$file" && test "$$dir" != "."; then \
	    dir="/$$dir"; \
	    $(mkdir_p) "$(distdir)$$dir"; \
	  else \
	    dir=''; \
	  fi; \
	  if test -d $$d/$$file; then \
	    if test -d $(srcdir)/$$file && test $$d != $(srcdir); then \
	      cp -pR $(srcdir)/$$file $(distdir)$$dir || exit 1; \
	    fi; \
	    cp -pR $$d/$$file $(distdir)$$dir || exit 1; \
	  else \
	    test -f $(distdir)/$$file \
	    || cp -p $$d/$$file $(distdir)/$$file \
	    || exit 1; \
	  fi; \
	done
check-am: all-am
check: check-am
all-am: Makefile $(LTLIBRARIES) $(PROGRAMS)
installdirs:
	for dir in "$(DESTDIR)$(hildoncplibdir)" "$(DESTDIR)$(daemondir)"; do \
	  test -z "$$dir" || $(mkdir_p) "$$dir"; \
	done
install: install-am
install-exec: install-exec-am
install-data: install-data-am
uninstall: uninstall-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am

installcheck: installcheck-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	  install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	  `test -z '$(STRIP)' || \
	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='$(STRIP)'"` install
mostlyclean-generic:

clean-generic:

distclean-generic:
	-rm -f $(CONFIG_CLEAN_FILES)

maintainer-clean-generic:
	@echo "This command is intended for maintainers to use"
	@echo "it deletes files that may require special tools to rebuild."
clean: clean-am

clean-am: clean-daemonPROGRAMS clean-generic \
	clean-hildoncplibLTLIBRARIES clean-libtool mostlyclean-am

distclean: distclean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
distclean-am: clean-am distclean-compile distclean-generic \
	distclean-libtool distclean-tags

dvi: dvi-am

dvi-am:

html: html-am

info: info-am

info-am:

install-data-am: install-daemonPROGRAMS install-hildoncplibLTLIBRARIES

install-exec-am:

install-info: install-info-am

install-man:

installcheck-am:

maintainer-clean: maintainer-clean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
maintainer-clean-am: distclean-am maintainer-clean-generic

mostlyclean: mostlyclean-am

mostlyclean-am: mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool

pdf: pdf-am

pdf-am:

ps: ps-am

ps-am:

uninstall-am: uninstall-daemonPROGRAMS \
	uninstall-hildoncplibLTLIBRARIES uninstall-info-am

.PHONY: CTAGS GTAGS all all-am check check-am clean \
	clean-daemonPROGRAMS clean-generic \
	clean-hildoncplibLTLIBRARIES clean-libtool ctags distclean \
	distclean-compile distclean-generic distclean-libtool \
	distclean-tags distdir dvi dvi-am html html-am info info-am \
	install install-am install-daemonPROGRAMS install-data \
	install-data-am install-exec install-exec-am \
	install-hildoncplibLTLIBRARIES install-info install-info-am \
	install-man install-strip installcheck installcheck-am \
	installdirs maintainer-clean maintainer-clean-generic \
	mostlyclean mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool pdf pdf-am ps ps-am tags uninstall \
	uninstall-am uninstall-daemonPROGRAMS \
	uninstall-hildoncplibLTLIBRARIES uninstall-info-am


#libapplock_cp_plugin_la_LDADD = $(APPLOCK_LIBS)
# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
