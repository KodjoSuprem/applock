#bin_PROGRAMS = applock_daemon
daemon_PROGRAMS = applock_daemon
#daemondir = $(daemondir)
applock_daemon_CFLAGS = $(APPLOCK_CFLAGS)
applock_daemon_LDADD = $(APPLOCK_LIBS)
applock_daemon_SOURCES = applock_daemon.c applock_shared.c applock_shared.h



hildoncplib_LTLIBRARIES = applock_cp_plugin.la
applock_cp_plugin_la_LDFLAGS = -module -avoid-version # $(APPLOCK_CFLAGS)
applock_cp_plugin_la_CFLAGS = -shared $(APPLOCK_CFLAGS)
applock_cp_plugin_la_LIBADD =  $(APPLOCK_LIBS)
applock_cp_plugin_la_SOURCES = applock_cp_plugin.c applock_shared.c applock_shared.h

#libapplock_cp_plugin_la_LDADD = $(APPLOCK_LIBS)
