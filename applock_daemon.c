#include <string.h>
#include <glib.h>
#include <dbus/dbus-glib.h>
//#include <dbus/dbus-glib-lowlevel.h>

#include "applock_shared.h"


GConfClient* GConfListenerInit();
void UpdateAppPreferences();

//global var freed when deamon stops
AppDescription* APPS_DETAILS;
//int* globalargc; char* *globalargv;


void signal_handler(int sig)
{
	switch(sig){
		case SIGINT:
		case SIGTERM:
			/* finalize the server */
			printf("test");
			FreeAppDetails(APPS_DETAILS);
			exit(0);
			break;		
	}	
}

static void NameOwnerChangedHandler(DBusGProxy *proxy, char *name, char *old_owner, char *new_owner, gpointer user_data)
{
	DBusGConnection* busconn = user_data;
	
		if (g_strcmp0(old_owner, "") == 0) // taking the name
		{
			if (IsThisServiceLocked(name)) //name check
			{
				g_print("%s is opening\n", name);
				if(LockPrompt() == FALSE) //Ask a pass
				{
					if (!TryToKill(proxy, busconn, name))
						g_warning("Signal send failed\n");
					else
						g_print("Signal sent\n");
				}
			}
		}

		if (g_strcmp0(new_owner, "") == 0) //Closing... Not so necessary
		{
			g_print("%s is closing\n", name);
		}

}

 gboolean LockPrompt()
 {
	g_print("Password check\n");
	//gtk_init(globalargc, globalargv);
	 //GtkWidget* inv = gtk_invisible_new();
	//

// HildonProgram *program = HILDON_PROGRAM(hildon_program_get_instance());
	 //g_set_application_name("lock-apps-handler");

//	osso_context_t *ossoCtx = osso_initialize (APPLOCK_SERVICE_NAME, "0.1", TRUE, NULL);//g_main_loop_get_context(loop));

	 //quite messy :s
 	gboolean password_correct = CheckCurrPassForce(NULL,NULL);

	//gboolean password_correct = FALSE;//CheckCurrPass(GTK_WINDOW(inv),ossoCtx);//parent, osso_ctx

	 //g_signal_connect(G_OBJECT(inv), "delete_event", G_CALLBACK(gtk_main_quit), NULL);
	 //gtk_widget_show_all(inv);
//	osso_deinitialize(ossoCtx);
	
	return password_correct;
	
 }

int GetPidFromServiceName(DBusGProxy* proxy, char* serviceName)
{
	GError* error = NULL;
	int pid;
	if (!dbus_g_proxy_call(proxy, DBUS_GET_PID_METHOD, &error, G_TYPE_STRING, serviceName, G_TYPE_INVALID, G_TYPE_UINT, &pid, G_TYPE_INVALID))
	{
		g_error_free(error);
		return -1;
	}

	return pid;
}

gboolean TryToKill(DBusGProxy* proxy, DBusGConnection* busconn, char* serviceName)
{
	DBusError error;
	dbus_error_init(&error);
	
	g_print("Check if %s has owner on the bus\n", serviceName);
	//Not so necessary...
	DBusConnection* lowLvlConn = dbus_g_connection_get_connection(busconn);
	if (!dbus_bus_name_has_owner(lowLvlConn, serviceName, &error))
	{
		g_warning("NO OWNERS...service name not owned\n");
		g_warning("service '%s' will not be killed!",serviceName);
		return FALSE;
	}

	g_print("OK! Got it !\n");

	int pid = GetPidFromServiceName(proxy, serviceName);

	if (pid < 0)
	{
		g_warning("Cannot get %s's PID, cant kill\n",serviceName);
	}

	g_assert(pid > 1); //avoid special processes...
	
	int delay = 1;
	g_print("Will try to kill in %d seconds... %s\n", delay,serviceName);

	sleep(delay); //app is launching...

	g_print("Try...\n");
	//Diie!!! (please...)
	g_print("Sending SIGTERM signal\n");
	if (kill(pid, SIGTERM) != 0)
	{
		g_warning("SIGTERM sending failed, service : '%s' have not been killed",serviceName);
		return FALSE;
	}

	return TRUE;
}




//Use the global var APPS_DETAILS
gboolean IsThisServiceLocked(char* serviceName)
{
	int i;
	int nbApps = GET_NB_APPS_AVAILABLE();
	if(APPS_DETAILS[APP_DESC_IDX_LOCKACTIVATION].preference == FALSE)
	{
		g_print(APP_NAME " :Service not activated\n");	
		return FALSE;
	}

	for (i = 0; i < nbApps; ++i)
	{
		//if (strcmp(serviceName, APPS_DETAILS[i].ServiceName) == 0) //strcmp? will servicenames change ?? :-/
		if(g_ascii_strncasecmp(serviceName,APPS_DETAILS[i].ServiceName,-1) == 0)
		{
			g_print(APP_NAME " :%s found!\n",serviceName);	
			return APPS_DETAILS[i].preference; //TRUE if locked FALSE if not
		}
	}
	return FALSE; //service NOT FOUND

}

void UpdateAppPreferences()
{
	//reload all keys
	g_print("reloading all prefs\n");
	LoadPreferences(APPS_DETAILS);
}

GConfClient* GConfListenerInit()
{
	GConfClient *client;
	GError* error = NULL;
	client = gconf_client_get_default();

	g_return_val_if_fail(client,-1);

	    /*Add GConf node if absent*/
	    gconf_client_add_dir (client, APPLOCK_GCONF_ROOTPATH,  GCONF_CLIENT_PRELOAD_NONE, &error);

	   // gconf_client_key_is_writable (client,APPLOCK_GCONF_ROOTPATH, NULL);
	    if (error != NULL)
	    {
	    	g_printerr (APP_NAME ": %s (gconf_client_add_dir)\n", error->message);
	  	g_error_free (error);
	  	error = NULL;
	    }
	    gconf_client_notify_add(client,APPLOCK_GCONF_ROOTPATH,
	                             UpdateAppPreferences, NULL, NULL, &error);

	    if (error != NULL) {
	       g_error("Failed to add register the callback: %s\n",error->message);
	       /* Program terminates. */
	     }
	    return client;

}


int main(int argc, char *argv[])
{
/*
  if (daemon(0, 0) != 0) {
    g_error(APP_NAME ": Failed to daemonize.\n");
  }
*/
	gtk_init(&argc,&argv); //TODO: check the exact behavior of this function. Just initialize some global vars or start infinite loops?
	g_print("START DAEMON\n");
	GError *error = NULL;
	DBusGConnection * bus = NULL;
	GMainLoop *loop = NULL;
	APPS_DETAILS = NULL;

	APPS_DETAILS = InitAppDetails(); //get apps details and preferences

	g_type_init();
	loop = g_main_loop_new(NULL, FALSE);

	//osso_context_t *ossoCtx = osso_initialize (APPLOCK_SERVICE_NAME, VERSION, TRUE, g_main_loop_get_context(loop)); // use our context

	bus = dbus_g_bus_get(DBUS_BUS_SYSTEM, &error);
	if (error != NULL)
	{
		g_printerr("Connecting to system bus failed: %s\n", error->message);
		g_error_free(error);
		return 1;
	}

	//I can't use osso rpc routines osso_rpc_set_cb_f returns -1, glib dbus api is 10x much clearer and sexy than osso's stuff as well...

	DBusGProxy* proxy =
			dbus_g_proxy_new_for_name(bus, DBUS_SERVICE_DBUS, DBUS_PATH_DBUS, DBUS_INTERFACE_DBUS);


//REGISTER ON BUS
int requestRez;
if(!dbus_g_proxy_call(proxy,"RequestName",&error,G_TYPE_STRING,APPLOCK_SERVICE_NAME,G_TYPE_UINT,0, G_TYPE_INVALID, G_TYPE_UINT,&requestRez,G_TYPE_INVALID))
{
	g_printerr("dbus registration failed: %s\n", error->message);
	g_error_free(error);
	return 1;
}


	dbus_g_proxy_add_signal(proxy, NAME_OWNER_CHANGED_SIGNAL_NAME, G_TYPE_STRING, G_TYPE_STRING, G_TYPE_STRING, G_TYPE_INVALID);
	dbus_g_proxy_connect_signal(proxy, NAME_OWNER_CHANGED_SIGNAL_NAME, G_CALLBACK(NameOwnerChangedHandler), bus, NULL);

	dbus_g_connection_flush(bus); //not so necessary
	g_print("Waiting for '%s' signals...\n",NAME_OWNER_CHANGED_SIGNAL_NAME);

	/*
	globalargc = &argc;
	globalargv = &argv;
	*/
	GConfClient* client= GConfListenerInit(); //listen for Gconf changes

	UpdateAppPreferences();
	signal(SIGTERM,signal_handler);
	signal(SIGINT,signal_handler);
	g_main_loop_run(loop);

	g_object_unref (G_OBJECT (client));
	dbus_g_connection_unref(bus);
	FreeAppDetails(APPS_DETAILS);
	return 0;

}









