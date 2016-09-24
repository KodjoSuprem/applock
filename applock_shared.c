#ifndef _APP_LOCK_SHARED_H_
#define _APP_LOCK_SHARED_H_

#include "applock_shared.h"

//APPDETAILS RELATED CONSTANTS
#define NB_APPS_AVAILABLE 4
#define NB_NON_APP_PREFERENCE 1

//PASSWORD RELATED CONSTANTS
#define MIN_CODE_LOCK_LENGTH 4
#define DEFAULT_APPLOCK_CODE "12345"

int GET_NB_APPS_AVAILABLE()
{
	return NB_APPS_AVAILABLE;
}

int GET_NB_APPDETAILS_SLOTS()
{
	return GET_NB_APPS_AVAILABLE() + NB_NON_APP_PREFERENCE;
}


//Free with g_free(appsDesc);
AppDescription* InitAppDetails()
{
	//GHashTable* AppsAvailable = g_hash_table_new(g_str_hash,g_str_equal);
	//int nbApps = GET_NB_APPS_AVAILABLE();
	int nbSlots = GET_NB_APPDETAILS_SLOTS();
	AppDescription* AppsAvailable = g_new0(AppDescription,nbSlots);

	AppsAvailable[APP_DESC_IDX_MEDIAPLAYER].DisplayName = g_strdup("Media Player");//_("mediaplayer"); //localize that
	AppsAvailable[APP_DESC_IDX_MEDIAPLAYER].ServiceName = g_strdup("com.nokia.mediaplayer");
	AppsAvailable[APP_DESC_IDX_MEDIAPLAYER].GConfPath   = g_strdup(APPLOCK_GCONF_MPLOCK_KEY);
	AppsAvailable[APP_DESC_IDX_MEDIAPLAYER].DesktopFilename = g_strdup("mediaplayer.desktop");
	AppsAvailable[APP_DESC_IDX_MEDIAPLAYER].preference  = FALSE;


	AppsAvailable[APP_DESC_IDX_IMAGE_VIEWER].DisplayName = g_strdup("Image Viewer"); //localize that
	AppsAvailable[APP_DESC_IDX_IMAGE_VIEWER].ServiceName = g_strdup("com.nokia.image_viewer");
	AppsAvailable[APP_DESC_IDX_IMAGE_VIEWER].GConfPath   = g_strdup(APPLOCK_GCONF_PHOTOLOCK_KEY);
	AppsAvailable[APP_DESC_IDX_IMAGE_VIEWER].DesktopFilename = g_strdup("image-viewer.desktop");
	AppsAvailable[APP_DESC_IDX_IMAGE_VIEWER].preference  = FALSE;

	AppsAvailable[APP_DESC_IDX_XTERMINAL].DisplayName = g_strdup("X terminal"); //localize that
	AppsAvailable[APP_DESC_IDX_XTERMINAL].ServiceName = g_strdup("com.nokia.xterm"); 
	AppsAvailable[APP_DESC_IDX_XTERMINAL].GConfPath   = g_strdup(APPLOCK_GCONF_XTERMLOCK_KEY);
	AppsAvailable[APP_DESC_IDX_XTERMINAL].DesktopFilename = g_strdup(""); 
	AppsAvailable[APP_DESC_IDX_XTERMINAL].preference  = FALSE;

	AppsAvailable[APP_DESC_IDX_FILEMANAGER].DisplayName = g_strdup("File Manager"); //localize that
	AppsAvailable[APP_DESC_IDX_FILEMANAGER].ServiceName = g_strdup("com.nokia.osso_filemanager");
	AppsAvailable[APP_DESC_IDX_FILEMANAGER].GConfPath   = g_strdup(APPLOCK_GCONF_FMLOCK_KEY);
	AppsAvailable[APP_DESC_IDX_FILEMANAGER].DesktopFilename = g_strdup(""); 
	AppsAvailable[APP_DESC_IDX_FILEMANAGER].preference  = FALSE;

	AppsAvailable[APP_DESC_IDX_LOCKACTIVATION].DisplayName = g_strdup("_LOCK_ACTIVATION_"); //localize that
	AppsAvailable[APP_DESC_IDX_LOCKACTIVATION].ServiceName = g_strdup("_LOCK_ACTIVATION_");
	AppsAvailable[APP_DESC_IDX_LOCKACTIVATION].GConfPath   = g_strdup(APPLOCK_GCONF_LOCKACTIVATION_KEY);
	AppsAvailable[APP_DESC_IDX_LOCKACTIVATION].preference  = FALSE;
	

return AppsAvailable;

}

void FreeAppDetails(AppDescription* appDetails)
{
	int i;
	int nbApps = GET_NB_APPS_AVAILABLE() + 1;
	if(appDetails != NULL)
	{
		for(i = 0; i < nbApps; ++i)
		{
			g_free(appDetails[i].DisplayName);
			g_free(appDetails[i].ServiceName);
			g_free(appDetails[i].GConfPath);
			//g_free(appDetails[i]);
		}
		g_free(appDetails);
	}

}

void LoadPreferences(AppDescription* prefs)
{

	GConfClient* gcClient = NULL;
	gcClient = gconf_client_get_default();
	/* We make sure that it's a valid GConf-client object. */
	g_assert(GCONF_IS_CLIENT(gcClient));
	

	/* load the values. */
	int i;
	int nbApps = GET_NB_APPS_AVAILABLE();
	for(i=0;i <  nbApps;  ++i)
	{
		//gconf_client_get_bool() return FALSE in case of error that is our DEFAULT value.	
		prefs[i].preference = gconf_client_get_bool(gcClient,  prefs[i].GConfPath, NULL); 
	}

	prefs[APP_DESC_IDX_LOCKACTIVATION].preference = gconf_client_get_bool(gcClient,  prefs[APP_DESC_IDX_LOCKACTIVATION].GConfPath, NULL); 
	g_object_unref(gcClient);
	gcClient = NULL;
}

gboolean SavePreferences(AppDescription* prefs)
{
	GConfClient* gcClient = NULL;
	gcClient = gconf_client_get_default();
	/* We make sure that it's a valid GConf-client object. */
	g_assert(GCONF_IS_CLIENT(gcClient));
	
	gboolean wellsaved = TRUE;
	int i;
	int nbApps = GET_NB_APPS_AVAILABLE();
	for(i=0;i < nbApps ; ++i)
	{
		//g_debug("%s : %d\n",prefs[i].GConfPath,prefs[i].preference);
		if (!gconf_client_set_bool(gcClient, prefs[i].GConfPath, prefs[i].preference, NULL))
		{
			g_warning("Failed to save %s",prefs[i].DisplayName);
			wellsaved = FALSE;
		}
	}

	if (!gconf_client_set_bool(gcClient, prefs[APP_DESC_IDX_LOCKACTIVATION].GConfPath, prefs[APP_DESC_IDX_LOCKACTIVATION].preference, NULL))
	{
			g_warning("Failed to save %s",prefs[APP_DESC_IDX_LOCKACTIVATION].DisplayName);
			wellsaved = FALSE;
	}

	/* Release the GConf client object (with GObject-unref). */
	g_object_unref(gcClient);
	gcClient = NULL;


	return wellsaved;
}





char* MD5(char *string)
{
	return g_compute_checksum_for_string(G_CHECKSUM_MD5, string, -1);
}


//get the Hashed password stored in our GConf space or default Pass when error or not set yet
char* GetSavedPassword()
{
	GConfClient* gcClient = NULL;
	gcClient = gconf_client_get_default();
	/* We make sure that it's a valid GConf-client object. */
	g_assert(GCONF_IS_CLIENT(gcClient));
	char* hashpass = gconf_client_get_string(gcClient, APPLOCK_GCONF_PASSWORD_KEY, NULL);
	if(hashpass == NULL)
	{
		g_warning("Applock code not found, lock code is the default code");
		hashpass = MD5(DEFAULT_APPLOCK_CODE);//FIXME: handle errors and change this behavior
	}
	g_object_unref(gcClient);
	gcClient = NULL;
	return hashpass;
}




//Save MD5 Hashed password into our GConf space
gboolean SavePassword(char *pass)
{

	GConfClient* gcClient = NULL;
	gcClient = gconf_client_get_default();
	/* We make sure that it's a valid GConf-client object. */
	g_assert(GCONF_IS_CLIENT(gcClient));

	char* hashpwd = MD5(pass);//g_compute_checksum_for_string(G_CHECKSUM_MD5, pass, -1);
	//printf("Pass hash: %s\n", hashpwd);
	/* Store the values. */
	if (!gconf_client_set_string(gcClient, APPLOCK_GCONF_PASSWORD_KEY, hashpwd, NULL))
	{
		g_warning("failed to save password");
		return FALSE;
	}
	/* Release the GConf client object (with GObject-unref). */
	g_object_unref(gcClient);
	gcClient = NULL;
	g_free(hashpwd);
	return TRUE;
}

//Compare a password with the Gconf Stored one
gboolean IsPasswordCorrect(char* clear_passToTest)
{
	//default pass is 12345
	char *hashed_storedPass = GetSavedPassword();
	char *hashed_passToTest = MD5(clear_passToTest);
	gboolean equals = (g_strcmp0(hashed_passToTest, hashed_storedPass) == 0);
	//g_free(hashed_passToTest);
	g_free(hashed_storedPass);
	return equals;
}

gchar* PromptForCode(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle)
{
	return PromptForCodeCore(parent, ossoCtx, windowTitle, 0,FALSE);
}

gchar* PromptForCodeForce(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle)
{
	return PromptForCodeCore(parent, ossoCtx, windowTitle, 0,TRUE);
}

gchar* PromptForCodeCheckLength(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle)
{
	return PromptForCodeCore(parent, ossoCtx, windowTitle, MIN_CODE_LOCK_LENGTH,FALSE);
}


gchar* PromptForCodeCore(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle,int min_password_length,  gboolean force)
{
	GtkWidget *dialog;
	gint ret;
	gint password_correct = FALSE;
	CodeLockUI clui;
	const gchar* typedPass = NULL;

	if (!codelockui_init(ossoCtx))
	{
		g_warning ("codelockui init error!");
		if(!force)
		  return NULL;
	}

	dialog = codelock_create_dialog(&clui, TIMEOUT_FOOBAR, FALSE);
	if (windowTitle != NULL)
		gtk_window_set_title(GTK_WINDOW (dialog), windowTitle);

	gtk_widget_show_all(dialog);

	gtk_window_set_transient_for(GTK_WINDOW (dialog), GTK_WINDOW (parent));

	gtk_window_set_position(GTK_WINDOW (dialog), GTK_WIN_POS_NONE);
	
	do
	{
		gtk_widget_set_sensitive(dialog, TRUE);

		ret = gtk_dialog_run(GTK_DIALOG (dialog));		

		gtk_widget_set_sensitive(dialog, FALSE);

		if (ret == GTK_RESPONSE_CANCEL || ret == GTK_RESPONSE_DELETE_EVENT || ret == GTK_RESPONSE_NONE)
		{
			codelock_destroy_dialog(&clui);
			//hildon_banner_show_information(NULL, NULL, LOCK_CODE_NOT_CHANGED_MESSAGE);
			return NULL;
		}
		
		typedPass = codelock_get_code(&clui);

		//min_password_length = (min_password_length < 0)? 0 : min_password_length;
	}
	while(CheckMinPassLength(typedPass,min_password_length,&clui) == FALSE);
	
	codelock_destroy_dialog(&clui);

	return typedPass;
}

//Check password length, display a banner if length is incorrect, clear the dialog password input
//FREE typedPass when length is wrong
gboolean CheckMinPassLength(char* typedPass, int min_password_length, CodeLockUI *clui)
{
		if(min_password_length > 0) //useless but avoid strlen...
		{
			if(strlen(typedPass) < min_password_length)
			{
				char* minPasswordCheckMessage;
				minPasswordCheckMessage = g_strdup_printf(MINIMAL_LOCK_CODE_CHECK_MESSAGE,min_password_length);
				hildon_banner_show_information(NULL, NULL,minPasswordCheckMessage );
				g_free(minPasswordCheckMessage);
				g_free(typedPass);
				typedPass = NULL;
				//g_free(minPasswordCheckMessage);
				codelock_clear_code(clui);
				return FALSE;
			}
		}//if <= 0 we do not check

	return TRUE; 

}


gboolean CheckCurrPass(GtkWidget *parent, osso_context_t *ossoCtx)
{
	return CheckCurrPassCore(parent, ossoCtx, FALSE);
}

gboolean CheckCurrPassForce(GtkWidget *parent, osso_context_t *ossoCtx)
{
	return CheckCurrPassCore(parent, ossoCtx,TRUE);
}

//check password
gboolean CheckCurrPassCore(GtkWidget *parent, osso_context_t *ossoCtx, gboolean force )
{
	GtkWidget *dialog;
	gint ret;
	gint password_correct = FALSE;
	CodeLockUI clui;
	
	if (!codelockui_init(ossoCtx))
	{
		g_warning ("codelockui init error!");
		if(!force)
		  return FALSE;
	}
	
	dialog = codelock_create_dialog(&clui, TIMEOUT_FOOBAR, FALSE);

	gtk_window_set_title(GTK_WINDOW (dialog), CURRENT_PASS_CHECK_WINDOW_TITLE);
	gtk_widget_show_all(dialog);

	gtk_window_set_transient_for(GTK_WINDOW (dialog), GTK_WINDOW (parent));

	gtk_window_set_position(GTK_WINDOW (dialog), GTK_WIN_POS_NONE);

	while (!password_correct)
	{
		gtk_widget_set_sensitive(dialog, TRUE);

		ret = gtk_dialog_run(GTK_DIALOG (dialog));

		gtk_widget_set_sensitive(dialog, FALSE);

		if (ret == GTK_RESPONSE_CANCEL || ret == GTK_RESPONSE_DELETE_EVENT || ret == GTK_RESPONSE_NONE)
		{
			codelock_destroy_dialog(&clui);
			
			return FALSE;
		}

		char *password_entry = codelock_get_code(&clui);
		password_correct = IsPasswordCorrect(password_entry);
		g_free(password_entry);

		if (!password_correct)
		{
			hildon_banner_show_information(NULL, NULL, WRONG_LOCKCODE_MESSAGE);
			codelock_clear_code(&clui);
		}
	}

	codelock_destroy_dialog(&clui);
	if (password_correct == -1)
	{
		/* An error occured in the lock code verification query */
		return FALSE;
	}

	return TRUE;
}




void DisablePrestarting(AppDescription* APPS_DETAILS)
{
	int i;
	int nbapps;
	nbapps = GET_NB_APPS_AVAILABLE();

	for(i = 0; i < nbapps ; ++i)
	{
		if(strcmp(APPS_DETAILS[i].DesktopFilename,"") != 0)
		{
			char* desktopfilepath =  g_strconcat(DESKTOP_ENTRIES_DIR,"/",APPS_DETAILS[i].DesktopFilename,NULL);
			/*
			char* tmp = g_strdup_printf("%s.applock.bak", desktopfilepath);
			if(access(tmp,F_OK) != 0)
			{
				g_free(tmp);
				tmp = g_strdup_printf("cp %s %s.applock.bak", desktopfilepath,desktopfilepath); //backup file will
				system(tmp);

			}
			g_free(tmp);
			*/
			char* command = g_strdup_printf("sed -i \"s/X-Maemo-Prestarted/#X-Maemo-Prestarted/g\" %s",desktopfilepath);
printf("COMMAND=>> %s\n",command);
			system(command);
			g_free(command);
			g_free(desktopfilepath);
			command = NULL;
		}
	}
}


void EnablePrestarting(AppDescription* APPS_DETAILS)
{
	int i;
	int nbapps;
	nbapps = GET_NB_APPS_AVAILABLE();

	for(i = 0; i < nbapps ; ++i)
	{
		if(strcmp(APPS_DETAILS[i].DesktopFilename,"") != 0)
		{
			char* desktopfilepath =  g_strconcat(DESKTOP_ENTRIES_DIR,"/",APPS_DETAILS[i].DesktopFilename,NULL);
			//char* command = g_strdup_printf("mv %s.applock.bak %s",desktopfilepath);
			char* command = g_strdup_printf("sed -i \"s/#X-Maemo-Prestarted/X-Maemo-Prestarted/g\" %s",desktopfilepath);
			printf("COMMAND=>> %s\n",command);
			system(command);	
			g_free(command);
			g_free(desktopfilepath);
			command = NULL;
		}

	}

	
}
#endif
