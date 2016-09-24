#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <glib/gi18n.h>
#include <codelockui.h>
#include <hildon/hildon-banner.h>
#include <gconf/gconf.h>
#include <gconf/gconf-client.h>
#include "config.h"

#define __(String) gettext(g_strdup(String))
/*
#define D_(s) dgettext ("hildon-fm", s)
#define C_(s) dgettext ("hildon-common-strings", s)
#define L_(s) dgettext ("hildon-libs", s)
#define LOCKTEXT_(s) dgettext("osso-system-lock", s)

*/

#define APP_NAME "applock"
#define APPLOCK_GCONF_ROOTPATH  "/apps/Maemo/" APP_NAME

#define APPLOCK_GCONF_PASSWORD_KEY		APPLOCK_GCONF_ROOTPATH "/hashpass"
#define APPLOCK_GCONF_XTERMLOCK_KEY 		APPLOCK_GCONF_ROOTPATH "/xtermlock"
#define APPLOCK_GCONF_MPLOCK_KEY 		APPLOCK_GCONF_ROOTPATH "/mediaplayer"
#define APPLOCK_GCONF_PHOTOLOCK_KEY 		APPLOCK_GCONF_ROOTPATH "/imageviewer"
#define APPLOCK_GCONF_FMLOCK_KEY 		APPLOCK_GCONF_ROOTPATH "/filemanager"
#define APPLOCK_GCONF_LOCKACTIVATION_KEY	APPLOCK_GCONF_ROOTPATH "/lockactivation"

//Not using device code lock message to avoid confusions....

#define WRONG_LOCKCODE_MESSAGE 			_("Wrong App lock code") //dgettext("osso-system-lock", "secu_info_incorrectcode")
#define GOOD_LOCKCODE_MESSAGE 			_("Correct App lock code")
#define CURRENT_PASS_CHECK_WINDOW_TITLE 	_("Enter your current App Lock password...")
#define ENTER_NEW_CODE_WINDOW_TITLE		_("Enter your new App lock code...")
#define SET_LOCK_PASSWORD_BUTTON_LABEL		_("Set lock password")
#define LOCK_CODE_NOT_CHANGED_MESSAGE 		_("App lock code not changed")
#define LOCK_CODE_CHANGED_MESSAGE		_("App lock code changed")
#define MINIMAL_LOCK_CODE_CHECK_MESSAGE		_("Please enter a lock code at least %d digits long")
#define SAVED_DATA_MESSAGE			_("Preferences saved")
#define ERROR_DATA_NOT_SAVED_MESSAGE		_("Preferences saved with errors")
#define CANNOT_DISPLAY_CODE_DIALOG		_("Cannot display dialog")
#define LOCKING_LABEL				_("Locking")
#define APPLICATIONS_LABEL			_("Applications")
#define TOGGLE_ON_LABEL				_("On")
#define TOGGLE_OFF_LABEL			_("Off")
#define ERROR_PREFIX_LABEL			_("Error!: ")

#define PRESTART_ENABLE				_("Application pre-start re-enabled")
#define PRESTART_DISABLED			_("Application pre-start disabled")
#define DISABLE_PRESTART_MESSAGE		_("Disable pre-start?")
#define PRESTART_INFO_WINDOW_TITLE       	_("Application pre-start informations")
#define PRESTART_INFORMATION_MESSAGE 		_("Some applications are pre-started by the system to speed-up their startup. By activating application locking you will disable pre-start for locked applications.\nIt will be re-enabled if you set locking on Off.")
	



//#define MEDIAPLAYERNAME 			"_T()"


#define APPLOCK_SERVICE_NAME "fr.miniscalope.applock"
#define DBUS_INTERFACE_ORG_FREEDESKTOP_LOCAL "org.freedesktop.Local"
#define NAME_OWNER_CHANGED_SIGNAL_NAME "NameOwnerChanged"
#define DBUS_GET_PID_METHOD "GetConnectionUnixProcessID"



typedef struct
{
	char*	ServiceName;
	char*	GConfPath;
	char*	DisplayName;
	char* 	DesktopFilename;
	gboolean preference;
} AppDescription;

typedef enum
{
	APP_DESC_IDX_MEDIAPLAYER ,
	APP_DESC_IDX_IMAGE_VIEWER,
	APP_DESC_IDX_XTERMINAL,
	APP_DESC_IDX_FILEMANAGER,
	APP_DESC_IDX_LOCKACTIVATION
} AppDescriptionArrayIndex;



int GET_NB_APPS_AVAILABLE();

void DisablePrestarting(AppDescription* APPS_DETAILS);

void EnablePrestarting(AppDescription* APPS_DETAILS);

void LoadPreferences(AppDescription* prefs);

gboolean SavePreferences(AppDescription* prefs);

/**
	Return applications informations and preference for locking

	@return AppDescription array
*/
AppDescription* InitAppDetails();


/**
	Free AppDescription array created with InitAppDetails
	@param appDetails	pointer on first item of AppDescription array created with InitAppDetails

	@return AppDescription array
*/
void FreeAppDetails(AppDescription* appDetails);



/**
	Compute an MD5 hash string from string
	@param string	sring to be hashed

	@return hashed string
*/
char* MD5(char* string);



/**
	Return the password stored in the lock_apps Gconf path

	@return MD5 hashed password string
*/
char* GetSavedPassword();


/**
	Save a password in the lock_apps Gconf path

	@param pass	password to save. Will be MD5 hashed
	@return TRUE if well saved, FALSE if not
*/
gboolean SavePassword(char *pass);


/**
	Compare passtotest with the stored password

	@param password to test
	@return TRUE if equal, FALSE if not
*/
gboolean IsPasswordCorrect(char* passtotest);

/**
	Check password length, display a banner if length is incorrect, clear the dialog password input
	FREE typedPass when length is wrong

	@param typedPass pass to check
	@param min_password_length
	@param clui 
	@return TRUE if length is good, FALSE if not
*/
gboolean CheckMinPassLength(char* typedPass, int min_password_length, CodeLockUI *clui);

gchar* PromptForCode(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle);

gchar* PromptForCodeCheckLength(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle);//, int min_password_length);


gchar* PromptForCodeForce(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle);


/**
	Invite user to enter a password

	@param parent parent window to use
	@param ossoCtx osso context used by the dialog
	@param windowTitle Title displayed on the dialog
	@param min_password_length minimal pass length required < 1 for not checking length
	@param force do not quit when codelock_init fail
	@return code entered by user
*/
gchar* PromptForCodeCore(GtkWidget *parent, osso_context_t *ossoCtx, char* windowTitle,int min_password_length,  gboolean force);


/**
	Same as CheckCurrPass with force parameter is FALSE by default

	@param parent parent window to use
	@param ossoCtx osso context used by the dialog

	@return TRUE if the password is good, False if the user quit the dialog or error
*/
gboolean CheckCurrPass(GtkWidget *parent, osso_context_t *ossoCtx);

/**
	Same as CheckCurrPass but try building codelockui dialog anyway if codelockui_init fail.
	force parameter is TRUE by default

	@param parent parent window to use
	@param ossoCtx osso context used by the dialog

	@return TRUE if the password is good, False if the user quit the dialog or error
*/
gboolean CheckCurrPassForce(GtkWidget *parent, osso_context_t *ossoCtx);


/**
	Invite enter it's password for a check
	Password entered is checked with stored one
	Require gtk_init() before invocation

	@param parent parent window to use
	@param ossoCtx osso context used by the dialog
	@param force if FALSE function returns FALSE immediatly if codelock_init fail	

	@return TRUE if the password is good, False if the user quit the dialog or error
*/
gboolean CheckCurrPassCore(GtkWidget *parent, osso_context_t *ossoCtx, gboolean force);

