#include <gtk/gtk.h>
#include <hildon-cp-plugin/hildon-cp-plugin-interface.h>

//#include <string.h>
#include <hildon/hildon.h>
#include "applock_shared.h"



typedef struct
{
	GtkWidget *parent;
	osso_context_t *osso_context;
} PwdButtonClickDatas;

typedef struct
{
	GtkWidget *chkMediaPlayer;
	GtkWidget *chkPhotos;
	GtkWidget *chkXterminal;
	GtkWidget *chkFilemanager;
	GtkWidget *toggleOn;
	osso_context_t  *osso;
	gpointer *parent;
	GtkWidget *toggleOff;

} AppLockUI;



AppDescription* APPS_DETAILS;
gboolean PRESTART_DO_JOB = TRUE;
static void btn_set_password_clicked(GtkWidget *button, PwdButtonClickDatas *pwdDatas)
{
	/*
	 hildon_banner_show_information (NULL, NULL,"srygrtdyhtrdtgh!");
	 omg();
	 return;
	 */
	GtkWidget *codedialog;
	gint ret;
	gint password_correct = FALSE;

		if (CheckCurrPass(pwdDatas->parent, pwdDatas->osso_context) == TRUE)
		{
			hildon_banner_show_information(NULL, NULL, GOOD_LOCKCODE_MESSAGE);
			const gchar *newpass = PromptForCodeCheckLength(pwdDatas->parent, pwdDatas->osso_context, ENTER_NEW_CODE_WINDOW_TITLE);//FIXME: should we use the same dialog??, maybe in a next version
		
			if(newpass == NULL)
			{
				hildon_banner_show_information(NULL, NULL, LOCK_CODE_NOT_CHANGED_MESSAGE);
			}
			else
			{
				if (SavePassword(newpass) == TRUE)
					hildon_banner_show_information(NULL, NULL, LOCK_CODE_CHANGED_MESSAGE);
				else
				{
					char* msgError = g_strconcat(ERROR_PREFIX_LABEL, LOCK_CODE_NOT_CHANGED_MESSAGE);
					hildon_banner_show_information(NULL, NULL,msgError);
					g_free(msgError);
				}
			}
			g_free(newpass);
		}
		else
		{
			hildon_banner_show_information(NULL, NULL, LOCK_CODE_NOT_CHANGED_MESSAGE);
		}

}

/*
static GtkWidget* setup_dialog (void)
{
	GtkWidget *dialog, *pannable_area, *vbox, *apply_button;
	guint i;

	dialog = gtk_dialog_new_with_buttons ("R&D Mode Control", NULL, GTK_DIALOG_MODAL, GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, NULL);
	apply_button = gtk_dialog_add_button (GTK_DIALOG (dialog), GTK_STOCK_APPLY, GTK_RESPONSE_OK);
	pannable_area = hildon_pannable_area_new ();
	vbox = gtk_vbox_new (FALSE, 0);
	for (i = 0; i < NUM; i++)
	{
		check_button[i] = hildon_check_button_new (HILDON_SIZE_AUTO_WIDTH | HILDON_SIZE_FINGER_HEIGHT);
		gtk_button_set_label (GTK_BUTTON (check_button[i]), rd_mode_flags[i]);
		gtk_box_pack_start (GTK_BOX (vbox), check_button[i], TRUE, TRUE, 0);
	}
	g_signal_connect (G_OBJECT (check_button[MASTER]), "toggled", G_CALLBACK (on_master_check_button_toggled), NULL);
	hildon_pannable_area_add_with_viewport (HILDON_PANNABLE_AREA (pannable_area), vbox);
	gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dialog)->vbox), pannable_area, TRUE, TRUE, 0);
	gtk_widget_set_size_request (dialog, -1, 300);
	g_signal_connect (G_OBJECT (dialog), "response", G_CALLBACK (on_dialog_response), apply_button);

	return dialog;
}
*/


gboolean PopDisablePrestartDialog(GtkWidget *parent)
{
	if(PRESTART_DO_JOB == FALSE) return TRUE; //FIXME: should not be in this func
	GtkWidget *dialog;
	GtkWidget *infoLabel, *questionLabel;
	gint response;

	dialog = gtk_dialog_new_with_buttons(
			PRESTART_INFO_WINDOW_TITLE,
			GTK_WINDOW(parent),
			GTK_DIALOG_MODAL | GTK_DIALOG_NO_SEPARATOR,
			GTK_STOCK_YES,
			GTK_RESPONSE_YES,
			GTK_STOCK_NO,
			GTK_RESPONSE_NO,
			NULL);
	infoLabel = gtk_label_new(PRESTART_INFORMATION_MESSAGE);
	questionLabel = gtk_label_new(DISABLE_PRESTART_MESSAGE);
	
	//gtk_label_set_justify(GTK_LABEL(infoLabel), GTK_JUSTIFY_CENTER);	
	//gtk_label_set_justify(GTK_LABEL(questionLabel), GTK_JUSTIFY_CENTER);
	gtk_label_set_justify(GTK_LABEL(infoLabel), GTK_JUSTIFY_LEFT);
	gtk_label_set_line_wrap(GTK_LABEL(infoLabel), TRUE);

	gtk_label_set_justify(GTK_LABEL(questionLabel), GTK_JUSTIFY_LEFT);
	gtk_label_set_line_wrap(GTK_LABEL(questionLabel), TRUE);

	gtk_container_add(GTK_DIALOG(dialog)->vbox, infoLabel);
	gtk_container_add(GTK_DIALOG(dialog)->vbox, questionLabel);

	gtk_widget_show_all (dialog);

	/* Wait until user finishes the dialog. */
	response = gtk_dialog_run(GTK_DIALOG(dialog));
	/* Free the dialog (and it's children) */
	gtk_widget_destroy(GTK_WIDGET(dialog));

	if (response == GTK_RESPONSE_YES)
	{
		return TRUE;
	}
	return FALSE;
}


static void OnToggleOnButton(GtkWidget *onToggle, AppLockUI *uiDatas)// GtkWidget *offToggle)
{
	  gboolean onState = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(uiDatas->toggleOn));
	  if(onState) //new state
	  {
		if( PopDisablePrestartDialog(uiDatas->parent))
		{
			if(PRESTART_DO_JOB == TRUE)
			{
				hildon_banner_show_information(NULL, NULL, PRESTART_DISABLED);
		  		DisablePrestarting(APPS_DETAILS);
			}
		  	gtk_widget_set_sensitive(uiDatas->toggleOn, FALSE);

		  	gtk_toggle_button_set_active(uiDatas->toggleOff, FALSE);
		  	gtk_widget_set_sensitive(uiDatas->toggleOff, TRUE);
		}
		else
		{
			gtk_toggle_button_set_active(uiDatas->toggleOn, FALSE);
		}


	  }
}


static void OnToggleOffButton(GtkWidget *offToggle, AppLockUI *uiDatas)
{
		gboolean offState = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(uiDatas->toggleOff));
		if(offState) //new state
		{
			if(PRESTART_DO_JOB == TRUE){
				EnablePrestarting(APPS_DETAILS);
				hildon_banner_show_information(NULL, NULL, PRESTART_ENABLE);
			}
			  gtk_widget_set_sensitive(uiDatas->toggleOff, FALSE);

			  gtk_toggle_button_set_active(uiDatas->toggleOn, FALSE);
			  gtk_widget_set_sensitive(uiDatas->toggleOn, TRUE);

		}
}


GtkWidget* InitUi( AppDescription *APPS_DETAILS, AppLockUI *UIButtons, PwdButtonClickDatas *passClickDatas)
{
	g_debug("building Ui...\n");
	GtkWidget *dialog;// *Caption, *UaString;
	//GtkWidget *chkMediaPlayer, *chkPhotos, *chkXterminal, *chkFilemanager;
	GtkWidget *toggleOff;//*toggleOn,
	GtkWidget *pwdButton;
	GtkWidget *pwdModal;
	GtkWidget *lblLockApplications, *lblLockTitle;


	dialog	= gtk_dialog_new_with_buttons("Lock apps", GTK_WINDOW(UIButtons->parent), GTK_DIALOG_MODAL
					| GTK_DIALOG_NO_SEPARATOR, GTK_STOCK_OK, GTK_RESPONSE_OK, GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, NULL);

	pwdButton = hildon_button_new(HILDON_SIZE_FINGER_HEIGHT | HILDON_SIZE_AUTO_WIDTH, HILDON_BUTTON_ARRANGEMENT_HORIZONTAL);
	hildon_button_set_title(HILDON_BUTTON(pwdButton), SET_LOCK_PASSWORD_BUTTON_LABEL);

	UIButtons->chkMediaPlayer = hildon_check_button_new(HILDON_SIZE_FINGER_HEIGHT | HILDON_SIZE_AUTO_WIDTH);
	gtk_button_set_label(GTK_BUTTON (UIButtons->chkMediaPlayer), "Media player");
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkMediaPlayer), FALSE);
	// gtk_button_set_alignment(GTK_BUTTON(priv->dispchkbtn), 0.5f, 0.5f);
	UIButtons->chkPhotos = hildon_check_button_new(HILDON_SIZE_FINGER_HEIGHT | HILDON_SIZE_AUTO_WIDTH);
	gtk_button_set_label(GTK_BUTTON (UIButtons->chkPhotos), "Photos");
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkPhotos), FALSE);

	UIButtons->chkXterminal = hildon_check_button_new(HILDON_SIZE_FINGER_HEIGHT | HILDON_SIZE_AUTO_WIDTH);
	gtk_button_set_label(GTK_BUTTON (UIButtons->chkXterminal), "X Terminal");
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkXterminal), FALSE);

	UIButtons->chkFilemanager = hildon_check_button_new(HILDON_SIZE_FINGER_HEIGHT | HILDON_SIZE_AUTO_WIDTH);
	gtk_button_set_label(GTK_BUTTON (UIButtons->chkFilemanager), "File Manager");
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkFilemanager), FALSE);


	UIButtons->toggleOn = hildon_gtk_toggle_button_new(HILDON_SIZE_AUTO );
	gtk_button_set_label (UIButtons->toggleOn, TOGGLE_ON_LABEL);

	UIButtons->toggleOff = hildon_gtk_toggle_button_new(HILDON_SIZE_AUTO );
	gtk_button_set_label (UIButtons->toggleOff, TOGGLE_OFF_LABEL);

	UIButtons->parent = dialog; // giving this dialog 
	g_signal_connect(G_OBJECT(UIButtons->toggleOn), "toggled", G_CALLBACK(OnToggleOnButton),UIButtons);
	g_signal_connect(G_OBJECT(UIButtons->toggleOff), "toggled", G_CALLBACK(OnToggleOffButton),UIButtons);

	lblLockTitle = gtk_label_new("");
	char* lblbuff = g_strconcat("<span size=\"x-large\">",LOCKING_LABEL,"</span>",NULL);
	gtk_label_set_markup(GTK_LABEL(lblLockTitle), lblbuff);
	g_free(lblbuff);
	lblbuff = NULL;

	lblLockApplications = gtk_label_new("");
	lblbuff = g_strconcat("<span size=\"x-large\">",APPLICATIONS_LABEL,"</span>",NULL);
	gtk_label_set_markup(GTK_LABEL(lblLockApplications), lblbuff);
	g_free(lblbuff);
	lblbuff = NULL;
	passClickDatas->osso_context = UIButtons->osso;
	passClickDatas->parent = dialog;

	g_signal_connect(pwdButton, "clicked", G_CALLBACK(btn_set_password_clicked), passClickDatas);

	//g_signal_connect(pwdButton, "clicked", G_CALLBACK(testcallback), &intptr);
	//load checkbuttons...

	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkMediaPlayer), APPS_DETAILS[APP_DESC_IDX_MEDIAPLAYER].preference);
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkPhotos),APPS_DETAILS[APP_DESC_IDX_IMAGE_VIEWER].preference);
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkXterminal), APPS_DETAILS[APP_DESC_IDX_XTERMINAL].preference);
	hildon_check_button_set_active(HILDON_CHECK_BUTTON(UIButtons->chkFilemanager), APPS_DETAILS[APP_DESC_IDX_FILEMANAGER].preference);

	PRESTART_DO_JOB = FALSE;
	if(APPS_DETAILS[APP_DESC_IDX_LOCKACTIVATION].preference)
		gtk_toggle_button_set_active(UIButtons->toggleOn, TRUE);
	else
		gtk_toggle_button_set_active(UIButtons->toggleOff, TRUE);

	PRESTART_DO_JOB = TRUE;

	GtkWidget* pannable_area = hildon_pannable_area_new();
	g_object_set (G_OBJECT (pannable_area), "mov-mode", HILDON_MOVEMENT_MODE_VERT, NULL);

	GtkWidget* hbox = gtk_hbox_new(FALSE, 5);
	gtk_box_pack_start (GTK_BOX (hbox),UIButtons->toggleOn, TRUE, TRUE, 0);
 	gtk_box_pack_start (GTK_BOX (hbox), UIButtons->toggleOff, TRUE, TRUE, 0);

 	GtkWidget* vbox = gtk_vbox_new (FALSE, 0);
 	gtk_box_pack_start(GTK_BOX (vbox),lblLockTitle, TRUE, TRUE, 0);

 	gtk_box_pack_start (GTK_BOX (vbox), hbox, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), pwdButton, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), lblLockApplications, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), UIButtons->chkMediaPlayer, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), UIButtons->chkPhotos, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), UIButtons->chkXterminal, TRUE, TRUE, 0);

	gtk_box_pack_start (GTK_BOX (vbox), UIButtons->chkFilemanager, TRUE, TRUE, 0);

	hildon_pannable_area_add_with_viewport (HILDON_PANNABLE_AREA (pannable_area), vbox);

	//gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), pannable_area);

	gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dialog)->vbox), pannable_area, TRUE, TRUE, 0);

	gtk_widget_set_size_request (dialog, -1, 400);

	return dialog;

}

/*
gboolean SavePrefAndAutoStart()
{
	SavePreferences( APPS_DETAILS)
}
*/


osso_return_t execute(osso_context_t *osso, gpointer data, gboolean user_activated)
{
	g_debug("sTart...\n");

	setlocale(LC_ALL, "");

		
 	bindtextdomain ( GETTEXT_PACKAGE, LOCALEDIR );
   	bind_textdomain_codeset(GETTEXT_PACKAGE, "UTF-8");
    	textdomain ( GETTEXT_PACKAGE );
	
	/*
	bindtextdomain(APP_NAME, "/usr/share/locale");
	bind_textdomain_codeset(APP_NAME, "UTF-8");
	textdomain(APP_NAME);
	*/
	

	//load apps availables and details
	APPS_DETAILS = InitAppDetails();

	g_debug("Load prefs ...\n");
	//load preferences
	LoadPreferences(APPS_DETAILS);

	


	//Build UI
	AppLockUI UIButtons;
	UIButtons.osso = osso;
	UIButtons.parent = data;
	PwdButtonClickDatas passClickDatas;
	GtkWidget* dialog = InitUi(APPS_DETAILS, &UIButtons, &passClickDatas);
	gtk_widget_show_all(dialog);
	gint *configDialogResponse = gtk_dialog_run(GTK_DIALOG(dialog));
	if (configDialogResponse == GTK_RESPONSE_OK)
	{
		 printf("save prefs ...\n");
		 APPS_DETAILS[APP_DESC_IDX_MEDIAPLAYER].preference = hildon_check_button_get_active(HILDON_CHECK_BUTTON(UIButtons.chkMediaPlayer));
		 APPS_DETAILS[APP_DESC_IDX_IMAGE_VIEWER].preference = hildon_check_button_get_active(HILDON_CHECK_BUTTON(UIButtons.chkPhotos));
		 APPS_DETAILS[APP_DESC_IDX_XTERMINAL].preference = hildon_check_button_get_active(HILDON_CHECK_BUTTON(UIButtons.chkXterminal));
		 APPS_DETAILS[APP_DESC_IDX_FILEMANAGER].preference = hildon_check_button_get_active(HILDON_CHECK_BUTTON(UIButtons.chkFilemanager));

		 //activate locking?
		 //FIXME: Maybe we should stop the daemon when off and reactivate when toggled On
		 APPS_DETAILS[APP_DESC_IDX_LOCKACTIVATION].preference = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(UIButtons.toggleOn));

		if (SavePreferences(APPS_DETAILS) == TRUE)
			hildon_banner_show_information(data, NULL, SAVED_DATA_MESSAGE);
		else
			hildon_banner_show_information(data, NULL, ERROR_DATA_NOT_SAVED_MESSAGE);
	}

	
	FreeAppDetails(APPS_DETAILS);
	gtk_widget_destroy(GTK_WIDGET(dialog));
	return OSSO_OK;
}

osso_return_t save_state(osso_context_t *osso, gpointer data)
{
	return OSSO_OK;
}
