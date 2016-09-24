#include <string.h>
#include <glib.h>
#include "applock_shared.h"



void DisablePrestarting(AppDescription* APPS_DETAILS)
{
	int i;
	int nbapps;
	nbapps = GET_NB_APPS_AVAILABLE();

	for(i = 0; i < nbapps ; ++i)
	{
		if(strcmp(APPS_DETAILS[i].DesktopFilename,"") != 0)
		{
			char* desktopfilepath =  g_strconcat(DESKTOP_ENTRIES_DIR,"/",APPS_DETAILS[i].DesktopFilename);
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
			system(command);
			g_free(command)
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
			char* desktopfilepath =  g_strconcat(DESKTOP_ENTRIES_DIR,"/",APPS_DETAILS[i].DesktopFilename);
			//char* command = g_strdup_printf("mv %s.applock.bak %s",desktopfilepath);
			char* command = g_strdup_printf("sed -i \"s/#X-Maemo-Prestarted/X-Maemo-Prestarted/g\" %s",desktopfilepath);
			system(command);	
			g_free(command);
			command = NULL;
		}

	}

	
}
