! Insert copyright and license here 1994

! Netscape.ad --- app-defaults file for Netscape 4.8.
!
! Bugs and commentary to x_cbug@netscape.com.

! Created: Jamie Zawinski <use the bug address, please>, 23-Jun-94.
! Modified: dp Suresh <dp@netscape.com>, 01-Aug-95
! Modified: snpf <snpf@netscape.com>, 23-Sep-96
! Modified: submitted by Leon Kanter <leon@geon.donetsk.ua>
! Modified: updated for 4.76 <notting@redhat.com> 09-Nov-2000
! Modified: updated for 4.79 <notting@redhat.com> 09-Apr-2000
!
!      ==========================================================
!      NOTE: If you're looking here for things to customize, look
!      on the Preferences dialogs under the Options menu first.
!      Most things are customizable from there.  Things which are
!      settable via the Preferences dialog boxes are stored in
!      the ~/.netscape/preferences file, and not in X resources.
!      ==========================================================
!
! This file lists the default resources built in to Netscape.
! You can use the stuff in this file for examples of how to customize
! Netscape for your environment; normally you will do this by
! copying the few lines you want to alter to your private resource
! database, which usually lives in a file called .Xdefaults in your home
! directory.
!
! Site administrators **may** want to make changes here and install this
! file as the global app-defaults file for the site.  To do this, one
! would copy this file to /usr/lib/X11/app-defaults/Netscape, or on SunOS,
! /usr/openwin/lib/app-defaults/Netscape.  (But actually this directory
! could be anywhere; only the person who installed X knows for sure.)
!
! It is **STRONGLY RECOMMENDED** that you not install this file in the
! app-defaults directory unless you are really sure you know what you are
! doing.  There are a whole slew of version-skew problems associated with
! app-defaults files, which are best avoided by simply not using them.
! In particular, if the app-defaults file for a program is installed, and
! you get a new version of that program, you can't properly test out the
! new version without actually installing it, since it will pick up the
! resources for the previous version, and will quite likely malfunction.
!
! In short, app-defaults files are bad.  Don't use them.  This file is
! provided for informational purposes, and so that I don't get a lot of
! complaints from people who think they understand this stuff better than
! I do.

! Language localization:
*versionLocale: en

! SGI only: Here's how you turn on SGI's Motif hacks:
!!Netscape*sgiMode:		True

! SGI only: Use enhanced file selection UI in SGI Motif
!*useEnhancedFSB:		True

! SGI Only: Use base color scheme:
!Netscape*scheme:		Base
!Netscape*useSchemes:		Colors

! This resource enables some hacks to the File Selection Box
! which use a simpler layout algorithm than the standard Motif
! code. The directory and file listings are always maintained
! as equal size. We don't do this for SGI, as they have solved
! the problem. See *useEnhancedFSB above.
*nsMotifFSBHacks: True

! This resource enables the CDE mode of the File Selection Box.
! You must be running a CDE enhanced Motif library for this
! option to work. This resource will apply pathMode=1 to the
! File Selection Box. If you specify nsMotifFSBHacks and
! nsMotifFSBCdeMode, some of the keyboard and filter enhancements
! of nsMotifFSBHacks will also be applied, the layout hacks will not.
*nsMotifFSBCdeMode: False
!*nsMotifFSBCdeMode: True

! SCO Only: IXI Motif Form widget is broken, don't use it
!*useIxiAdds: NONE

! User-Settable Parameters
! ========================

! This is the directory where Netscape finds external files such as icons.
!
*appDir:			/@LOC_LANG@/netscape

! This resource is the same as the -visual command line option, which selects
! an X visual on which the windows should be created.  Legal options are:
! Best, meaning pick the best one w.r.t. image quality; Default, meaning
! use whatever the server says is the default visual; a visual class (like
! PseudoColor or TrueColor); or a decimal or hexadecimal digit, the ID of
! a particular visual (in case there is more than one visual of a particular
! class.)  "Best" is probably the right choice.
!
*visualID:			Best

! Whether Netscape should install a private colormap.  This will cause the
! maximal number of colors to be used, but on most systems, will result in
! unpleasant colormap flashing when switching between applications.  Legal
! options are: Yes, No, and Guess.  "Guess" means "install the colormap only
! if we know that the display hardware supports multiple simultaneous
! colormaps, meaning that there will be no colormap flashing."  Currently,
! that means install the map when displaying on an SGI screen, and don't
! otherwise.  (What other vendors have multiple hardware colormaps, and how
! do you uniquely identify that capability?  Let me know.)
!
*installColormap:		Guess

! Some motif versions have a XmDragOverShell (called "dragOver")
! widget which has a XmNinstallColormap resource.  Force it to false here
! so that there is no conflict with the "*installColormap: Guess" stuff.
*dragOver*installColormap:		False

! The maximum number of color cells to allocate per image; this is only
! relevant when using the default colormap of a PseudoColor visual.
! If it is 0, we allocate as many colors as we can get.  (The more colors
! that we can allocate, the better images will look.)  This controls only
! the number of colors allocated for internal images - a few more colors
! will be allocated for the fluff and chrome that comes with Motif.
!
*maxImageColors:		0

! Set this to false to disable the <BLINK> tag.
*blinkingEnabled:		True

! Whether the Exit menu item should confirm first.
*confirmExit:			False

! Mouse cursor when over an anchor.
*linkCursor:			hand2

! Mouse cursor when awaiting a reply.
*busyCursor:			watch

! Mouse cursor when "Save Next Link As..." mode is on, and over a link.
*saveNextLinkCursor:		hand2

! Mouse cursor when "Save Next Link As..." mode is on, and not over a link.
*saveNextNonlinkCursor:		crosshair

! How quickly (in seconds) the status messages should update.
*progressInterval:		1

! How quickly (in milliseconds) the run light and/or logo should animate.
*busyBlinkRate:			500

! How often (in seconds) the global history, bookmarks, and disk cache
! files should be updated.
*saveHistoryInterval:		600

! How many pixels of motion must occur before a mouse-release is interpreted
! as a "drag" rather than a "click."
*hysteresis:			3

! These resources control whether Netscape should redirect its stdout and
! stderr streams to a dialog box, so that diagnostics reported by other
! programs launched by Netscape (for example, external viewers specified in
! a mailcap file) will be reported to the user through a dialog box,
! instead of simply showing up on the stdout/stderr of the controlling
! terminal of Netscape (which in many cases won't even be visible.)
!
! If you have a external viewer which produces an annoying amount of output
! even when it has nothing interesting to say, you can shut it up by
! redirecting its output to stderr; for example, to do this to mpeg_play,
! you could add the following to your .mailcap file:
!
!        video/mpeg; mpeg_play %s 2>&-
!
! Normally, Netscape captures both the stdout and stderr into the dialog box.
! If you find a need to let one or both of them continue on to the actual
! terminal of Netscape, you can do it by setting these resources to False.
!
*useStderrDialog:		True
*useStdoutDialog:		True

! For those MIME content-encodings which are not directly understood
! internally, it is possible to specify another Unix program to use as
! a filter here.
!
! Each line in the encodingFilters resource consists of four fields,
! separated by colons and optional whitespace:
!
!   <input-encoding>  : <output-encoding> : <extensions> : <filter-command>
!
! input-encoding:  The MIME encoding from the Content-Transfer-Encoding header.
!                  (The basic encodings 7BIT, 8BIT, BINARY, BASE64, and QUOTED-
!                  PRINTABLE are built-in; no need to specify those.)
!
! output-encoding: The encoding that results from this transformation.
!                  Leaving this empty is usually appropriate.
!
! extensions:      A comma-separated list of the extensions typically used for
!                  files in this encoding; if a document ends in one of these
!                  extensions, then when that document is saved to disk, the
!                  extension will be stripped off of the default file name
!                  (since documents are decoded before they are saved, and the
!                  extension would no longer accurately describe the file.)
!
! filter-command:  A shell command which reads from stdin and writes to stdout
!                  which does the actual decoding.
!
*encodingFilters:				  \
	x-compress :  : .Z     : uncompress -c	\n\
	compress   :  : .Z     : uncompress -c	\n\
	x-gzip     :  : .z,.gz : gzip -cdq	\n\
	gzip       :  : .z,.gz : gzip -cdq	\n


! Too many servers have bugs in the implementation of window gravity for
! us to rely on it.  Scrolling of large forms is *significantly* faster
! if we are able to make use of window gravity, but on many X servers, it
! results in form items being scattered randomly all over the document.
! Legal values for this resource are Yes, No, Partial, and Guess.  If
! "Guess", we run some tests and try to decide whether the X server is
! broken or partially broken.
!
! If you find yourself needing to use a value here other than Guess,
! please tell us, so that we can make it guess correctly in the future.
!
*windowGravityWorks:		Guess


! By default, the geometries of components (browsers, mail, address book, etc)
! are saved in ~/.netscape/preferences.js.  If this pisses you off, uncomment
! the following line and Netscape will not remember component geometries.
!
! Equivalent to using the '-dont-save-geometry-prefs' startup flag.
!
!*dontSaveGeometryPrefs:		True


! Uncomment the following line to ignore any geometry preferences that
! might have been saved.
!
! Equivalent to using the '-ignore-geometry-prefs' startup flag.
!
!*ignoreGeometryPrefs:			True


! Uncomment the following line to bypass the startup licence page.
!
! Equivalent to using the '-no-about-splash' startup flag.
!
!*noAboutSplash:				True

! Netscape supports session management by default.  Uncomment the following
! line to force it off.
!
! Equivalent to using the '-session-management'
!                         '-no-session-management' startup flags.
!
!*sessionManagement:			False


! Different platforms deal with session management in fundamentally
! different ways.  Toggle this resource if you experience session
! management problems.
!
! IRIX session management is on by default only on SGI systems.  It is also
! available on other platforms and might work with session managers other
! than the IRIX desktop.  To use session management as the IRIX desktop
! expects it, uncomment the following line.
!
! Equivalent to using the '-irix-session-management'
!                         '-no-irix-session-management' startup flags.
!
!*irixSessionManagement:			True


! Uncomment the following line to ignore the alwaysraised, alwayslowered,
! and z-lock JavaScript window.open() attributes.  By default,  Netscape will
! try to force the window stacking to match these attributes.  If you think
! this is the ultimate fascism, uncomment the following line.
!
! Equivalent to using the '-dont-force-window-stacking' startup flag.
!
!*dontForceWindowStacking:		True


! Colors
!
! This resource controls the foreground text color of unfollowed links 
! (links which have not yet been visited.)
!
*linkForeground:			#0000FF

! This resource controls the foreground text color of followed links 
! (links which have already been visited.)
!
*vlinkForeground:			#990066

! This resource controls the foreground text color of activated links 
! (links which are in the process of being clicked upon.)
!
*alinkForeground:			#FF0000

! These resources control the foreground and background colors of text
! which has been selected with the mouse.
!
*selectForeground:			#000000
*selectBackground:			#FFFFCC

! These resources control the foreground and background colors of normal text.
!
*defaultForeground:			#000000
*defaultBackground:			#C0C0C0

! This resource may be used to specify a default background image.  It should
! be a file name or URL pointing to a GIF, JPEG, or XBM image.  If it is blank,
! then the default background color will be used instead.
!
*defaultBackgroundImage:		

! Normally, the user-specified colors and backgrounds will only be used when
! viewing documents which did not specify their own colors and backgrounds.
! If this resource is set to False, then the user-specified colors and
! backgrounds will always be used, regardless of the options specified in 
! the document itself.
!
*documentColorsHavePriority:		True


! Geometry
!
! Here's how you set the default sizes and positions of the Netscape windows:
!
! For the web browser window:   Netscape.Navigator.geometry: =500x700+100-0
! For the mail reader:          Netscape.Mail.geometry: =500x800+200-0
! For the news reader:          Netscape.News.geometry: =500x800+300-0
! For the mail editor:          Netscape.Composition.geometry: =400x600
! For the bookmarks window:     Netscape.Bookmarks.geometry: =300x900-0-0
! For the address book window:  Netscape.AddressBook.geometry: =600x900-300-0
! For the download windows:     Netscape.Download.geometry: =500x200-0-0
!
! In previous versions of Netscape, we suggested setting the geometry on the
! TopLevelShell class; don't do that any more.  It will affect *all* of the
! top-level Netscape windows, including bookmarks and message composition and
! so on, which is probably not what you want.
!
! To set the sizes of the panes and columns in the mail and news windows, 
! change them to the layout you like, and then select "Options/Save Options".
! (To change the fonts in the message lists, search below for the resource
! that begins with "XmLGrid*fontList".)



! Translations
!
! Many of these translations are duplicated on both "Meta" and "Alt", since
! X has this stupid notion that "Meta" and "Alt" are not synonymous, and
! Sun in their infinite wisdom furthers this confusing lossage by both having
! Meta *and* Alt keys on the keyboard, and having the key which is labelled
! Alt generate *META* (the Diamond keys generate Alt.)  All praise Sun!
! All praise the X keyboard model!
!
! And because of the need to do this, we have to do all of the keyboard
! equivalents with "translations" instead of "accelerators", since a menu
! item can only have one accelerator, and in order to make both Meta and Alt
! work we need to give them each two.  All praise Motif!


! Keybindings in the main window which correspond to menu items.
! These are installed on every widget which is a child of our Shell,
! and are not installed on popups/transients.
!
*globalTranslations:			#override					\n\
											\
	Meta ~Ctrl ~Shift<Key>a:		xfeDoCommand(selectAll)				\n\
	 Alt ~Ctrl ~Shift<Key>a:		xfeDoCommand(selectAll)				\n\
	Meta ~Ctrl<Key>B:		xfeDoCommand(openBookmarks)			\n\
	 Alt ~Ctrl<Key>B:		xfeDoCommand(openBookmarks)			\n\
	Meta ~Ctrl<Key>C:		xfeDoCommand(copy)					\n\
	 Alt ~Ctrl<Key>C:		xfeDoCommand(copy)					\n\
		Meta ~Ctrl<Key>D:		undefined-key()				\n\
         Alt ~Ctrl<Key>D:		undefined-key()				\n\
		Meta ~Ctrl<Key>E:		undefined-key()				\n\
         Alt ~Ctrl<Key>E:		undefined-key()				\n\
	Meta ~Ctrl ~Shift<Key>f:		undefined-key()				\n\
	 Alt ~Ctrl ~Shift<Key>f:		undefined-key()				\n\
		Meta ~Ctrl<Key>G:		undefined-key()				\n\
		 Alt ~Ctrl<Key>G:		undefined-key()				\n\
	Meta ~Ctrl<Key>H:		xfeDoCommand(openHistory)			\n\
	 Alt ~Ctrl<Key>H:		xfeDoCommand(openHistory)			\n\
		Meta ~Ctrl<Key>I:		undefined-key()				\n\
		 Alt ~Ctrl<Key>I:		undefined-key()				\n\
		Meta ~Ctrl<Key>J:		undefined-key()				\n\
		 Alt ~Ctrl<Key>J:		undefined-key()				\n\
	Meta ~Ctrl<Key>K:		xfeDoCommand(addBookmark)			\n\
	 Alt ~Ctrl<Key>K:		xfeDoCommand(addBookmark)			\n\
		Meta ~Ctrl<Key>L:		undefined-key()				\n\
		 Alt ~Ctrl<Key>L:		undefined-key()				\n\
	Meta ~Ctrl<Key>m:		xfeDoCommand(composeMessage)		\n\
	 Alt ~Ctrl<Key>m:		xfeDoCommand(composeMessage)		\n\
	Meta ~Ctrl ~Shift<Key>n: xfeDoCommand(openBrowser)			\n\
	 Alt ~Ctrl ~Shift<Key>n: xfeDoCommand(openBrowser)			\n\
	Meta ~Ctrl  Shift<Key>n: xfeDoCommand(newBlank)				\n\
	 Alt ~Ctrl  Shift<Key>n: xfeDoCommand(newBlank)				\n\
		Meta ~Ctrl<Key>O:		undefined-key()				\n\
		 Alt ~Ctrl<Key>O:		undefined-key()				\n\
		Meta ~Ctrl<Key>P:		undefined-key()				\n\
		 Alt ~Ctrl<Key>P:		undefined-key()				\n\
	Meta Shift<Key>Q:		xfeDoCommand(quoteOriginalText)		\n\
	 Alt Shift<Key>Q:		xfeDoCommand(quoteOriginalText)		\n\
	Meta ~Ctrl<Key>Q:		xfeDoCommand(exit)					\n\
	 Alt ~Ctrl<Key>Q:		xfeDoCommand(exit)					\n\
		Meta ~Ctrl<Key>R:		undefined-key()				\n\
		 Alt ~Ctrl<Key>R:		undefined-key()				\n\
	Meta ~Ctrl<Key>S:		xfeDoCommand(saveAs)				\n\
	 Alt ~Ctrl<Key>S:		xfeDoCommand(saveAs)				\n\
		Meta ~Ctrl<Key>T:		undefined-key()				\n\
		 Alt ~Ctrl<Key>T:		undefined-key()				\n\
		Meta ~Ctrl<Key>U:	xfeDoCommand(viewPageSource)\n\
		 Alt ~Ctrl<Key>U:		xfeDoCommand(viewPageSource)\n\
	Meta ~Ctrl<Key>V:		xfeDoCommand(paste)					\n\
	 Alt ~Ctrl<Key>V:		xfeDoCommand(paste)					\n\
	Meta ~Ctrl<Key>W:		xfeDoCommand(close)					\n\
	 Alt ~Ctrl<Key>W:		xfeDoCommand(close)					\n\
	Meta ~Ctrl<Key>X:		xfeDoCommand(cut)					\n\
	 Alt ~Ctrl<Key>X:		xfeDoCommand(cut)					\n\
	Meta ~Ctrl<Key>Y:		xfeDoCommand(paste)					\n\
	 Alt ~Ctrl<Key>Y:		xfeDoCommand(paste)					\n\
		Meta ~Ctrl<Key>Z:		undefined-key()				\n\
		 Alt ~Ctrl<Key>Z:		undefined-key()				\n\
											\
 Meta ~Ctrl ~Shift<Key>1:	xfeDoCommand(openOrBringUpBrowser)	\n\
  Alt ~Ctrl ~Shift<Key>1:	xfeDoCommand(openOrBringUpBrowser)	\n\
 Meta ~Ctrl  Shift<Key>1:	xfeDoCommand(openFolders)			\n\
  Alt ~Ctrl  Shift<Key>1:	xfeDoCommand(openFolders)			\n\
 Meta ~Ctrl ~Shift<Key>2:	xfeDoCommand(openInbox)				\n\
  Alt ~Ctrl ~Shift<Key>2:	xfeDoCommand(openInbox)				\n\
 Meta ~Ctrl  Shift<Key>2:	xfeDoCommand(openAddrBook)			\n\
  Alt ~Ctrl  Shift<Key>2:	xfeDoCommand(openAddrBook)			\n\
	Meta ~Ctrl<Key>3:		xfeDoCommand(openEditor)			\n\
	 Alt ~Ctrl<Key>3:		xfeDoCommand(openEditor)			\n\
	Meta ~Ctrl<Key>4:		xfeDoCommand(openCalendar)			\n\
	 Alt ~Ctrl<Key>4:		xfeDoCommand(openCalendar)			\n\
	Meta ~Ctrl<Key>5:		xfeDoCommand(openConference)		\n\
	 Alt ~Ctrl<Key>5:		xfeDoCommand(openConference)		\n\
	Meta ~Ctrl<Key>7:		xfeDoCommand(openRadio)				\n\
	 Alt ~Ctrl<Key>7:		xfeDoCommand(openRadio)				\n\
											\
	~Meta ~Alt ~Ctrl<Key>Prior:		PageUp()					\n\
	~Meta ~Alt ~Ctrl<Key>Next:		PageDown()					\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:		PageUp()				\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown:	PageDown()				\n\
											\
	~Meta ~Alt ~Ctrl<Key>SunCopy:   xfeDoCommand(copy)			\n\
	~Meta ~Alt ~Ctrl<Key>SunPaste:  xfeDoCommand(paste)			\n\
	~Meta ~Alt ~Ctrl<Key>SunCut:    xfeDoCommand(cut)			\n\
											\
	~Meta ~Alt ~Ctrl ~Shift<Key>osfHelp:		xfeDoCommand(manual)	\n

! These used to be up above.
!	Meta ~Ctrl<Key>Z:		undo()						\n\
!	 Alt ~Ctrl<Key>Z:		undo()						\n\


! These keysyms are apparently an R6ism.
!	~Meta ~Alt ~Ctrl<Key>KP_Prior:		PageUp()				\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Next:		PageDown()				\n\

! Translations in the Navigator window.
*browserGlobalTranslations:		#override			\
	Meta Shift<Key>F:		xfeDoCommand(search)			\n\
	 Alt Shift<Key>F:		xfeDoCommand(search)			\n\
	Meta ~Ctrl ~Shift<Key>f:		xfeDoCommand(findInObject)			\n\
	 Alt ~Ctrl ~Shift<Key>f:		xfeDoCommand(findInObject)			\n\
	Meta ~Ctrl ~Shift<Key>g:		xfeDoCommand(findAgain)				\n\
	 Alt ~Ctrl ~Shift<Key>g:		xfeDoCommand(findAgain)				\n\
    Meta ~Ctrl ~Shift<Key>i: xfeDoCommand(showImages)			\n\
	 Alt ~Ctrl ~Shift<Key>i: xfeDoCommand(showImages)			\n\
	Meta ~Ctrl  Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	 Alt ~Ctrl  Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	Meta ~Ctrl<Key>L:		xfeDoCommand(openPage)				\n\
	 Alt ~Ctrl<Key>L:		xfeDoCommand(openPage)				\n\
	Meta ~Ctrl ~Shift<Key>o: xfeDoCommand(openPage)				\n\
	 Alt ~Ctrl ~Shift<Key>o: xfeDoCommand(openPage)				\n\
	Meta ~Ctrl  Shift<Key>o: xfeDoCommand(openPageChooseFile)	\n\
	 Alt ~Ctrl  Shift<Key>o: xfeDoCommand(openPageChooseFile)	\n\
	Meta ~Ctrl<Key>P:		xfeDoCommand(print)					\n\
	 Alt ~Ctrl<Key>P:		xfeDoCommand(print)					\n\
	Meta ~Ctrl<Key>R:		xfeDoCommand(reload)				\n\
	 Alt ~Ctrl<Key>R:		xfeDoCommand(reload)				\n\
	Meta ~Ctrl<Key>braceleft:		xfeDoCommand(decreaseFont)		\n\
	 Alt ~Ctrl<Key>braceleft:		xfeDoCommand(decreaseFont)		\n\
 	Meta ~Ctrl<Key>braceright:		xfeDoCommand(increaseFont)		\n\
	 Alt ~Ctrl<Key>braceright:		xfeDoCommand(increaseFont)		\n\
											\
	Meta ~Ctrl<Key>osfLeft:		xfeDoCommand(back)				\n\
	 Alt ~Ctrl<Key>osfLeft:		xfeDoCommand(back)				\n\
	Meta ~Ctrl<Key>osfRight:	xfeDoCommand(forward)			\n\
	 Alt ~Ctrl<Key>osfRight:	xfeDoCommand(forward)			\n\
	          <Key>Escape:		xfeDoCommand(stopLoading)		\n\
	          <Key>osfCancel:	xfeDoCommand(stopLoading)		\n

! Translations in the Mail & News window.
! Things here override the global translations (which are loaded first.)
! This changes:
!    Alt+H from "View History" to "Deliver Mail Now"
!    Alt+L from "Open URL" to "Forward Message"
!    Alt+R from "Reload" to "Reply to Sender"
!    Alt+O from "Open File" to undefined
!    Alt+S from "Save As" to undefined
!
! This adds:
!    Alt+Shift+A for "Select Thread"
!    Alt+T for "Get New Mail"
!    Alt+Shift+R for "Reply to All"
!    Alt+D for "Delete Message"
!    Alt+Y for "Redo"
!
! Alt arrow keys select previous/next.
! Alt+Shift arrow keys select previous/next unread.
! Meta+Shift arrow keys select previous/next marked.
!
*mailnewsGlobalTranslations:		#override			\
	<Btn3Down>:				xfeDoPopup()					\n\
	Meta ~Ctrl<Key>D:		xfeDoCommand(deleteFolder)				\n\
	 Alt ~Ctrl<Key>D:		xfeDoCommand(deleteFolder)				\n\
	Meta ~Ctrl<Key>H:		xfeDoCommand(deliverQueuedMessages)		\n\
	 Alt ~Ctrl<Key>H:		xfeDoCommand(deliverQueuedMessages)		\n\
	Meta ~Ctrl Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	 Alt ~Ctrl Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	Meta ~Ctrl<Key>K:		xfeDoCommand(compressFolders)		\n\
	 Alt ~Ctrl<Key>K:		xfeDoCommand(compressFolders)		\n\
	Meta ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
	 Alt ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
	Meta ~Ctrl<Key>T:		xfeDoCommand(getNewMessages)	\n\
	 Alt ~Ctrl<Key>T:		xfeDoCommand(getNewMessages)	\n\
	Meta ~Ctrl<Key>Z:		xfeDoCommand(undo)\n\
     Alt ~Ctrl<Key>Z:       xfeDoCommand(undo)\n\
    <Key>osfUndo:           xfeDoCommand(undo)\n\
         <Key>Escape:		xfeDoCommand(stopLoading)\n

! Translations in the MailNews message and threads windows
! These override globalTranslations.
*messagewinGlobalTranslations:		#override			   	\
	<Btn3Down>:			xfeDoPopup()					\n\
    Alt ~Ctrl Shift<Key>a: xfeDoCommand(selectThread)\n\
   Meta ~Ctrl Shift<Key>a: xfeDoCommand(selectThread)\n\
    Alt Shift ~Ctrl<Key>c:  xfeDoCommand(markAllMessagesRead)\n\
   Meta Shift ~Ctrl<Key>c:  xfeDoCommand(markAllMessagesRead)\n\
    ~Meta ~Alt ~Ctrl<Key>c:	xfeDoCommand(markMessageByDate)\n\
	Meta ~Ctrl<Key>D:	    xfeDoCommand(deleteMessage)			\n\
	 Alt ~Ctrl<Key>D:	    xfeDoCommand(deleteMessage)			\n\
	Meta ~Ctrl Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	 Alt ~Ctrl Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	Meta ~Ctrl Shift<Key>f:	xfeDoCommand(search)	   	\n\
	 Alt ~Ctrl Shift<Key>f:	xfeDoCommand(search)	   	\n\
	Meta ~Ctrl ~Shift<Key>f:		xfeDoCommand(findInObject)			\n\
	 Alt ~Ctrl ~Shift<Key>f:		xfeDoCommand(findInObject)			\n\
	Meta ~Ctrl<Key>G:		xfeDoCommand(findAgain)				\n\
	 Alt ~Ctrl<Key>G:		xfeDoCommand(findAgain)				\n\
    ~Meta ~Alt ~Ctrl<Key>G: xfeDoCommand(nextUnreadCollection)\n\
	Meta ~Ctrl<Key>K:		xfeDoCommand(compressFolders)		\n\
	 Alt ~Ctrl<Key>K:		xfeDoCommand(compressFolders)		\n\
    ~Meta ~Alt ~Ctrl<Key>K:	xfeDoCommand(ignoreThread)\n\
	Meta ~Ctrl ~Shift<Key>l:xfeDoCommand(forwardMessage)       	\n\
	 Alt ~Ctrl ~Shift<Key>l:xfeDoCommand(forwardMessage)	   	\n\
    Meta ~Ctrl Shift<Key>l: xfeDoCommand(forwardMessageQuoted)\n\
     Alt ~Ctrl Shift<Key>l: xfeDoCommand(forwardMessageQuoted)\n\
    ~Meta ~Alt ~Ctrl<Key>L:	xfeDoCommand(markMessageForLater)\n\
  ~Meta ~Alt ~Ctrl ~Shift<Key>n: xfeDoCommand(nextUnreadMessage)		\n\
  ~Meta ~Alt ~Ctrl Shift<Key>n:  xfeDoCommand(nextMessage)		\n\
    ~Meta ~Alt ~Ctrl<Key>M:	xfeDoCommand(markMessageRead)\n\
	Meta ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
	 Alt ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
	Meta ~Ctrl<Key>P:		xfeDoCommand(print)					\n\
	 Alt ~Ctrl<Key>P:		xfeDoCommand(print)					\n\
 ~Meta ~Alt ~Ctrl ~Shift<Key>p: xfeDoCommand(previousUnreadMessage)	\n\
 ~Meta ~Alt ~Ctrl Shift<Key>p:	 xfeDoCommand(previousMessage)	\n\
      Alt ~Ctrl Shift<Key>P:	 xfeDoCommand(previousMessage)	\n\
    :Ctrl<Key>q:        xfeDoCommand(findInObject)\n\
    :Ctrl<Key>s:   xfeDoCommand(findAgain)\n\
	Meta ~Ctrl ~Shift<Key>r:	 xfeDoCommand(replyToSender)	   	\n\
	 Alt ~Ctrl ~Shift<Key>r:	 xfeDoCommand(replyToSender)	   	\n\
	Meta ~Ctrl Shift<Key>r:     xfeDoCommand(replyToAll)	   	\n\
	 Alt ~Ctrl Shift<Key>r:	 xfeDoCommand(replyToAll)	   	\n\
	Meta ~Ctrl<Key>S:		xfeDoCommand(saveMessagesAs)	   	\n\
	 Alt ~Ctrl<Key>S:		xfeDoCommand(saveMessagesAs)	   	\n\
	Meta ~Ctrl<Key>T:		xfeDoCommand(getNewMessages)	   	\n\
	 Alt ~Ctrl<Key>T:		xfeDoCommand(getNewMessages)	   	\n\
    ~Meta ~Alt ~Ctrl<Key>T:xfeDoCommand(nextUnreadThread)		\n\
    ~Meta ~Alt ~Ctrl<Key>U:	xfeDoCommand(markMessageUnread)\n\
    ~Meta ~Alt ~Ctrl<Key>W:	xfeDoCommand(watchThread)\n\
	Meta ~Ctrl<Key>Y:		xfeDoCommand(redo)					\n\
	 Alt ~Ctrl<Key>Y:		xfeDoCommand(redo)					\n\
	Meta ~Ctrl<Key>Z:		xfeDoCommand(undo)					\n\
	 Alt ~Ctrl<Key>Z:		xfeDoCommand(undo)					\n\
									   	\
        <Key>Undo:          xfeDoCommand(undo)\n\
        <Key>osfUndo:       xfeDoCommand(undo)\n\
                                        \
	Meta ~Ctrl ~Shift<Key>Left:	xfeDoCommand(back)		\n\
	Meta ~Ctrl ~Shift<Key>Left:	xfeDoCommand(back)		\n\
	 Alt ~Ctrl ~Shift<Key>osfLeft:	xfeDoCommand(back)		\n\
	 Alt ~Ctrl ~Shift<Key>osfLeft:	xfeDoCommand(back)		\n\
                                        \
	Meta ~Ctrl ~Shift<Key>Right:	xfeDoCommand(forward)		\n\
	 Alt ~Ctrl ~Shift<Key>Right:	xfeDoCommand(forward)		\n\
	Meta ~Ctrl ~Shift<Key>osfRight:xfeDoCommand(forward)		\n\
	 Alt ~Ctrl ~Shift<Key>osfRight:xfeDoCommand(forward)		\n\
                                        \
     Alt ~Ctrl ~Shift<Key>Down:    xfeDoCommand(nextMessage)\n\
    Meta ~Ctrl ~Shift<Key>Down:    xfeDoCommand(nextMessage)\n\
     Alt ~Ctrl ~Shift<Key>osfDown: xfeDoCommand(nextMessage)\n\
    Meta ~Ctrl ~Shift<Key>osfDown: xfeDoCommand(nextMessage)\n\
     Alt ~Ctrl Shift<Key>Down:     xfeDoCommand(nextUnreadMessage)\n\
    Meta ~Ctrl Shift<Key>Down:     xfeDoCommand(nextUnreadMessage)\n\
     Alt ~Ctrl Shift<Key>osfDown:  xfeDoCommand(nextUnreadMessage)\n\
    Meta ~Ctrl Shift<Key>osfDown:  xfeDoCommand(nextUnreadMessage)\n\
	Ctrl Shift<Key>Down:		    xfeDoCommand(nextFlaggedMessage)	\n\
	Ctrl Shift<Key>osfDown:	    xfeDoCommand(nextFlaggedMessage)	\n\
										\
     Alt ~Ctrl ~Shift<Key>Up:      xfeDoCommand(previousMessage)\n\
    Meta ~Ctrl ~Shift<Key>Up:      xfeDoCommand(previousMessage)\n\
     Alt ~Ctrl ~Shift<Key>osfUp:   xfeDoCommand(previousMessage)\n\
    Meta ~Ctrl ~Shift<Key>osfUp:   xfeDoCommand(previousMessage)\n\
     Alt ~Ctrl Shift<Key>Up:       xfeDoCommand(previousUnreadMessage)\n\
    Meta ~Ctrl Shift<Key>Up:       xfeDoCommand(previousUnreadMessage)\n\
     Alt ~Ctrl Shift<Key>osfUp:    xfeDoCommand(previousUnreadMessage)\n\
    Meta ~Ctrl Shift<Key>osfUp:    xfeDoCommand(previousUnreadMessage)\n\
	Ctrl Shift<Key>Up:		        xfeDoCommand(previousFlaggedMessage)\n\
	Ctrl Shift<Key>osfUp:		    xfeDoCommand(previousFlaggedMessage)\n\
                                        \
    :<Key>Delete:  xfeDoCommand(deleteAny)\n\
    :<Key>Delete:  xfeDoCommand(deleteAny)\n\
    :<Key>osfDelete:   xfeDoCommand(deleteAny)\n\
    :<Key>osfDelete:  xfeDoCommand(deleteAny)\n\
                                        \
    ~Meta ~Alt ~Ctrl ~Shift<Key>Return: xfeDoCommand(openSelected)\n\
    ~Meta ~Alt ~Ctrl ~Shift<Key>osfActivate: xfeDoCommand(openSelected)\n\
                                        \
    :~Meta ~Alt<Key>less: xfeDoCommand(markMessageUnread)\n\
    :~Meta ~Alt<Key>greater: xfeDoCommand(nextUnreadCollection)\n\
    :~Meta ~Alt<Key>backslash: xfeDoCommand(nextCollection)\n\
    :~Meta ~Alt<Key>at:xfeDoCommand(showAllHeaders)\n\
    :~Meta ~Alt<Key>numbersign:xfeDoCommand(showNormalHeaders)\n\
    :~Meta ~Alt<Key>dollar:xfeDoCommand(showBriefHeaders)\n\
    :~Meta ~Alt<Key>exclam:xfeDoCommand(rot13Message)\n\
    :~Meta ~Alt<Key>period:xfeDoCommand(markMessages)\n\
    :~Meta ~Alt<Key>asterisk:	xfeDoCommand(expandAll)\n\
    :~Meta ~Alt<Key>plus:		xfeDoCommand(expand)\n\
    :~Meta ~Alt<Key>slash:		xfeDoCommand(collapseAll)\n\
    :~Meta ~Alt<Key>minus:		xfeDoCommand(collapse)\n\
    :Alt <Key>Delete:  	xfeDoCommand(deleteAny)\n\
    :Meta<Key>Delete:  	xfeDoCommand(deleteAny)\n\
    :Alt <Key>osfDelete:	xfeDoCommand(deleteAny)\n\
    :Meta<Key>osfDelete:	xfeDoCommand(deleteAny)\n



! Translations in the MailCompose window.
! These are used instead of globalTranslations.
!
*mailcomposeGlobalTranslations:		#override			\
									\
	<Btn3Down>:			xfeDoPopup()			\n\
	Meta ~Ctrl<Key>D:		xfeDoCommand(delete)				\n\
	 Alt ~Ctrl<Key>D:		xfeDoCommand(delete)				\n\
	Meta ~Ctrl  Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	 Alt ~Ctrl  Shift<Key>i: xfeDoCommand(viewSecurity)			\n\
	Meta ~Ctrl ~Shift<Key>Return:		xfeDoCommand(sendMessageNow)	\n\
	 Alt ~Ctrl ~Shift<Key>Return:		xfeDoCommand(sendMessageNow)	\n\
	Meta ~Ctrl Shift<Key>Return:		xfeDoCommand(sendMessageLater)	\n\
	 Alt ~Ctrl Shift<Key>Return:		xfeDoCommand(sendMessageLater)	\n\
	Meta ~Ctrl<Key>k:		xfeDoCommand(spellCheck)		\n\
	 Alt ~Ctrl<Key>k:		xfeDoCommand(spellCheck)		\n\
	Meta ~Ctrl<Key>j:		xfeDoCommand(showComplPicker)		\n\
	 Alt ~Ctrl<Key>j:		xfeDoCommand(showComplPicker)		\n

! Translations in the AddressOutliner portion of the compose window:
!
! TraverseTranslations are for the recipient text field:
*addressOutlinerTraverseTranslations:	#override	\
:~Ctrl ~Shift <Key>osfDelete: 	TableTraverse(DELETE)	\n\
:~Ctrl ~Shift <Key>Delete:	TableTraverse(DELETE)	\n\
:~Ctrl ~Shift <Key>BackSpace:  TableTraverse(BACKSPACE)\n\
:~Ctrl ~Shift <Key>osfBackSpace:       TableTraverse(BACKSPACE)\n\
~Ctrl ~Shift <Key>osfRight:	TableTraverse(RIGHT)	\n\
~Ctrl ~Shift <Key>osfLeft:	TableTraverse(LEFT)	\n\
<Key>osfInsert:			TableTraverse(INSERT)	\n\
~Ctrl ~Shift <Key>Insert:	TableTraverse(INSERT)	\n\
~Ctrl ~Shift <Key>osfBeginLine: TableTraverse(HOME)	\n\
~Ctrl ~Shift <Key>Home:		TableTraverse(HOME)	\n\
~Ctrl ~Shift <Key>End:		TableTraverse(END)	\n\
~Ctrl ~Shift <Key>osfEndLine: 	TableTraverse(END)	\n\
~Ctrl ~Shift <Key>osfUp:       	TableTraverse(UP)	\n\
~Ctrl ~Shift <Key>osfDown:      TableTraverse(DOWN)	\n\
~Ctrl ~Shift <Key>Tab:          TableTraverse(NEXT)	\n\
~Ctrl Shift <Key>Tab:          	TableTraverse(PREVIOUS)	\n\
	Meta ~Ctrl<Key>D:		xfeDoCommand(autoComplOnOff)		\n\
	 Alt ~Ctrl<Key>D:		xfeDoCommand(autoComplOnOff)		\n

! KeyTranslations are for the To/Cc/etc. field:
*addressOutlinerKeyTranslations:		#override	\
 ~Ctrl ~Shift <Key>osfRight:	TableTraverse(RIGHT)	\n\
~Ctrl ~Shift <Key>osfLeft:	TableTraverse(LEFT)	\n\
~Ctrl ~Shift <Key>osfDelete:	TableTraverse(DELETE)	\n\
~Ctrl ~Shift <Key>Delete:	TableTraverse(DELETE)	\n\
<Key>osfInsert:			TableTraverse(INSERT)	\n\
~Ctrl ~Shift <Key>Insert:	TableTraverse(INSERT)	\n\
~Ctrl ~Shift <Key>osfBeginLine:	TableTraverse(HOME)	\n\
~Ctrl ~Shift <Key>Home:		TableTraverse(HOME)	\n\
~Ctrl ~Shift <Key>End:		TableTraverse(END)	\n\
~Ctrl ~Shift <Key>osfEndLine:	TableTraverse(END)	\n\
~Ctrl ~Shift <Key>osfUp:	TableTraverse(UP)	\n\
~Ctrl ~Shift <Key>osfDown:	TableTraverse(DOWN)	\n\
~Ctrl ~Shift <Key>Tab:		TableTraverse(NEXT)	\n\
~Ctrl Shift <Key>Tab:		TableTraverse(PREVIOUS)	\n\
~Ctrl ~Shift <Key>t:		KeyIn(To:)		\n\
~Ctrl Shift <Key>t:		KeyIn(To:)		\n\
~Ctrl ~Shift <Key>c:		KeyIn(Cc:)		\n\
~Ctrl Shift <Key>c:		KeyIn(Cc:)		\n\
~Ctrl ~Shift <Key>b:		KeyIn(Bcc:)		\n\
~Ctrl Shift <Key>b:		KeyIn(Bcc:)		\n\
~Ctrl ~Shift <Key>n:		KeyIn(Newsgroup:)	\n\
~Ctrl Shift <Key>n:		KeyIn(Newsgroup:)	\n\
~Ctrl ~Shift <Key>f:		KeyIn(Followup-To:)	\n\
~Ctrl Shift <Key>f:		KeyIn(Followup-To:)	\n\
~Ctrl ~Shift <Key>r:		KeyIn(Reply-To:)	\n\
~Ctrl Shift <Key>r:		KeyIn(Reply-To:)	\n

! Translations in the MailNews Search window.
! These are used instead of globalTranslations.
!
*mnsearchGlobalTranslations:          #override                       \
      <Btn3Down>:                     xfeDoPopup()\n\
      Meta ~Ctrl<Key>D:               xfeDoCommand(deleteMessage)\n\
       Alt ~Ctrl<Key>D:               xfeDoCommand(deleteMessage)\n

! Translations in the Bookmarks and Adderssbook window.
! These translations are used instead of globalTranslations.
! None of the key *semantics* of globalTranslations are changed here,
! only the actions bound.  (And inapplicable actions are not present.)
!
*bmGlobalTranslations:			#override			\
	<Btn3Down>:				xfeDoPopup()					\n\
   ~Meta ~Alt ~Ctrl<Key>space:	PageDown()					\n\
	Meta ~Ctrl<Key>D:		xfeDoCommand(delete)			\n\
	 Alt ~Ctrl<Key>D:		xfeDoCommand(delete)			\n\
	Meta ~Ctrl<Key>F:		xfeDoCommand(findInObject)		\n\
	 Alt ~Ctrl<Key>F:		xfeDoCommand(findInObject)		\n\
	Meta ~Ctrl<Key>G:		xfeDoCommand(findAgain)			\n\
	 Alt ~Ctrl<Key>G:		xfeDoCommand(findAgain)			\n\
	Meta ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
	 Alt ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
~Meta ~Alt ~Ctrl  Shift <Key>Up:   xfeDoCommand(moveBookmarkUp)\n\
~Meta ~Alt ~Ctrl  Shift <Key>Down: xfeDoCommand(moveBookmarkDown)\n\
~Meta ~Alt ~Ctrl  Shift <Key>osfUp:   xfeDoCommand(moveBookmarkUp)\n\
~Meta ~Alt ~Ctrl  Shift <Key>osfDown: xfeDoCommand(moveBookmarkDown)\n\
~Meta ~Alt ~Ctrl ~Shift <Key>Up:        LineUp()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>Down:      LineDown()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>osfUp:        LineUp()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>osfDown:      LineDown()	\n\
	~Meta ~Alt ~Ctrl<Key>Prior:		PageUp()					\n\
	~Meta ~Alt ~Ctrl<Key>Next:		PageDown()					\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:		PageUp()				\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown:	PageDown()				\n

*abGlobalTranslations:			#override			\
	<Btn3Down>:				xfeDoPopup()			\n\
	Meta ~Ctrl<Key>D:		xfeDoCommand(abDelete)	\n\
	 Alt ~Ctrl<Key>D:		xfeDoCommand(abDelete)	\n\
	Meta ~Ctrl<Key>Y:		xfeDoCommand(redo)					\n\
	 Alt ~Ctrl<Key>Y:		xfeDoCommand(redo)					\n\
	Meta ~Ctrl<Key>Z:		xfeDoCommand(undo)					\n\
	 Alt ~Ctrl<Key>Z:		xfeDoCommand(undo)					\n\
									   	\
        <Key>Undo:          xfeDoCommand(undo)\n\
        <Key>osfUndo:       xfeDoCommand(undo)\n\
	          <Key>Escape:		xfeDoCommand(stopLoading)		\n\
	          <Key>osfCancel:	xfeDoCommand(stopLoading)		\n

! Translations in the textfield portion of the mailing list view 
!
! TraverseTranslations are for the text field:
*abmlistTraverseTranslations:	#override	\
~Ctrl ~Shift <Key>BackSpace:  TableTraverse(BACKSPACE)\n\
~Ctrl ~Shift <Key>Tab:          TableTraverse(NEXT)	\n\
~Ctrl Shift <Key>Tab:          	TableTraverse(PREVIOUS)	\n

! Translations in the History window.
! These translations are used instead of globalTranslations.
! None of the key *semantics* of globalTranslations are changed here,
! only the actions bound.  (And inapplicable actions are not present.)
!
!	<Btn3Down>:			xfeDoPopup()			\n\
*ghGlobalTranslations:			#override			\
 Meta ~Ctrl<Key>D:		xfeDoCommand(delete)	\n\
  Alt ~Ctrl<Key>D:		xfeDoCommand(delete)	\n\
 Meta ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
  Alt ~Ctrl<Key>O:		xfeDoCommand(openSelected)			\n\
~Meta ~Alt ~Ctrl<Key>space:	PageDown()		\n\
~Meta ~Alt ~Ctrl ~Shift <Key>Up:        LineUp()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>Down:      LineDown()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>osfUp:        LineUp()	\n\
~Meta ~Alt ~Ctrl ~Shift <Key>osfDown:      LineDown()	\n\
	~Meta ~Alt ~Ctrl<Key>Prior:		PageUp()					\n\
	~Meta ~Alt ~Ctrl<Key>Next:		PageDown()					\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:		PageUp()				\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown:	PageDown()				\n

!
! Translations for document source window
*dialogGlobalTranslations:		#override			\n\
									\
	Meta ~Ctrl<Key>W:		xfeDoCommand(close)			\n\
	 Alt ~Ctrl<Key>W:		xfeDoCommand(close)			\n



! Mouse bindings in the HTML display area.
! 
*drawingArea.translations:		#replace			\
	<Btn1Down>:			ArmLink()			\n\
	<Btn2Down>:			ArmLink()			\n\
	~Shift<Btn1Up>:			ActivateLink()			\n\
	~Shift<Btn2Up>:			ActivateLink(new-window)	\
					DisarmLink()			\n\
	Shift<Btn1Up>:			ActivateLink(save-only)		\
					DisarmLink()			\n\
	Shift<Btn2Up>:			ActivateLink(save-only)		\
					DisarmLink()			\n\
	<Btn1Motion>:			DisarmLinkIfMoved()		\n\
	<Btn2Motion>:			DisarmLinkIfMoved()		\n\
	<Btn3Motion>:			DisarmLinkIfMoved()		\n\
	<Motion>:			DescribeLink()			\n\
	<Btn3Down>:			xfeDoPopup()			\n

*drawingArea*XmList.highlightThickness:	2


! Some basic emacs-like bindings for text fields.
!
! "editingTranslations" are merged into all XmText and XmTextField widgets.
! Then, either "multiLinEditingTranslations" or "singleLinEditingTranslations"
! are merged in, depending on whether it is an XmText or XmTextField widget.
! These resources are merged in after "globalTranslations", so it is possible
! for them to override the menu accelerators.
!
! Problems:
!  = I don't understand why the "Ctrl<Key>g" binding does nothing.
!  = I wish things like `C-k C-k C-k C-n C-k C-k C-y' did the right thing.
!  = This doesn't quite do active regions right, in that C-SPC M-f doesn't
!    leave the word highlighted (though it does leave a region set.)
! Basically, XmText is not Emacs, and we therefore exist in a world of pain.
!
!  NOTE: if you're looking here because BackSpace and Delete aren't
!        working the way you think they should, then you need to run
!        xmodmap or xkeycaps to fix your keyboard, or mess read the man
!        page for VirtualBindings(1).  For details, see the Netscape FAQ
!        (available from the Help menu.)
!
*editingTranslations:			#override			\n\
	Meta ~Ctrl<Key>A:		select-all()				\n\
	 Alt ~Ctrl<Key>A:		select-all()				\n\
	~Meta ~Alt Ctrl<Key>a:		beginning-of-line()		\n\
	~Meta ~Alt  Shift Ctrl<Key>a:	beginning-of-line(extend)	\n\
	~Meta ~Alt ~Shift Ctrl<Key>b:	backward-character()		\n\
	~Meta ~Alt  Shift Ctrl<Key>b:	backward-character(extend)	\n\
	~Meta ~Alt        Ctrl<Key>d:	delete-next-character()		\n\
	~Meta ~Alt ~Shift Ctrl<Key>e:	end-of-line()			\n\
	~Meta ~Alt  Shift Ctrl<Key>e:	end-of-line(extend)		\n\
	~Meta ~Alt ~Shift Ctrl<Key>f:	forward-character()		\n\
	~Meta ~Alt  Shift Ctrl<Key>f:	forward-character(extend)	\n\
	~Meta ~Alt        Ctrl<Key>g:	process-cancel()		\n\
	~Meta ~Alt        Ctrl<Key>h:	delete-previous-character()	\n\
	~Meta ~Alt        Ctrl<Key>v:	undefined-key()	\n\
	~Meta ~Alt        Ctrl<Key>space: set-anchor()			\n\
	~Meta ~Alt        Ctrl<Key>2:	set-anchor()			\n\
	~Meta ~Alt        Ctrl<Key>@:	set-anchor()			\n\
									\
	Meta ~Ctrl ~Shift<Key>b:	backward-word()			\n\
	 Alt ~Ctrl ~Shift<Key>b:	backward-word()			\n\
	Meta ~Ctrl  Shift<Key>b:	backward-word(extend)		\n\
	 Alt ~Ctrl  Shift<Key>b:	backward-word(extend)		\n\
	Meta ~Ctrl ~Shift<Key>f:	forward-word()			\n\
	 Alt ~Ctrl ~Shift<Key>f:	forward-word()			\n\
	Meta ~Ctrl  Shift<Key>f:	forward-word(extend)		\n\
	 Alt ~Ctrl  Shift<Key>f:	forward-word(extend)		\n\
	Meta ~Ctrl ~Shift<Key>osfLeft:	backward-word()			\n\
	 Alt ~Ctrl ~Shift<Key>osfLeft:	backward-word()			\n\
	Meta ~Ctrl  Shift<Key>osfLeft:	backward-word(extend)		\n\
	 Alt ~Ctrl  Shift<Key>osfLeft:	backward-word(extend)		\n\
	Meta ~Ctrl ~Shift<Key>osfRight:forward-word()			\n\
	 Alt ~Ctrl ~Shift<Key>osfRight:forward-word()			\n\
	Meta ~Ctrl  Shift<Key>osfRight:forward-word(extend)		\n\
         Alt ~Ctrl  Shift<Key>osfRight:forward-word(extend)\n

!                       <KeyUp>: KeyUpInText()\n
!       Meta ~Ctrl       <Key>w:        copy-clipboard()\n\
!        Alt ~Ctrl       <Key>w:        copy-clipboard()\n\

! Translations that apply only to javascript form element text fields;
! This translation should only be added for text fields that is shown in a
! script page.
! SHOULD NOT apply this translation to any regular motif text field.
! because it will trigger the javascript layout stuff and introduce crash.
*formElemEditingTranslations:            #override\n\
			<KeyUp>: KeyUpInText()\n

! Translations that apply only to single-line fields; see above.
!
! Ctrl-U clears the current line only in single-line fields.  Unix
! command-line weenies expect this, even though everyone knows Ctrl-U
! should mean "prefix argument".
!
! In single-line fields, the various killing commands are really deletion
! commands instead (that is, they don't affect the Clipboard and are not
! undoable with Ctrl-y) because the XmTextField widget does not provide
! kill commands -- only the XmText widget does.  (What the hell is up with
! that...)  Maybe we could get around this by never using XmTextField, and
! only using XmText with editMode set to SINGLE_LINE_EDIT, but that might
! have other unexpected effects...
!
! I thought of making Meta-d be `set-anchor() forward-word() cut-clipboard()',
! but that doesn't work, because forward-word takes the whitespace after the
! word as well, instead of stopping before the whitespace.
!
! Similarly, Ctrl-k can't be implemented with
! `set-anchor() end-of-line(extend) cut-clipboard() delete-selection()'
! because that has the side effect of (temporarily) owning the selection,
! which would make it impossible to: select text in another application;
! type C-k at Netscape; Click middle to paste.  The paste would be impossible
! because C-k would have cleared the selection.
!
*singleLineEditingTranslations:		#override			\n\
	Meta ~Alt ~Ctrl<Key>x:		xfeDoText(cut)	\n\
	Meta ~Alt ~Ctrl<Key>c:		xfeDoText(copy)	\n\
	Meta ~Alt ~Ctrl<Key>v:		xfeDoText(paste)	\n\
	Meta ~Alt ~Ctrl<Key>y:		xfeDoText(paste)	\n\
									\
	~Meta Alt ~Ctrl<Key>x:		xfeDoText(cut)	\n\
	~Meta Alt ~Ctrl<Key>c:		xfeDoText(copy)	\n\
	~Meta Alt ~Ctrl<Key>v:		xfeDoText(paste)	\n\
	~Meta Alt ~Ctrl<Key>y:		xfeDoText(paste)	\n\
                                    \
	~Meta ~Alt Ctrl<Key>y:		xfeDoText(paste)	\n\
                                    \
	~Meta ~Alt ~Ctrl<Key>SunCopy:   xfeDoText(copy)		\n\
	~Meta ~Alt ~Ctrl<Key>SunPaste:  xfeDoText(paste)	\n\
	~Meta ~Alt ~Ctrl<Key>SunCut:    xfeDoText(cut)		\n\
                                    \
	~Meta ~Alt Ctrl<Key>u:		beginning-of-line()		\
					delete-to-end-of-line()		\n\
	~Meta ~Alt Ctrl<Key>k:		delete-to-end-of-line()		\n\
	~Meta ~Alt Ctrl<Key>l:		xfeDoCommand(refresh)			\n\
	~Meta ~Alt Ctrl<Key>w:		key-select()			\
					delete-selection()		\n\
	Meta ~Ctrl       <Key>d:	delete-next-word()		\n\
	 Alt ~Ctrl       <Key>d:	delete-next-word()		\n\
	 Alt ~Ctrl       <Key><:	set-anchor()			\
					beginning-of-line()		\n\
	Meta ~Ctrl       <Key><:	set-anchor()			\
					beginning-of-line()		\n\
 	 Alt ~Ctrl       <Key>>:	set-anchor()			\
					end-of-line()			\n\
	Meta ~Ctrl       <Key>>:	set-anchor()			\
					end-of-line()			\n\
	~Alt  Ctrl       <Key><:	set-anchor()			\
					beginning-of-line(extend)	\n\
   ~Meta  Ctrl       <Key><:	set-anchor()			\
					beginning-of-line(extend)	\n\
	~Alt  Ctrl       <Key>>:	set-anchor()			\
					end-of-line(extend)		\n\
   ~Meta  Ctrl       <Key>>:	set-anchor()			\
					end-of-line(extend)		\n\
	Meta ~Ctrl<Key>osfBackSpace:	delete-previous-word()		\n\
	 Alt ~Ctrl<Key>osfBackSpace:	delete-previous-word()		\n\
	Meta ~Ctrl<Key>osfDelete:	delete-next-word()		\n\
	 Alt ~Ctrl<Key>osfDelete:	delete-next-word()		\n\
									\
	~Meta ~Alt ~Ctrl<Key>osfLeft:	deselect-all()			\
					backward-character()		\n\
	~Meta ~Alt ~Ctrl<Key>osfRight:	deselect-all()			\
					forward-character()		\n

! Translations that apply only to multi-line fields; see above.
! Most of these are here because they are commands that only apply when
! the text area has multiple lines in it, but see above comment about
! "kill" commands versus "delete" commands.
!
! NOTE... [ had to modify the following to prevent overriding paste ]
!
!	Meta ~Ctrl ~Shift<Key>v:	previous-page()			\n\
!	 Alt ~Ctrl ~Shift<Key>v:	previous-page()			\n\
!
*multiLineEditingTranslations:		#override			\n\
	Meta ~Alt ~Ctrl<Key>x:		xfeDoText(cut)	\n\
	Meta ~Alt ~Ctrl<Key>c:		xfeDoText(copy)	\n\
	Meta ~Alt ~Ctrl<Key>v:		xfeDoText(paste)	\n\
	Meta ~Alt ~Ctrl<Key>y:		xfeDoText(paste)	\n\
									\
	~Meta Alt ~Ctrl<Key>x:		xfeDoText(cut)	\n\
	~Meta Alt ~Ctrl<Key>c:		xfeDoText(copy)	\n\
	~Meta Alt ~Ctrl<Key>v:		xfeDoText(paste)	\n\
	~Meta Alt ~Ctrl<Key>y:		xfeDoText(paste)	\n\
									\
	~Meta ~Alt Ctrl<Key>y:		xfeDoText(paste)	\n\
                                    \
	~Meta ~Alt ~Ctrl<Key>SunCopy:   xfeDoText(copy)		\n\
	~Meta ~Alt ~Ctrl<Key>SunPaste:  xfeDoText(paste)	\n\
	~Meta ~Alt ~Ctrl<Key>SunCut:    xfeDoText(cut)		\n\
                                    \
	~Meta ~Alt Ctrl<Key>k:		kill-to-end-of-line()		\n\
	~Meta ~Alt Ctrl<Key>w:		key-select() kill-selection()	\n\
	~Meta ~Alt Ctrl<Key>y:		unkill()			\n\
	Meta ~Ctrl       <Key>d:	kill-next-word()		\n\
	 Alt ~Ctrl       <Key>d:	kill-next-word()		\n\
	~Meta ~Alt        Ctrl<Key>l:	redraw-display() xfeDoCommand(refresh)	\n\
	Meta ~Ctrl<Key>osfBackSpace:	kill-previous-word()		\n\
	 Alt ~Ctrl<Key>osfBackSpace:	kill-previous-word()		\n\
	Meta ~Ctrl<Key>osfDelete:	kill-next-word()		\n\
	 Alt ~Ctrl<Key>osfDelete:	kill-next-word()		\n\
									\
	~Meta ~Alt Ctrl<Key>j:		newline-and-indent()		\n\
	~Meta ~Alt Ctrl<Key>o:		newline-and-backup()		\n\
	~Meta ~Alt ~Shift Ctrl<Key>n:	next-line()			\n\
	~Meta ~Alt  Shift Ctrl<Key>n:	next-line(extend)		\n\
	~Meta ~Alt ~Shift Ctrl<Key>p:	previous-line()			\n\
	~Meta ~Alt  Shift Ctrl<Key>p:	previous-line(extend)		\n\
	~Meta ~Alt ~Shift Ctrl<Key>v:	next-page()			\n\
	~Meta ~Alt  Shift Ctrl<Key>v:	next-page(extend)		\n\
	Meta  Ctrl ~Shift<Key>v:	previous-page()			\n\
	 Alt  Ctrl ~Shift<Key>v:	previous-page()			\n\
	Meta ~Ctrl  Shift<Key>v:	previous-page(extend)		\n\
	 Alt ~Ctrl  Shift<Key>v:	previous-page(extend)		\n\
	 Alt ~Ctrl ~Shift<Key>braceleft:	backward-paragraph()		\n\
	Meta ~Ctrl ~Shift<Key>braceleft:	backward-paragraph()		\n\
	 Alt ~Ctrl  Shift<Key>braceleft:	backward-paragraph(extend)	\n\
	Meta ~Ctrl  Shift<Key>braceleft:	backward-paragraph(extend)	\n\
	 Alt ~Ctrl ~Shift<Key>braceright:	forward-paragraph()		\n\
	Meta ~Ctrl ~Shift<Key>braceright:	forward-paragraph()		\n\
	 Alt ~Ctrl  Shift<Key>braceright:	forward-paragraph(extend)	\n\
	Meta ~Ctrl  Shift<Key>braceright:	forward-paragraph(extend)	\n\
	 Alt ~Ctrl       <Key><:	set-anchor()			\
					beginning-of-file()		\n\
	Meta ~Ctrl       <Key><:	set-anchor()			\
					beginning-of-file()		\n\
 	 Alt ~Ctrl       <Key>>:	set-anchor()			\
					end-of-file()			\n\
	Meta ~Ctrl       <Key>>:	set-anchor()			\
					end-of-file()			\n\
	~Alt  Ctrl       <Key><:	set-anchor()			\
					beginning-of-file(extend)	\n\
       ~Meta  Ctrl       <Key><:	set-anchor()			\
					beginning-of-file(extend)	\n\
	~Alt  Ctrl       <Key>>:	set-anchor()			\
					end-of-file(extend)		\n\
       ~Meta  Ctrl       <Key>>:	set-anchor()			\
					end-of-file(extend)		\n\
	~Meta ~Alt ~Ctrl<Key>Prior:	previous-page()			\n\
	~Meta ~Alt ~Ctrl<Key>Next:	next-page()			\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:	previous-page()			\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown: next-page()			\n\
	Ctrl  <Key>/:			undefined-key()			\n

! Since these get merged in first, all the other bindings override them.
! This is just so that undefined non-self-inserting keys beep.
! (Except that this doesn't really work that well, so nevermind.)
!*XmText.translations:		#override				\
!			Ctrl <Key>:	undefined-key()			\n\
!			Meta <Key>:	undefined-key()			\n\
!			 Alt <Key>:	undefined-key()			\n
!*XmTextField.translations:	#override				\
!			Ctrl <Key>:	undefined-key()			\n\
!			Meta <Key>:	undefined-key()			\n\
!			 Alt <Key>:	undefined-key()			\n


! We merge these translations into all text fields which are not the
! bottommost text field in a dialog box (transient popup.)  This is so that
! hitting `return' in a text field will select the next text field if there
! is one, and will select the "OK" button if there are no more.
!
*nonterminalTextTranslations:	#override				\n\
	<Key>Return:		next-tab-group()			\n\
	<Key>Linefeed:		next-tab-group()			\n

! This is used for self-submitting text fields in HTML forms (not popups.)
! We don't need to store these in to dialog box text fields, since in that
! case we are able to simply avoid storing in the above ones, but we don't
! know that until too late with forms.
*terminalTextTranslations:	#override				\n\
	<Key>Return:		activate()				\n\
	<Key>Linefeed:		activate()				\n

! These translations are installed on every TextField widget in the main tree,
! but *not* on text fields in dialogs, or in the mail composition window
! (that's the difference between this and singleLineEditingTranslations.)
*globalTextFieldTranslations:		#override			\n\
	~Meta ~Alt ~Ctrl<Key>Up:	LineUp()			\n\
	~Meta ~Alt ~Ctrl<Key>Down:	LineDown()			\n\
	~Meta ~Alt ~Ctrl<Key>osfUp:	LineUp()			\n\
	~Meta ~Alt ~Ctrl<Key>osfDown:	LineDown()			\n

! These keysyms are apparently an R6ism.
!	~Meta ~Alt ~Ctrl<Key>KP_Up:	LineUp()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Down:	LineDown()			\n\


! We install these on every widget in the main tree (but not popups) that isn't
! a Text or TextField or List.These, basically, are motion commands that ought
! to apply to the HTML display area unless some text field or List has focus,
! in which case they ought to apply to the text in that text field instead.
! Doesn't all this crap just make you want to hurl?
*globalNonTextTranslations:		#override			\n\
	~Meta ~Alt ~Ctrl<Key>space:	xfeDoCommand(spacebar)		\n\
									  \
	~Meta ~Alt ~Ctrl<Key>Delete:	PageUp()			\n\
	~Meta ~Alt ~Ctrl<Key>BackSpace:	PageUp()			\n\
	~Meta ~Alt ~Ctrl<Key>Up:	LineUp()			\n\
	~Meta ~Alt ~Ctrl<Key>Down:	LineDown()			\n\
	~Meta ~Alt ~Ctrl<Key>Left:	ColumnLeft()			\n\
	~Meta ~Alt ~Ctrl<Key>Right:	ColumnRight()			\n\
									  \
	~Meta ~Alt ~Ctrl<Key>osfDelete:	PageUp()			\n\
	~Meta ~Alt ~Ctrl<Key>osfBackSpace:PageUp()			\n\
	 Meta  Ctrl<Key>g:		fishcam()			\n\
	  Alt  Ctrl<Key>g:		fishcam()			\n\
	 Meta  Ctrl<Key>t:		net_showstatus()		\n\
	  Alt  Ctrl<Key>t:		net_showstatus()		\n\
	~Meta ~Alt ~Ctrl<Key>osfUp:	LineUp()			\n\
	~Meta ~Alt ~Ctrl<Key>osfDown:	LineDown()			\n\
	~Meta ~Alt ~Ctrl<Key>osfLeft:	ColumnLeft()			\n\
	~Meta ~Alt ~Ctrl<Key>osfRight:	ColumnRight()			\n\
									  \
	~Meta ~Alt ~Ctrl<Key>Prior:		PageUp()		\n\
	~Meta ~Alt ~Ctrl<Key>Next:		PageDown()		\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:		PageUp()		\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown:	PageDown()		\n

! These keysyms are apparently an R6ism.
!	~Meta ~Alt ~Ctrl<Key>KP_Up:	LineUp()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Down:	LineDown()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Left:	ColumnLeft()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Right:	ColumnRight()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Prior:	PageUp()			\n\
!	~Meta ~Alt ~Ctrl<Key>KP_Next:	PageDown()			\n\

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Editor mouse translations
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*editorDrawingArea.translations: #replace \
	<Btn3Down>:  xfeDoCommand(showPopup)\n\
	Shift<Btn1Down>:  xfeDoCommand(select,extend)\n\
	<Btn1Down>:  xfeDoClick(single,{,select,grab,}, \
                            double,{,objectIs,text,  {,select,word,}, \
                                              image, {,dialog,image,}, \
                                              hrule, {,dialog,hrule,}, \
                                              target,{,dialog,target,}, \
                                              tag,   {,dialog,tag,},})\n\
	<Btn1Motion>:			xfeDoCommand(select,extend)\n\
	<Btn1Up>:				xfeDoCommand(select,end)		\n\
	<Btn2Down>:				xfeDoCommand(paste,selection)\n\
	<Btn2Motion>:			\n\
	<Btn2Up>:				\n\
	<Motion>:     editor-motion()\n

! Editor keyboard translations.
*editorTranslations:			#override			\n\
									\
	Meta ~Ctrl ~Shift<Key>o: xfeDoCommand(openPage)				\n\
	 Alt ~Ctrl ~Shift<Key>o: xfeDoCommand(openPage)				\n\
	Meta ~Ctrl  Shift<Key>o: xfeDoCommand(openPageChooseFile)	\n\
	 Alt ~Ctrl  Shift<Key>o: xfeDoCommand(openPageChooseFile)	\n\
	Meta ~Ctrl<Key>s:		xfeDoCommand(save)			\n\
	 Alt ~Ctrl<Key>s:		xfeDoCommand(save)			\n\
	Meta ~Ctrl<Key>r:		xfeDoCommand(reload)			\n\
	 Alt ~Ctrl<Key>r:		xfeDoCommand(reload)			\n\
	Meta ~Ctrl Shift<Key>r:	xfeDoCommand(reload,super)			\n\
	 Alt ~Ctrl Shift<Key>r:	xfeDoCommand(reload,super)			\n\
	Meta ~Ctrl<Key>P:		xfeDoCommand(print)				\n\
	 Alt ~Ctrl<Key>P:		xfeDoCommand(print)				\n\
									\
	~Meta ~Alt Ctrl<Key>h:		xfeDoCommand(deleteItem,previous)\n\
	 Meta ~Ctrl ~Shift <Key>Return:		xfeDoCommand(sendMessageNow)	\n\
	 Alt ~Ctrl ~Shift <Key>Return:		xfeDoCommand(sendMessageNow)	\n\
	 Meta ~Ctrl Shift <Key>Return:		xfeDoCommand(sendMessageLater)	\n\
	 Alt ~Ctrl Shift <Key>Return:		xfeDoCommand(sendMessageLater)	\n\
	Meta ~Ctrl<Key>k:		xfeDoCommand(spellCheck)		\n\
	 Alt ~Ctrl<Key>k:		xfeDoCommand(spellCheck)		\n\
	~Meta ~Alt ~Ctrl<Key>Up:	xfeDoCommand(moveCursor,up)		\n\
	~Meta ~Alt ~Ctrl<Key>Down:	xfeDoCommand(moveCursor,down)		\n\
	~Meta ~Alt ~Ctrl<Key>osfUp:	xfeDoCommand(moveCursor,up)		\n\
	~Meta ~Alt ~Ctrl<Key>osfDown:	xfeDoCommand(moveCursor,down)		\n\
	~Meta ~Alt ~Ctrl<Key>osfLeft:	xfeDoCommand(moveCursor,previous)	\n\
	~Meta ~Alt ~Ctrl<Key>osfRight:	xfeDoCommand(moveCursor,next)	\n\
	~Meta ~Alt Ctrl<Key>osfLeft:	xfeDoCommand(moveCursor,previousWord)	\n\
	~Meta ~Alt Ctrl<Key>osfRight:	xfeDoCommand(moveCursor,nextWord)	\n\
									\
	:~Meta ~Alt ~Ctrl<Key>Delete:	xfeDoCommand(deleteItem,next)\n\
	:~Meta ~Alt ~Ctrl<Key>BackSpace:	xfeDoCommand(deleteItem,previous)\n\
	:~Meta ~Alt ~Ctrl<Key>osfDelete:	xfeDoCommand(deleteItem,next)\n\
	:~Meta ~Alt ~Ctrl<Key>osfBackSpace:xfeDoCommand(deleteItem,previous)\n\
									\
    ~Meta ~Alt Ctrl <Key>Home: xfeDoCommand(moveCursor,beginningOfPage)\n\
    ~Meta ~Alt Ctrl <Key>End: xfeDoCommand(moveCursor,endOfPage)	\n\
	~Meta ~Alt Ctrl <Key>osfBeginLine: xfeDoCommand(moveCursor,beginningOfPage)\n\
	~Meta ~Alt Ctrl <Key>osfEndLine: xfeDoCommand(moveCursor,endOfPage)\n\
    ~Meta ~Alt ~Ctrl <Key>Home: xfeDoCommand(moveCursor,beginningOfLine)\n\
    ~Meta ~Alt ~Ctrl <Key>End: xfeDoCommand(moveCursor,endOfLine)	\n\
	~Meta ~Alt ~Ctrl <Key>osfBeginLine: xfeDoCommand(moveCursor,beginOfLine)\n\
	~Meta ~Alt ~Ctrl <Key>osfEndLine: xfeDoCommand(moveCursor,endOfLine)\n\
	~Meta ~Alt ~Ctrl Shift<Key>Return:	xfeDoCommand(insertLineBreak,normal)\n\
	~Meta ~Alt ~Ctrl<Key>Return:	xfeDoCommand(insertReturn)\n\
	~Meta ~Alt ~Ctrl Shift<Key>space: xfeDoCommand(insertNonBreakingSpace)\n\
	~Meta ~Alt ~Ctrl <Key>space:	xfeDoCommand(insertKey)		\n\
	~Meta Alt ~Ctrl <Key>-:   xfeDoCommand(outdent)		\n\
	~Meta Alt ~Ctrl <Key>=:	  xfeDoCommand(indent)		\n\
	Meta ~Alt ~Ctrl <Key>-:   xfeDoCommand(outdent)		\n\
	Meta ~Alt ~Ctrl <Key>=:	  xfeDoCommand(indent)		\n\
									\
	Ctrl ~Shift <Key>Tab:	xfeDoCommand(tab,insert)\n\
	~Ctrl ~Shift<Key>Tab:	xfeDoCommand(tab,forward)\n\
	~Ctrl Shift<Key>Tab:	xfeDoCommand(tab,backward)\n\
									\
	~Meta ~Alt Ctrl<Key>a:	xfeDoCommand(moveCursor,beginningOfLine)\n\
	~Meta ~Alt Ctrl<Key>e:	xfeDoCommand(moveCursor,endOfLine)\n\
	~Meta ~Alt Ctrl<Key>p:	xfeDoCommand(moveCursor,up)			\n\
	~Meta ~Alt Ctrl<Key>n:	xfeDoCommand(moveCursor,down)			\n\
	~Meta ~Alt Ctrl<Key>b:	xfeDoCommand(moveCursor,previous)		\n\
	~Meta ~Alt Ctrl<Key>f:	xfeDoCommand(moveCursor,next)		\n\
	~Meta ~Alt Ctrl<Key>d:	xfeDoCommand(deleteItem,next)	\n\
	~Meta ~Alt Ctrl<Key>k:	xfeDoCommand(deleteItem,endOfLine)\n\
	Meta ~Alt ~Ctrl<Key><:	xfeDoCommand(moveCursor,beginningOfPage)\n\
	Meta ~Alt ~Ctrl<Key>>:	xfeDoCommand(moveCursor,endOfPage)\n\
	~Meta Alt ~Ctrl<Key><:	xfeDoCommand(moveCursor,beginningOfPage)\n\
	~Meta Alt ~Ctrl<Key>>:	xfeDoCommand(moveCursor,endOfPage)\n\
									\
	Meta Shift ~Ctrl<Key>z:	xfeDoCommand(redo)		\n\
	 Alt Shift ~Ctrl<Key>z:	xfeDoCommand(redo)		\n\
	Meta ~Ctrl<Key>z:		xfeDoCommand(undo)		\n\
	 Alt ~Ctrl<Key>z:		xfeDoCommand(undo)		\n\
									\
	Meta ~Alt ~Ctrl<Key>b:	xfeDoCommand(toggleCharacterStyle,bold)\n\
	 ~Meta Alt ~Ctrl<Key>b:	xfeDoCommand(toggleCharacterStyle,bold)\n\
	Meta ~Alt ~Ctrl<Key>i:	xfeDoCommand(toggleCharacterStyle,italic)\n\
	 ~Meta Alt ~Ctrl<Key>i:	xfeDoCommand(toggleCharacterStyle,italic)\n\
	 Meta ~Alt ~Ctrl<Key>u:	xfeDoCommand(toggleCharacterStyle,underline)\n\
	 ~Meta Alt ~Ctrl<Key>u:	xfeDoCommand(toggleCharacterStyle,underline)\n\
	Meta ~Alt ~Ctrl<Key>t:	xfeDoCommand(toggleCharacterStyle,fixed)\n\
	 ~Meta Alt ~Ctrl<Key>t:	xfeDoCommand(toggleCharacterStyle,fixed)\n\
	Meta ~Alt ~Ctrl<Key>k:	xfeDoCommand(setCharacterStyle,none)\n\
	 ~Meta Alt ~Ctrl<Key>k:	xfeDoCommand(setCharacterStyle,none)\n\
									\
	~Meta ~Alt Ctrl<Key>l:	xfeDoCommand(refresh)			\n\
									\
	Meta ~Alt ~Ctrl ~Shift<Key>Up:		xfeDoCommand(setFontSize,increase)\n\
	Meta ~Alt ~Ctrl ~Shift<Key>osfUp:	xfeDoCommand(setFontSize,increase)\n\
	Meta ~Alt ~Ctrl ~Shift<Key>Down:	xfeDoCommand(setFontSize,decrease)\n\
	Meta ~Alt ~Ctrl ~Shift<Key>osfDown:	xfeDoCommand(setFontSize,decrease)\n\
									\
	~Meta ~Alt ~Ctrl<Key>SunCopy:   xfeDoCommand(copy)			\n\
	~Meta ~Alt ~Ctrl<Key>SunPaste:  xfeDoCommand(paste)			\n\
	~Meta ~Alt ~Ctrl<Key>SunCut:    xfeDoCommand(cut)			\n\
									\
	Meta ~Alt ~Ctrl ~Shift<Key>d:	xfeDoCommand(deleteItem)	\n\
	~Meta Alt ~Ctrl ~Shift<Key>d:	xfeDoCommand(deleteItem)	\n\
										\
	Meta ~Alt ~Ctrl ~Shift<Key>f:	xfeDoCommand(findInObject)		\n\
	Meta ~Alt ~Ctrl ~Shift<Key>g:	xfeDoCommand(findAgain)			\n\
	~Meta Alt ~Ctrl ~Shift<Key>f:	xfeDoCommand(findInObject)		\n\
	~Meta Alt ~Ctrl ~Shift<Key>g:	xfeDoCommand(findAgain)			\n\
									\
	Meta ~Ctrl<Key>A:		xfeDoCommand(selectAll)				\n\
	 Alt ~Ctrl<Key>A:		xfeDoCommand(selectAll)				\n\
	Meta ~Ctrl<Key>C:		xfeDoCommand(copy)					\n\
	 Alt ~Ctrl<Key>C:		xfeDoCommand(copy)					\n\
	Meta ~Ctrl<Key>H:		xfeDoCommand(openHistory)			\n\
	 Alt ~Ctrl<Key>H:		xfeDoCommand(openHistory)			\n\
	Meta ~Ctrl<Key>m:		xfeDoCommand(composeMessage)		\n\
	 Alt ~Ctrl<Key>m:		xfeDoCommand(composeMessage)		\n\
	Meta ~Ctrl ~Shift<Key>n: xfeDoCommand(openBrowser)			\n\
	 Alt ~Ctrl ~Shift<Key>n: xfeDoCommand(openBrowser)			\n\
	Meta ~Ctrl  Shift<Key>n: xfeDoCommand(newBlank)				\n\
	 Alt ~Ctrl  Shift<Key>n: xfeDoCommand(newBlank)				\n\
	Meta Shift<Key>Q:		xfeDoCommand(quoteOriginalText)		\n\
	 Alt Shift<Key>Q:		xfeDoCommand(quoteOriginalText)		\n\
	Meta ~Ctrl<Key>Q:		xfeDoCommand(exit)					\n\
	 Alt ~Ctrl<Key>Q:		xfeDoCommand(exit)					\n\
		Meta ~Ctrl<Key>R:		undefined-key()				\n\
		 Alt ~Ctrl<Key>R:		undefined-key()				\n\
	Meta ~Ctrl<Key>V:		xfeDoCommand(paste)					\n\
	 Alt ~Ctrl<Key>V:		xfeDoCommand(paste)					\n\
	Meta ~Ctrl<Key>W:		xfeDoCommand(close)					\n\
	 Alt ~Ctrl<Key>W:		xfeDoCommand(close)					\n\
	Meta ~Ctrl<Key>X:		xfeDoCommand(cut)					\n\
	 Alt ~Ctrl<Key>X:		xfeDoCommand(cut)					\n\
	Meta ~Ctrl<Key>Y:		xfeDoCommand(paste)					\n\
	 Alt ~Ctrl<Key>Y:		xfeDoCommand(paste)					\n\
											\
 Meta ~Ctrl ~Shift<Key>1:	xfeDoCommand(openOrBringUpBrowser)	\n\
  Alt ~Ctrl ~Shift<Key>1:	xfeDoCommand(openOrBringUpBrowser)	\n\
 Meta ~Ctrl  Shift<Key>1:	xfeDoCommand(openFolders)			\n\
  Alt ~Ctrl  Shift<Key>1:	xfeDoCommand(openFolders)			\n\
 Meta ~Ctrl ~Shift<Key>2:	xfeDoCommand(openInbox)				\n\
  Alt ~Ctrl ~Shift<Key>2:	xfeDoCommand(openInbox)				\n\
 Meta ~Ctrl  Shift<Key>2:	xfeDoCommand(openAddrBook)			\n\
  Alt ~Ctrl  Shift<Key>2:	xfeDoCommand(openAddrBook)			\n\
	Meta ~Ctrl<Key>3:		xfeDoCommand(openEditor)			\n\
	 Alt ~Ctrl<Key>3:		xfeDoCommand(openEditor)			\n\
	Meta ~Ctrl<Key>4:		xfeDoCommand(openCalendar)			\n\
	 Alt ~Ctrl<Key>4:		xfeDoCommand(openCalendar)			\n\
	Meta ~Ctrl<Key>5:		xfeDoCommand(openConference)		\n\
	 Alt ~Ctrl<Key>5:		xfeDoCommand(openConference)		\n\
	Meta ~Ctrl<Key>7:		xfeDoCommand(openRadio)				\n\
	 Alt ~Ctrl<Key>7:		xfeDoCommand(openRadio)				\n\
											\
	~Meta ~Alt ~Ctrl<Key>Prior:		PageUp()					\n\
	~Meta ~Alt ~Ctrl<Key>Next:		PageDown()					\n\
	~Meta ~Alt ~Ctrl<Key>osfPageUp:		PageUp()				\n\
	~Meta ~Alt ~Ctrl<Key>osfPageDown:	PageDown()				\n\
											\
	~Meta ~Alt ~Ctrl ~Shift<Key>osfHelp:		xfeDoCommand(manual)	\n\
										\
	~Meta ~Alt ~Ctrl ~Shift<Key>F10:			\n\
	~Meta ~Alt ~Ctrl ~Shift<Key>osfMenuBar:			\n\
								\
	<KeyRelease>:							\n\
	<Key>:			xfeDoCommand(insertKey)			\n\
	<KeyPress>:		xfeDoCommand(insertKey)			\n\
	<KeyUp>:							\n\
	<KeyDown>:		xfeDoCommand(insertKey)			\n

!=============================================================================


! About Translations, Actions, and "-remote" commands:
!
! You can control a running Netscape process externally; you do this by
! issuing a command like "netscape -remote openURL(http://xxx)".
! When Netscape is invoked with the -remote argument, it does not open
! window, but instead connects to and controls an already-existing process.
! This is done using X properties, so the two Netscape processes need not
! be running on the same machine, and need not share a file system.
!
! All of Netscape's action names are the same as its resource names; so, for
! example, if you wanted to know the name of the action that corresponds to
! the "Add Bookmark" menu item, you could look in this file for "Add Bookmark"
! and see that the resource that is set to that string is "addBookmark" -
! that's the name of the Action as well.
!
! You can use Actions in Translation tables in the usual Xt-ish way, but you
! can also invoke them directly via "netscape -remote", like this:
!
!    netscape -remote 'addBookmark()'
!
! That will cause the existing Netscape process to add its current URL to
! the bookmarks, just as if you had selected that menu item.
!
! Please see the document http://home.netscape.com/newsref/std/x-remote.html
! for more information.


!=============================================================================


! You can ask HTTP (Web) servers for documents in your preferred language
! by setting the Accept-Language header. It is a comma-separated list of
! languages or language/region pairs. For example, if you would prefer to
! see documents in French, or, failing that, in American English, you could
! use the following:
!
!   *httpAcceptLanguage: fr, en-US
!
! The following languages and regions are presented to the user:
!
*languageRegionList:				\n\
	Afrikaans [af]				\n\
	Albanian [sq]				\n\
	Basque [eu]				\n\
	Bulgarian [bg]				\n\
	Byelorussian [be]			\n\
	Catalan [ca]				\n\
	Chinese [zh]				\n\
	Chinese/China [zh-CN]			\n\
	Chinese/Taiwan [zh-TW]			\n\
	Croatian [hr]				\n\
	Czech [cs]				\n\
	Danish [da]				\n\
	Dutch [nl]				\n\
	Dutch/Belgium [nl-BE]			\n\
	English [en]				\n\
	English/United Kingdom [en-GB]		\n\
	English/United States [en-US]		\n\
	Faeroese [fo]				\n\
	Finnish [fi]				\n\
	French [fr]				\n\
	French/Belgium [fr-BE]			\n\
	French/Canada [fr-CA]			\n\
	French/France [fr-FR]			\n\
	French/Switzerland [fr-CH]		\n\
	Galician [gl]				\n\
	German [de]				\n\
	German/Austria [de-AT]			\n\
	German/Germany [de-DE]			\n\
	German/Switzerland [de-CH]		\n\
	Greek [el]				\n\
	Hungarian [hu]				\n\
	Icelandic [is]				\n\
	Indonesian [id]				\n\
	Irish [ga]				\n\
	Italian [it]				\n\
	Japanese [ja]				\n\
	Korean [ko]				\n\
	Macedonian [mk]				\n\
	Norwegian [no]				\n\
	Polish [pl]				\n\
	Portuguese [pt]				\n\
	Portuguese/Brazil [pt-BR]		\n\
	Romanian [ro]				\n\
	Russian [ru]				\n\
	Scots Gaelic [gd]			\n\
	Serbian [sr]				\n\
	Slovak [sk]				\n\
	Slovenian [sl]				\n\
	Spanish [es]				\n\
	Spanish/Argentina [es-AR]		\n\
	Spanish/Colombia [es-CO]		\n\
	Spanish/Mexico [ex-MX]			\n\
	Spanish/Spain [es-ES]			\n\
	Swedish [sv]				\n\
	Turkish [tr]				\n\
	Ukrainian [uk]				\n


!=============================================================================
!
!      There's really nothing after this point you should be messing with.
!
!=============================================================================


! Motif drag-and-drop is insanely buggy, and is causing crashes even in
! contexts where it has no business being involved at all.  Let's try
! disabling it globally and see if that helps.
!Netscape*dragInitiatorProtocolStyle:	XmDRAG_NONE
!Netscape*dragReceiverProtocolStyle:	XmDRAG_NONE

! Turn off traversal for sashes.
*XmSash.traversalOn:		False

!
! Label Land
!
*Help.sensitive:			False

! HTML forms "More..." button (options menus)
*drawingArea*moreButton.labelString:	More...

! Bookmarks "More..." cascade button
*bookmarkMoreButton.labelString:		More...

! Mail and news "More..." button
*mailNewsMoreButton.labelString:		More...

!====================================================================
!  Menubar stuff
!====================================================================
!
! The file menus for all the components come first.
! Then the menus are listed on a per component basis.
!

*menuBar.fileMenu.labelString:		File
!*menuBar.fileMenu.mnemonic:		F

*menuBar.editMenu.labelString:		Edit
!*menuBar.editMenu.mnemonic:		E

*menuBar.viewMenu.labelString:		View
!*menuBar.viewMenu.mnemonic:		V

*menuBar.goMenu.labelString:		Go
!*menuBar.goMenu.mnemonic:			G

*menuBar.messageMenu.labelString:	Message
!*menuBar.messageMenu.mnemonic:		M

*menuBar.bookmarkMenu.labelString:	Bookmark
!*menuBar.bookmarkMenu.mnemonic:	B

*menuBar.windowMenuLite.labelString:	Window
!*menuBar.windowMenuLite.mnemonic:		W
*menuBar.windowMenu.labelString:	Communicator
!*menuBar.windowMenu.mnemonic:		C
!*menuBar.windowMenu.fontList:	    -*-helvetica-bold-o-*-*-*-120-*--*-*-iso8859-*

*menuBar.itemMenu.labelString:		Item
!*menuBar.itemMenu.mnemonic:		I

*menuBar.helpMenu.labelString:		Help
!*menuBar.helpMenu.mnemonic:		H

!=======================
!  File Menu - Navigator 
!=======================

*menuBar*newSubmenu.labelString:	New
*menuBar*newSubmenu.mnemonic:		N

! File/New Submenu
*menuBar*openBrowser.labelString:       Navigator Window
*menuBar*openBrowser.mnemonic:          N
*menuBar*openBrowser.acceleratorText:   Alt+N
*openBrowser.documentationString:		\
Create a new browser window for viewing web pages

*composeMessage.mnemonic:		M
*composeMessage.acceleratorText:	Alt+M
*composeMessage.labelString:		Message

! In the three pane view, under the "Message" menu, it should read
! "New Message" and not "Message"
*menuBar*composeMessage.labelString:		New Message

*composeMessage.documentationString:	\
Create a new mail or newsgroup message.
*composeArticle.documentationString:	\
Create a new newsgroup message.

*menuBar*newBlank.labelString:			Blank Page
*menuBar*newBlank.mnemonic:				P
*menuBar*newBlank.acceleratorText:		Alt+Shift+N
*newBlank.documentationString:			Create a new web page.

*menuBar*newTemplate.labelString:		Page From Template...
*menuBar*newTemplate.mnemonic:			T
*newTemplate.documentationString:	\
Use a template to create a new web page.

*menuBar*newWizard.labelString:			Page From Wizard...
*menuBar*newWizard.mnemonic:			W
*newWizard.documentationString:	Use the wizard to create a new web page.
! end File/New Submenu

*menuBar*openPage.labelString:		Open Page...
*menuBar*openPage.mnemonic:			O
*menuBar*openPage.acceleratorText:	Alt+O
*openPage.documentationString:		\
Open a local file or a web page in the current window

*menuBar*recentSubmenu.labelString:	Open Recent...

*menuBar*saveMsg.labelString:       Save
*menuBar*saveMsg.mnemonic:       	S
*menuBar*saveMsg.acceleratorText:   Alt+S
*menuBar*saveAs.labelString:        Save As...
*menuBar*saveMsgAs.labelString:     Save As
*menuBar*saveMsgAs.mnemonic:	    S

*saveAsCmdString:					Save As...
*saveFramesetAsCmdString:			Save Frameset As...
*menuBar*saveAs.mnemonic:           S
*menuBar*saveAs.acceleratorText:    Alt+S
*saveAs.documentationString:		Save a copy of the current page

*menuBar*saveFrameAs.labelString:	Save Frame As...
*menuBar*saveFrameAs.mnemonic:		F
*saveFrameAs.documentationString:	Save a copy of the selected frame

*sendPage.labelString:				Send Page
*sendPage.mnemonic:					d
*sendPage.documentationString:		Send the current page to a recipient

*sendLink.labelString:				Send Link
*sendLink.mnemonic:					k
*sendLink.documentationString:	\
Send current page location to a recipient

*editPageCmdString:		Edit Page
*editFrameCmdString:	Edit Frame
*editPage.labelString:              Edit Page
*editFrameSet.labelString:          Edit Frame Set
*menuBar*editPage.mnemonic:         E
*editPage.documentationString:      Edit the current page or frame set
*menuBar*editFrame.labelString:		Edit Frame
*menuBar*editFrame.mnemonic:		F
*editFrame.documentationString:     Edit the current frame

*menuBar*uploadFile.labelString:	Upload File...
*menuBar*uploadFile.mnemonic:		U
*uploadFile.documentationString: Upload (send) a file to this FTP directory

*menuBar*printSetup.labelString:	Page Setup...
*menuBar*printSetup.mnemonic:		g
*printSetup.documentationString:	Change the printing options

*menuBar*printPreview.labelString:	Print Preview
*menuBar*printPreview.mnemonic:		v
*printPreview.documentationString:	Preview the entire page

*menuBar*print.labelString:			Print...
*printCmdString:					Print...
*printFrameCmdString:				Print Frame...
*menuBar*print.mnemonic:			P
*menuBar*print.acceleratorText:		Alt+P
*print.documentationString:			Print this page

*menuBar*close.labelString:			Close
*menuBar*close.mnemonic:			C
*menuBar*close.acceleratorText:		Alt+W
*close.documentationString:			Close this window

*menuBar*exit.labelString:			Exit
*menuBar*exit.mnemonic:				x
*menuBar*exit.acceleratorText:		Alt+Q
*exit.documentationString:	Close all windows in the application and exit

!===========================
!  File Menu - Page Composer
!===========================

*menuBar*save.labelString:					Save
*menuBar*save.mnemonic:						S
*menuBar*save.acceleratorText:				Alt+S
*save.documentationString:					Save the current page

*Editor*menuBar*saveAs.acceleratorText:

*menuBar*publish.labelString:				Publish...
*menuBar*publish.mnemonic:				    u
*publish.documentationString:	\
Upload current file or directory to a server for public viewing

*menuBar*browsePage.labelString:            Browse Page
*menuBar*browsePage.mnemonic:	            B
*browsePage.documentationString:	\
Open the current file in a new browser window

!=============================
! File Menu - Compose Message
!=============================

*Composition*save.documentationString:	Save the current message

*Composition*toolBar*save*saveAs.labelString: As File...
*Composition*toolBar*save*saveAs.mnemonic: F
*Composition*saveAs.documentationString: Save a copy of the current message

*Composition*menuBar*saveAs.labelString:    File...
*Composition*menuBar*saveAs.mnemonic:       F
*Composition*menuBar*saveAs.acceleratorText:
*Composition*saveAs.documentationString: Save a copy of the current message

*Composition*toolBar*save*saveDraft.labelString: As Draft 
*Composition*toolBar*save*saveDraft.mnemonic: D
*Composition*toolBar*save*saveDraft.documentationString: Save this message in the Drafts folder to send later.

*menuBar*saveDraft.labelString:       		Draft
*menuBar*saveDraft.mnemonic:				D
*saveDraft.documentationString:		Save this message in the Drafts folder to send later.

*Composition*toolBar*save*saveTemplate.labelString: As Template
*Composition*toolBar*save*saveTemplate.mnemonic: T
*Composition*toolBar*save*saveTemplate.documentationString: Save this message in the Templates folder to use again.

*menuBar*saveTemplate.labelString:          Template
*menuBar*saveTemplate.mnemonic:             T
*saveTemplate.labelString:          Template
*saveTemplate.mnemonic:             T
*saveTemplate.documentationString:  	Save this message in the Templates folder to use again.

*menuBar*saveAsMenu.labelString:		        Save As
*menuBar*saveAsMenu.mnemonic:			        A
*menuBar*saveAsMenu.saveMessagesAs.documentationString:		Save As...

*menuBar*saveMessage.labelString:		Save
*menuBar*saveMessage.acceleratorText:		Alt+S
*menuBar*saveMessage.documenationString:	Save this message

*menuBar*sendMessageNow.labelString:		Send Now
*menuBar*sendMessageNow.mnemonic:			d
*sendMessageNow.documentationString:		Send this message now
*menuBar*sendMessageNow.acceleratorText:	Alt+Enter

*menuBar*sendMessageLater.labelString:		Send Later
*menuBar*sendMessageLater.mnemonic:			L
*sendMessageLater.documentationString:		Queue this message for later delivery
*menuBar*sendMessageLater.acceleratorText:	Alt+Shift+Enter

*menuBar*quoteOriginalText.labelString:		Quote Original Message
*menuBar*quoteOriginalText.mnemonic:		Q
*menuBar*quoteOriginalText.acceleratorText:	Alt+Shift+Q
*quoteOriginalText.documentationString:	\
Paste in text from the original page in quoted form

*menuBar*addresseePicker.labelString:		Select Addresses...
*menuBar*addresseePicker.mnemonic:			t
*addresseePicker.documentationString:		Select recipient addresses
*addresseePicker.tipString:			Select addresses

*autoComplOnCmdString:						Do Not Complete Address
*autoComplOffCmdString:						Complete Address

*menuBar*showComplPicker.labelString:		Show Matching Addresses
*menuBar*showComplPicker.mnemonic:		S
*menuBar*showComplPicker.acceleratorText:	Alt+J
*menuBar*autoComplOnOff.acceleratorText:	Alt+D
!*showComplPicker.documentationString:		Show Matching Addresses...
!*showComplPicker.tipString:					Show Matching Addresses...

*menuBar*attach.labelString:				Attach
*menuBar*attach.mnemonic:					A
*attach.documentationString: 				Attach a page or address book card to the current message

*menuBar*showChrome.labelString:            Show
*menuBar*showChrome.mnemonic:               S

*menuBar*floatingTaskBarClose.labelString:  Floating Component Bar

!============================
!  File Menu - Message Center
!============================

*folderPrivileges.labelString:					Privileges
*newFolder.labelString:							New Folder...
*newFolderCmdString:							New Folder...
*newSubFolderCmdString:							New Subfolder...
! sspitzer:  is category used anymore?  what is it?
*newCategoryCmdString:							New Category...
*newNewsgroupCmdString:							New Newsgroup...
*newFolder.mnemonic:							w
*newFolder.documentationString:	\
Create a new mail folder or a new newsgroup

*MailFolder*menuBar*openSelected.labelString: Open
*MailFolder*menuBar*openSelected.mnemonic: O
*MailFolder*menuBar*openSelected.acceleratorText: Alt+O
*MailFolder*menuBar*openSelected.documentationString: \
Open the selected mail folder or newsgroup
*openFolder.labelString: Open
*openFolder.acceleratorText: Alt+O
*openFolder.mnemonic:					O
*openFolder.documentationString: \
Open the selected mail folder or newsgroup

*renameFolder.labelString:			Rename Folder...
*renameFolder.mnemonic:				R
*renameFolder.documentationString:	Change the name of the selected folder

*menuBar*newMsgSubmenu.labelString:			Get Messages
*menuBar*newMsgSubmenu.mnemonic:			G
*newMessage.documentationString:	\
Get new mail and newsgroup messages

! File/Get Messages Submenu
*menuBar*getNewMessages.labelString:       	Get New Messages
*menuBar*getNewMessages.mnemonic: 		M
		
! This label is generated dynamically from the preferences
!*menuBar*getNextNNewMsgs.labelString:       Next 500
*menuBar*getNextNNewMsgs.mnemonic: 			e

*menuBar*synchWithServer.labelString:       Synchronize with Server
*menuBar*synchWithServer.mnemonic: 			S

*menuBar*sendMessagesInOutbox.labelString: Send Unsent Messages
*menuBar*sendMessagesInOutbox.mnemonic: d
*sendMessagesInOutbox.documentationString: \
Send messages in Outbox folder now

*menuBar*updateMessageCount.labelString:	Update Message Counts
*menuBar*updateMessageCount.mnemonic:		U
*updateMessageCount.documentationString:	\
Update number of unread messages

*addNewsgroup.labelString:		Subscribe...
*addNewsgroup.mnemonic:			b
*addNewsgroup.documentationString:		Subscribe...
 
!=============================
!  File Menu - Message Threads
!=============================

*menuBar*openAttachmentsSubmenu.labelString:	Open Attachment
*menuBar*openAttachmentsSubmenu.mnemonic:				O
*openAttachments.documentationString:	\
Open the selected attachment

! File/Open Attachments Submenu is dynamically generated

*editMessage.labelString:				Edit Message as New
*editMessage.mnemonic:					E
*editMessage.documentationString:				Edit the selected message

*menuBar*saveTemplate.labelString:		Template
*menuBar*saveTemplate.mnemonic:			T
*menuBar*saveAsTemplate.labelString:	Template
*menuBar*saveAsTemplate.mnemonic:		T

*menuBar*saveMessagesAs.labelString:	File
*menuBar*saveMessagesAs.mnemonic:	F
*menuBar*saveMessagesAs.acceleratorText:	Alt+S

*MailThread*menuBar*saveMessageAs.labelString:  File
*MailThread*menuBar*saveMessageAs.mnemonic:  F
*MailThread*menuBar*saveMessageAs.acceleratorText:	Alt+S

*menuBar*emptyTrash.mnemonic: y

! labelString is generated dynamically
*menuBar*compressFolders.mnemonic: t

!==========================
!  File Menu - Address Book
!==========================

*addToAddressBook.labelString:	New Card...
*addToAddressBook.mnemonic:		r
!*addToAddressBook.acceleratorText:	Alt+N
*addToAddressBook.documentationString:	\
Create a new address book card entry

*abNewList.labelString:			New List...
*abNewList.mnemonic:			s
*abNewList.documentationString:	\
Create a new address book list

*abNewPAB.labelString:			New Address Book...
*abNewPAB.mnemonic:			A
*abNewPAB.documentationString:	\
Create a new address book 

*abNewLDAPDirectory.labelString: New Directory...
*abNewLDAPDirectory.mnemonic:			D
*abNewLDAPDirectory.documentationString:	\
Create a Directory Server

*menuBar*import.labelString:	Import...
*menuBar*import.mnemonic:		I
*AddressBook*import.documentationString:	\
Import a file into the address book
!
! customized for PAB
!
*AddressBook*menuBar*saveAs.labelString:        Export...
*AddressBook*menuBar*saveAs.mnemonic:        E
*AddressBook*menuBar*toggleNavigationToolbar.labelString: Address Book Toolbar
*AddressBook*menuBar*toggleNavigationToolbar.mnemonic: A
*AddressBook*menuBar*abToggleABPane.labelString: Address Books
*AddressBook*menuBar*abToggleABPane.mnemonic: B

*menuBar*abCall.labelString:	Call
*menuBar*abCall.mnemonic:		l
*abCall.documentationString:	\
Place a call with Netscape Conference 


!
! i18n labels: used in AB search dialog, Message filter dialog, 
! and Search Message dialog
!
!*I18nColon.labelString: will be something like   :
!*I18nFirst.labelString: will be something like   the
!*I18nRest.labelString: will be something like  or/and
!
*I18nColon.labelString: 
*I18nFirst.labelString: 
*I18nRest.labelString: 

!=======================
!  File Menu - Bookmarks
!=======================

*newBookmark.labelString:							New Bookmark...
*bookmarks*menuBar*newBookmark.mnemonic:			w
*newBookmark.documentationString:	\
Create a new bookmark entry

*newFolder.labelString:								New Folder...
*bookmarks*menuBar*newFolder.mnemonic:				F
*bookmarks*newFolder.documentationString:	\
Create a new bookmark folder

*newSeparator.labelString:							New Separator
*bookmarks*menuBar*newSeparator.mnemonic:			S
*bookmarks*newSeparator.documentationString:	\
Create a new separator

*bookmarks*menuBar*openBookmarkFile.labelString:	Open Bookmarks File...
*bookmarks*menuBar*openBookmarkFile.mnemonic:		F
*bookmarks*openBookmarkFile.documentationString:	\
Open a bookmarks file in this window

*bookmarks*menuBar*openSelected.labelString:		Go to Bookmark
*bookmarks*menuBar*openSelected.mnemonic:			k
*bookmarks*openSelected.documentationString:	\
Open the selected bookmark in a browser window

*bookmarks*menuBar*import.labelString:				Import...
*bookmarks*menuBar*import.mnemonic:					I
*bookmarks*import.documentationString:	\
Import another bookmark list into the current list

*bookmarks*menuBar*addToToolbar.labelString:	    Add Selection to Toolbar
*bookmarks*menuBar*addToToolbar.mnemonic:			A
*bookmarks*addToToolbar.documentationString:	\
Add bookmark to the Personal Toolbar

*bookmarks*menuBar*createShortcut.labelString:		Create Shortcut
*bookmarks*menuBar*createShortcut.mnemonic:			t
*bookmarks*createShortcut.documentationString:	\
Create an Internet Shortcut to the selected bookmark

*makeAlias.labelString:				Make Alias
*makeAlias.mnemonic:				M
*makeAlias.documentationString:	\
Make a bookmark alias to the selected bookmark

!=====================
!  File Menu - History
!=====================

*history*menuBar*openSelected.labelString:		Go to Page
*history*menuBar*openSelected.mnemonic:			e
*history*openSelected.documentationString:	\
Open the selected page in a browser window

*history*menuBar*addToToolbar.labelString:		Add Page to Toolbar
*history*menuBar*addToToolbar.mnemonic:			A
*history*addToToolbar.documentationString:	\
Add the selected page to the Personal Toolbar

*history*menuBar*print.labelString:             Print History...

!=======================
!  Edit Menu - Navigator
!=======================
 
*undo.labelString:              Undo
*undo.mnemonic:                 U
*undo.acceleratorText:          Alt+Z
*undo.documentationString:      Undo the previous action
 
*redo.labelString:              Redo
*redo.mnemonic:                 R
*redo.acceleratorText:          Alt+Y
*redo.documentationString:      Redo the next action
 
*cut.labelString:               Cut
*cut.mnemonic:                  t
*cut.acceleratorText:           Alt+X
*cut.documentationString:	\
Cut the selected text and put it on the clipboard
 
*copy.labelString:              Copy
*copy.mnemonic:                 C
*copy.acceleratorText:          Alt+C
*copy.documentationString:	\
Copy the selected text and put it on the clipboard
 
*paste.labelString:             Paste
*paste.mnemonic:                P
*paste.acceleratorText:         Alt+V
*paste.documentationString:		Insert clipboard contents

*delete.labelString:			Delete
*delete.mnemonic:				D
*delete.acceleratorText:		Alt+D
*delete.documentationString:	Delete the selected text
! EditorFrame uses this one
*deleteItem.labelString:        Delete
*deleteItem.mnemonic:           D
*deleteItem.acceleratorText:    Alt+D
*deleteItem.documentationString:Delete the selected text

*selectAll.labelString:                 Select All
*selectAllCmdString:                    Select All
*selectAllInFrameCmdString:				Select All in Frame
*selectAll.mnemonic:					A
*selectAll.acceleratorText:				Alt+A
*selectAll.documentationString:			Select the entire page
! Thread Window Edit/Select pullaside menu
*MailThread*selectAll.labelString:      All
*MailThread*selectAllCmdString:         All
*MailThread*selectAllInFrameCmdString:  All in Frame

*menuBar*findInObject.labelString:		Find in Page...
*Composition*menuBar*findInObject.labelString:	Find...
*MailMsg*menuBar*findInObject.labelString:		Find...
*MailThread*menuBar*findInObject.labelString:	Find...
*findInObjectCmdString:					Find in Page...  
*findInFrameCmdString:					Find in Frame...  

*menuBar*findInObject.mnemonic:         F
*menuBar*findInObject.acceleratorText:	Alt+F
*findInObject.documentationString:		\
Search for text in the current page

*menuBar*findAgain.labelString:			Find Again
*menuBar*findAgain.mnemonic:			g
*menuBar*findAgain.acceleratorText:		Alt+G
*findAgain.documentationString:			Repeat last Find operation

*Navigator*menuBar*search.labelString:	Search Internet
*Navigator*menuBar*search.mnemonic:     I
*Navigator*search.documentationString:	\
Search the Internet for information

*menuBar*searchAddress.labelString:     Search Directory
*menuBar*searchAddress.mnemonic: 	    y
*searchAddress.documentationString:	\
Search a directory to find a person

*menuBar*editPreferences.labelString:   Preferences...
*menuBar*editPreferences.mnemonic:		e
*editPreferences.documentationString:	\
Change user preferences for the application

!===========================
!  Edit Menu - Page Composer
!===========================
 
*deleteTableMenu.labelString:                   Delete Table
!*deleteTableMenu.mnemonic:		                b
*deleteTableMenu.mnemonic:			l

! Edit/Delete Table Submenu

*deleteTable.labelString:                       Table
*deleteTable.mnemonic:                          T
*deleteTable.documentationString:	\
Delete the entire table at current cursor location

! new
*deleteTableRow.labelString:                    Row
*deleteTableRow.mnemonic:                       R
*deleteTableRow.documentationString:	\
Delete the row in the current cursor location

*deleteTableColumn.labelString:                 Column
*deleteTableColumn.mnemonic:                    o
*deleteTableColumn.documentationString:	\
Delete the column in the current cursor location

*deleteTableCell.labelString:                   Cell
*deleteTableCell.mnemonic:                      C
*deleteTableCell.documentationString:	\
Delete the cell in the current cursor location

! end Edit/Delete Table Submenu

*removeLink.labelString:		Remove Link
*removeLink.mnemonic:			k
*removeLinks.labelString:		Remove Links
*menuBar*removeLinks.mnemonic:      R
*removeLinks.documentationString:	\
Remove the link corresponding to the selected text

*selectTable.labelString:                       Select Table
*selectTable.mnemonic:                          b
*selectTable.documentationString:	\
Select the table at the current cursor location

*menuBar*editPageSource.labelString:        HTML Source
*editPageSource.documentationString:	\
Edit the HTML source for the current page

!=============================
!  Edit Menu - Compose Message
!=============================

*menuBar*pasteAsQuoted.labelString:			Paste as Quotation
*menuBar*pasteAsQuoted.mnemonic:			Q
*pasteAsQuoted.documentationString:	\
Paste clipboard contents in quoted form

!============================
!  Edit Menu - Message Center
!============================

*menuBar*search.labelString:            Search Messages...
*menuBar*search.mnemonic:               S
*menuBar*search.acceleratorText:        Alt+Shift+F
*search.documentationString:	Search mail and newsgroup messages

*menuBar*editConfiguration.labelString:	Mail Account
*menuBar*editConfiguration.mnemonic:		M

*menuBar*moderateDiscussion.labelString:	Manage Newsgroups
*menuBar*moderateDiscussion.mnemonic:		N

*menuBar*editMailFilterRules.labelString: Message Filters...
*menuBar*editMailFilterRules.mnemonic:    i
*editMailFilterRules.documentationString:	\
Set rules for filtering mail into folders

*popup*deleteNewsgroup.labelString:		Remove Newsgroup Server
*popup*addNewsgroup.labelString:		Subscribe to Newsgroups...
*newsServerPropsCmdString:  Newsgroup Server Properties
*newsgroupPropsCmdString:	Newsgroup Properties
*folderPropsCmdString:		Properties
*mailServerPropsCmdString:  Mail Server Properties
*menuBar*viewProperties.labelString:	Properties
*menuBar*viewProperties.mnemonic:		s
*viewProperties.documentationString:	\
View mail folder or newsgroup properties

! text generated dynamically
*menuBar*deleteFolder.mnemonic: D
*menuBar*deleteFolder.acceleratorText: Alt+D


!=============================
!  Edit Menu - Message Threads
!=============================

*deleteAny.labelString:		Delete Message
*deleteAny.mnemonic:		D
*deleteAny.acceleratorText:		Alt+D

*selectSubmenu.labelString:				Select
*selectSubmenu.mnemonic:                l


! Edit/Select Submenu

*selectThread.labelString:				Thread
*selectThread.mnemonic:					T
*selectThread.acceleratorText:				Alt+Shift+A

*selectCategory.labelString:			Category
*selectCategory.mnemonic:				C

*selectFlaggedMessages.labelString:		Flagged Messages
*selectFlaggedMessages.mnemonic:			F

*selectAllMessages.labelString:			All Messages
*selectAllMessages.mnemonic:			M

! end Edit/Select Submenu

!==========================
!  Edit Menu - Address Book
!==========================

*menuBar*abDelete.labelString:    	Delete
*menuBar*abDelete.mnemonic:    	D
*menuBar*abDelete.acceleratorText: Del
*abDelete.documentationString:	\
Delete the selected address book entries

*menuBar*abDeleteAllEntries.labelString:    	Delete All Occurrences
*menuBar*abDeleteAllEntries.mnemonic: O

*menuBar*abSearchFor.labelString:     Search for...
*menuBar*abSearchFor.mnemonic:        f

*menuBar*displayHTMLDomainsDialog.labelString:	HTML Domains...
*menuBar*displayHTMLDomainsDialog.mnemonic:		H
*displayHTMLDomainsDialog.documentationString:	\
Edit the list of domains that can receive HTML messages

*AddressBook*menuBar*viewProperties.labelString:	Properties
*AddressBook*menuBar*viewProperties.mnemonic:		s

*viewProperties.documentationString:	\
Place a call with Netscape Conference

*AddressBook**menuBar*selectAll.acceleratorText:

!=======================
!  Edit Menu - Bookmarks
!=======================

*bookmarks*menuBar*findInObject.labelString:		Find in Bookmarks...
*bookmarks*findInObject.documentationString:		\
Find a bookmark in the list

*bookmarkProperties.labelString:			Bookmark Properties
*menuBar*bookmarkProperties.mnemonic:		P
*bookmarkProperties.documentationString:	\
View the properties of the selected bookmark

!=======================
!  Edit Menu - History
!=======================

*history*menuBar*search.labelString:            Search History List
*history*menuBar*search.mnemonic:               H
*history*search.documentationString:	\
Search for one or more items in the History List

!=======================
!  View Menu - Navigator
!=======================

*menuBar*toggleNavigationToolbar.labelString: Navigation Toolbar
*menuBar*toggleNavigationToolbar.mnemonic:	N
*menuBar*toggleNavigationToolbar.documentationString: Show or hide the Navigation toolbar

*menuBar*toggleLocationToolbar.labelString: Location Toolbar
*menuBar*toggleLocationToolbar.mnemonic:	L
*toggleLocationToolbar.documentationString:	Show or hide the Location toolbar

*menuBar*togglePersonalToolbar.labelString:    Personal Toolbar
*menuBar*togglePersonalToolbar.mnemonic:	P
*togglePersonalToolbar.documentationString:	Show or hide the Personal toolbar

*menuBar*increaseFont.labelString:	Increase Font
*menuBar*increaseFont.mnemonic:		F
*menuBar*increaseFont.acceleratorText:	Alt+]
*increaseFont.documentationString:	\
Increase the font size for viewing this page

*menuBar*decreaseFont.labelString:	Decrease Font
*menuBar*decreaseFont.mnemonic:		n
*menuBar*decreaseFont.acceleratorText:	Alt+[
*decreaseFont.documentationString:	\
Decrease the font size for viewing this page

*reload.labelString:				Reload
*reload.mnemonic:					R
*reload.acceleratorText:			Alt+R
! In mail and news reply to sender uses this accelerator
*MailThread*menuBar*reload.acceleratorText:	
*MailMsg*menuBar*reload.acceleratorText:	
*News*menuBar*reload.acceleratorText:	
*reload.documentationString:		Reload the current page

*showImages.labelString:			Show Images
*showImages.mnemonic:				g
*showImages.documentationString:	Show the images in the current page

*refresh.labelString:				Refresh
*refresh.mnemonic:					h
*refresh.documentationString:		Refresh the screen

*stopAnimationsCmdString:			Stop Animations
*stopLoadingCmdString:				Stop Loading
*stopLoading.labelString:			Stop Loading
*stopLoading.mnemonic:				S
*stopLoading.acceleratorText:		ESC
*stopLoading.documentationString:	Stop the current transfer
!xxx need separate doc string for stop animations

*viewPageSource.labelString:		Page Source
*viewPageSource.acceleratorText:    Alt+U
*viewPageSource.documentationString:View the HTML source of the current page

*viewPageInfo.labelString:			Page Info
*viewPageInfo.mnemonic:				I
*viewPageInfo.documentationString:	View information about the current page

*pageServices.labelString:			Page Services
*pageServices.mnemonic:				P
!*pageServices.documentationString:

*menuBar*encodingSubmenu.labelString:	Character Set
*menuBar*encodingSubmenu.mnemonic:		C
*encodingSubmenu.documentationString:	\
Change character encoding of the current page

! View/Encoding Submenu

*latin1EncCmdString:		Western (ISO-8859-1)
*885915EncCmdString:		Western (ISO-8859-15)
*latin2EncCmdString:		Central European (ISO-8859-2)
*Win1250EncCmdString:		Central European (Windows-1250)
*jaAutoEncCmdString:		Japanese (Auto-Detect)
*jaSJISEncCmdString:		Japanese (Shift_JIS)
*jaEUCEncCmdString:			Japanese (EUC-JP)
*twBig5EncCmdString:		Traditional Chinese (Big5)
*twEUCEncCmdString:			Traditional Chinese (EUC-TW)
*gbEUCEncCmdString:			Simplified Chinese (GB2312)
*krEUCEncCmdString:			Korean (Auto-Detect)
*2022krEncCmdString:		Korean (ISO-2022-KR)
*koi8rEncCmdString:			Cyrillic (KOI8-R)
*88595EncCmdString:			Cyrillic (ISO-8859-5)
*Win1251EncCmdString:		Cyrillic (Windows-1251)
*cp866EncCmdString:			Cyrillic (CP-866)
*greekEncCmdString:			Greek (ISO-8859-7)
*Win1253EncCmdString:		Greek (Windows-1253)
*88599EncCmdString:			Turkish (ISO-8859-9)
*unicode_utf8EncCmdString:	Unicode (UTF-8)
*unicode_utf7EncCmdString:	Unicode (UTF-7)
*otherEncCmdString:			User-Defined
*setDefaultDocCSID:			Set Default Character Set
*setDefaultDocumentEncoding.documentationString:	\
Set the Global Default Documentation Encoding

! end View/Encoding Submenu

!==============================
!  View Menu - Page Composer
!==============================

*toggleMenubar.labelString:	Menu bar
*toggleMenubar.documentationString:	\
Show or hide the Menu bar

*Editor*toggleNavigationToolbar.labelString:	Composition toolbar
*Editor*toggleNavigationToolbar.documentationString:	\
Show or hide the Composition toolbar

*toggleFormatToolbar.labelString:	Formatting toolbar
*toggleFormatToolbar.documentationString:	\
Show or hide the Formatting toolbar

*menuBar*toggleParagraphMarks.labelString:		Paragraph Marks
*menuBar*toggleParagraphMarks.mnemonic:			P
*toggleParagraphMarks.documentationString:	\
Show or hide the paragraph marks

!=============================
! View Menu - Compose Message
!=============================

*Composition*menuBar*toggleNavigationToolbar.labelString: Message Toolbar
*Composition*toggleAddressArea.documentationString:	\
Show or hide the Addressing Area
*Composition*toggleAddressArea.tipString:	      Addressing Area
*Composition*toggleAddressArea.mnemonic:	      A
*Composition*toggleAddressArea.labelString:	      Addressing Area

*Composition*toggleNavigationToolbar.labelString:	Message toolbar
*Composition*toggleNavigationToolbar.documentationString:	\
Show or hide the Message toolbar
*Composition*toggleNavigationToolbar.mnemonic:	T

!xxx add Show/Hide Addressing Area

*Composition*menuBar*viewAddresses.labelString:       Address Pane
*Composition*menuBar*viewAddresses.mnemonic:          A
*Composition*viewAddresses.documentationString:	\
View addresses of recipients

*Composition*menuBar*viewAttachments.labelString:     Attachment Pane
*Composition*menuBar*viewAttachments.mnemonic:        t
*viewAttachments.documentationString:	\
View message attachments

*Composition*menuBar*viewOptions.labelString:         Options Pane
*Composition*menuBar*viewOptions.mnemonic:            O
*Composition*viewOptions.documentationString: View message options

!xxx no longer in spec (viewMessageBodyOnly)
*Composition*menuBar*viewMessageBodyOnly.labelString: Message Body Only
*Composition*menuBar*viewMessageBodyOnly.mnemonic:    B
*Composition*viewMessageBodyOnly.documentationString:	\
View the message body and hide the adresses

*Composition*menuBar*wrapLongLines.labelString:       Wrap Long Lines
*Composition*menuBar*wrapLongLines.mnemonic:          W
*Composition*wrapLongLines.documentationString:	\
Wrap long lines when the message is sent

!============================
!  View Menu - Message Center
!============================

*MailFolder*menuBar*toggleNavigationToolbar.labelString: Message Toolbar
*MailFolder*menuBar*toggleNavigationToolbar.mnemonic:	M
*MailFolder*menuBar*toggleNavigationToolbar.documentationString: Show or hide the Folder toolbar

*menuBar*showSubmenu.labelString:   Show
*menuBar*showSubmenu.mnemonic:   w

*MailFolder*toggleNavigationToolbar.documentationString:	\
Show or hide the Message Center toolbar
*MailFolder*toggleNavigationToolbar.mnemonic:	M

*menuBar*moveSubmenu.labelString: Move Folder

!=============================
!  View Menu - Message Threads
!=============================

*MailThread*menuBar*toggleNavigationToolbar.labelString: Message Toolbar
*MailThread*menuBar*toggleNavigationToolbar.documentationString: Show or hide the Message toolbar
*MailThread*toggleNavigationToolbar.mnemonic:	M

*menuBar*toggleMessageExpansion.labelString: Message
*menuBar*toggleMessageExpansion.mnemonic: g
*menuBar*toggleMessageExpansion.documentationString: Show or hide the message.

*menuBar*toggleFolderExpansion.labelString: Folders
*menuBar*toggleFolderExpansion.mnemonic: F
*menuBar*toggleFolderExpansion.documentationString: Show or hide the list of folders.

*menuBar*sortSubmenu.labelString:	Sort
*menuBar*sortSubmenu.mnemonic:		o

! View/Sort Submenu
*menuBar*sortBySubject.labelString:		by Subject
*menuBar*sortBySubject.mnemonic:		S
*menuBar*sortBySender.labelString:		by Sender
*menuBar*sortBySender.mnemonic:			r
*menuBar*sortByDate.labelString:		by Date
*menuBar*sortByDate.mnemonic:			e
*menuBar*sortByFlag.labelString:		by Flag
*menuBar*sortByFlag.mnemonic:			F
*menuBar*sortByPriority.labelString:	by Priority
*menuBar*sortByPriority.mnemonic:		P
*menuBar*sortByThread.labelString:		by Thread
*menuBar*sortByThread.mnemonic:			T
*menuBar*sortBySize.labelString:		by Size
*menuBar*sortBySize.mnemonic:			z
*menuBar*sortByStatus.labelString:		by Status
*menuBar*sortByStatus.mnemonic:			u
*menuBar*sortByUnread.labelString:		by Unread
*menuBar*sortByUnread.mnemonic:			n
*menuBar*sortByMessageNumber.labelString:	by Order Received
*menuBar*sortByMessageNumber.mnemonic:		O
*menuBar*sortForward.labelString:		Ascending
*menuBar*sortForward.mnemonic:			A
*menuBar*sortBackward.labelString:		Descending
*menuBar*sortBackward.mnemonic:			D
! end View/Sort Submenu

*menuBar*expandCollapseSubmenu.labelString:	Expand/Collapse
*menuBar*expandCollapseSubmenu.mnemonic:	x

! View/Expand/Collapse Submenu
*menuBar*expand.labelString:		Expand
*menuBar*expand.mnemonic:			x
*menuBar*expand.acceleratorText:	+
*menuBar*expandAll.labelString:		Expand All
*menuBar*expandAll.mnemonic:		A
*menuBar*expandAll.acceleratorText:	*
*menuBar*collapse.labelString:		Collapse
*menuBar*collapse.mnemonic:			C
*menuBar*collapse.acceleratorText:	-
*menuBar*collapseAll.labelString:	Collapse All
*menuBar*collapseAll.mnemonic:		l
*menuBar*collapseAll.acceleratorText: /
! end View/Expand/Collapse Submenu

*menuBar*threadSubmenu.labelString:	Messages
*menuBar*threadSubmenu.mnemonic:	M

! View/Messages Submenu
*menuBar*viewNew.labelString:			Unread
*menuBar*viewNew.mnemonic:				U
*viewNew.documentationString:	Show only unread messages

*menuBar*viewThreadsWithNew.labelString:Threads with Unread
*menuBar*viewThreadsWithNew.mnemonic:	T
*viewThreadsWithNew.documentationString:	\
Show threads that contain new messages

*menuBar*viewWatchedThreadsWithNew.labelString:	Watched Threads with Unread
*menuBar*viewWatchedThreadsWithNew.mnemonic:	W
*viewWatchedThreadsWithNew.documentationString:	\
Show watched threads that contain new messages

*menuBar*viewAllThreads.labelString:	All
*menuBar*viewAllThreads.mnemonic:		A
*viewAllThreads.documentationString: Show all messages
! end View/Messages Submenu

*menuBar*headersSubmenu.labelString:	Headers
*menuBar*headersSubmenu.mnemonic:	d

! View/Headers Submenu
*menuBar*showAllHeaders.labelString:	All
*menuBar*showAllHeaders.mnemonic:	A
*showAllHeaders.documentationString: Show all headers

*menuBar*showNormalHeaders.labelString:	Normal
*menuBar*showNormalHeaders.mnemonic:	N
*showNormalHeaders.documentationString: Show regular headers
*showBriefHeaders.labelString:	Brief
*menuBar*showBriefHeaders.mnemonic:	B
*menuBar*showBriefHeaders.documentationString: Show brief headers
! end View/Headers Submenu

!xxx nolonger an attachments submenu
*menuBar*attachmentsSubmenu.labelString:	Attachments
*menuBar*attachmentsSubmenu.mnemonic:	n

*menuBar*viewAttachmentsInline.labelString:	View Attachments Inline
*menuBar*viewAttachmentsInline.mnemonic:	A
*viewAttachmentsInline.documentationString:	\
Show attachments in message as inline objects or links

*rot13Message.labelString:				Unscramble (ROT13)
*rot13Message.mnemonic:					U
*rot13Message.documentationString:	\
Unscramble naughty jokes

*wrapLongLines.labelString:				Wrap Long Lines
*wrapLongLines.mnemonic:				p
*wrapLongLines.documentationString:	\
Wrap long lines when displaying message

!============================
!  View Menu - Message Window
!============================


!==========================
!  View Menu - Address Book
!==========================

*AddressBook*toggleNavigationToolbar.documentationString:	\
Show or hide the Address Book toolbar
*AddressBook*toggleNavigationToolbar.mnemonic:	B

*menuBar*abByType.labelString:        	by Type
*menuBar*abByType.mnemonic:				T
*abByType.documentationString:	\
Sort address book entries by type

*menuBar*abByName.labelString:        	by Name
*menuBar*abByName.mnemonic:				N
*abByName.documentationString:	\
Sort address book entries by name

*menuBar*abByEmailAddress.labelString:  by Email Address
*menuBar*abByEmailAddress.mnemonic:		E
*abByEmailAddress.documentationString:	\
Sort address book entries by email address

*menuBar*abByNickName.labelString:    	by Nickname
*menuBar*abByNickName.mnemonic:			k
*abByNickName.documentationString:	\
Sort address book entries by nickname

*menuBar*abByCompany.labelString:    	by Organization
!*menuBar*abByCompany.mnemonic:			O
*abByCompany.documentationString:	\
Sort address book entries by organization

*menuBar*abByLocality.labelString:    	by City
*menuBar*abByLocality.mnemonic:			i
*abByLocality.documentationString:	\
Sort address book entries by city

! shared with other windows
*menuBar*sortAscending.labelString:		Ascending
*menuBar*sortAscending.mnemonic:		A
*AddressBook*menuBar*sortAscending.documentationString:	\
Sort address book entries in ascending order

*menuBar*sortDescending.labelString:	Descending
*menuBar*sortDescending.mnemonic:		D
*AddressBook*sortDescending.documentationString:	\
Sort address book entries in descending order

*menuBar*abVCard.labelString:    		My Address Book Card...
*menuBar*abVCard.mnemonic:    			o
*abVCard.documentationString:	\
Create and edit my address book card

*menuBar*abStopSearch.labelString:     Stop Searching
*menuBar*abStopSearch.mnemonic: S
*menuBar*abStopSearch.acceleratorText: Esc


!=======================
!  View Menu - Bookmarks 
!=======================

bookmarks*menuBar*sortByTitle.labelString:	by Name
bookmarks*menuBar*sortByTitle.mnemonic:		T
bookmarks*sortByTitle.documentationString:	\
Sort bookmarks by name

*menuBar*sortByLocation.labelString:		by Location
*menuBar*sortByLocation.mnemonic:			L
*sortByLocation.documentationString:	\
Sort bookmarks by location

*sortByDateLastVisited.labelString:			by Date Last Visited
*sortByDateLastVisited.mnemonic:			V
*sortByDateLastVisited.documentationString:	\
Sort bookmarks by date last visited

*menuBar*sortByDateCreated.labelString:		by Date Created
*menuBar*sortByDateCreated.mnemonic:		C
*sortByDateCreated.documentationString:	\
Sort bookmarks by date created

*menuBar*moveBookmarkUp.labelString:		Move Up
*menuBar*moveBookmarkUp.mnemonic:			U
*menuBar*moveBookmarkUp.acceleratorText:	Shift+Up
*moveBookmarkUp.documentationString:	\
Move the bookmark up in the list

*menuBar*moveBookmarkDown.labelString:		Move Down
*menuBar*moveBookmarkDown.mnemonic:			w
*menuBar*moveBookmarkDown.acceleratorText:	Shift+Down
*moveBookmarkDown.documentationString:	\
Move the bookmark down in the list

*menuBar*bookmarksWhatsNew.labelString:		Update Bookmarks
*menuBar*bookmarksWhatsNew.mnemonic:		B
*bookmarksWhatsNew.documentationString:	\
Check bookmarks for updates

*setToolbarFolder.labelString:				Set as Toolbar Folder
*setToolbarFolder.mnemonic:					F
*setToolbarFolder.documentationString:	\
Set selected folder as the folder for the Personal Toolbar

*setNewBookmarkFolder.labelString:			Set as Folder for New Bookmarks
*setNewBookmarkFolder.mnemonic:				N
*setNewBookmarkFolder.documentationString:	\
Set selected folder as the folder for adding new bookmarks

*setBookmarkMenuFolder.labelString:			Set as Bookmark Menu
*setBookmarkMenuFolder.mnemonic:			M
*setBookmarkMenuFolder.documentationString:	\
Set selected folder as the folder for the Bookmark menu

!=====================
!  View Menu - History
!=====================

*menuBar*sortByTitle.labelString:			by Title
*menuBar*sortByTitle.mnemonic:				T
*sortByTitle.documentationString:	\
Sort bookmarks by title

*menuBar*sortByDateFirstVisited.labelString:	by Date First Visited
*menuBar*sortByDateFirstVisited.mnemonic:		F
*sortByDateFirstVisited.documentationString:	\
Sort history list by date first visited

*menuBar*sortByExpirationDate.labelString:		by Expiration Date
*menuBar*sortByExpirationDate.mnemonic:			E
*sortByExpirationDate.documentationString:	\
Sort history list by expiration date

*menuBar*sortByVisitCount.labelString:			by Visit Count
*menuBar*sortByVisitCount.mnemonic:				C
*sortByVisitCount.documentationString:	\
Sort history list by visit count

!=====================
!  Go Menu - Navigator
!=====================

*back.labelString:			Back
*back.mnemonic:				B
*back.acceleratorText:		Alt+Left
*back.documentationString:  Return to the previous page in History list

*forward.labelString:		Forward
*forward.mnemonic:			F
*forward.acceleratorText:	Alt+Right
*forward.documentationString: Go to the next page in History list

*menuBar*home.labelString:	Home
*menuBar*home.mnemonic:		H
!xxx dynamic *home.documentationString:

!===========================
!  Go Menu - Message Threads
!===========================

*menuBar*nextSubmenu.labelString:				Next 
*menuBar*nextSubmenu.mnemonic:					N
*menuBar*prevSubmenu.labelString:				Previous
*menuBar*prevSubmenu.mnemonic:					P

*menuBar*nextMessage.labelString:				Message
*menuBar*nextMessage.mnemonic:					M
*menuBar*nextMessage.acceleratorText:			Alt+Down
*nextMessage.documentationString:	\
Go to the next message

*menuBar*nextUnreadMessage.labelString:			Unread Message
*menuBar*nextUnreadMessage.mnemonic:			U
*menuBar*nextUnreadMessage.acceleratorText:		Alt+Shift+Down
*nextUnreadMessage.documentationString:	\
Go to the next unread message

*menuBar*nextFlaggedMessage.labelString:		Flagged Message
*menuBar*nextFlaggedMessage.mnemonic:			F
*nextFlaggedMessage.documentationString:	\
Go to the next flagged message

*menuBar*nextUnreadThread.labelString:			Unread Thread
*menuBar*nextUnreadThread.mnemonic:				T
*menuBar*nextUnreadThread.acceleratorText:		T
*nextUnreadThread.documentationString:	\
Go to the next unread thread

*menuBar*nextCategory.labelString:				Next Category
*menuBar*nextCategory.mnemonic:					C
*nextCategory.documentationString:	\
Go to the next category.

*menuBar*nextUnreadCategory.labelString:		Next Unread Category
*menuBar*nextUnreadCategory.mnemonic:			y
*nextUnreadCategory.documentationString:	\
Go to the next unread category.

*menuBar*nextCollection.mnemonic:				o
*nextCollection.documentationString:	\
Go to the next folder or group.

*menuBar*nextUnreadCollection.mnemonic:			d
*menuBar*nextUnreadCollection.acceleratorText: G
*nextUnreadCollection.documentationString:	\
Go to the next unread folder or group.

*menuBar*previousMessage.labelString:			Message
*menuBar*previousMessage.mnemonic:				M
*menuBar*previousMessage.acceleratorText:		Alt+Up
*previousMessage.documentationString:	\
Go to the previous message

*menuBar*previousUnreadMessage.labelString:		Unread Message
*menuBar*previousUnreadMessage.mnemonic:		U
*menuBar*previousUnreadMessage.acceleratorText:		Alt+Shift+Up
*previousUnreadMessage.documentationString:	\
Go to the previous unread message

*menuBar*previousFlaggedMessage.labelString:	Flagged Message
*menuBar*previousFlaggedMessage.mnemonic:		F
*previousFlaggedMessage.documentationString:	\
Go to the previous flagged message

*menuBar*firstUnreadMessage.labelString:		First Unread Message
*menuBar*firstUnreadMessage.mnemonic:			U

*menuBar*firstFlaggedMessage.labelString:		First Flagged Message
*menuBar*firstFlaggedMessage.mnemonic:			F
*firstFlaggedMessage.documentationString:	\
Go to the first flagged message

*MailThread*back.acceleratorText:		Alt+Left
*MailMsg*back.acceleratorText:			Alt+Left
*MailThread*back.documentationString:	Go back to the last message
*MailMsg*back.documentationString:		Go back to the last message

*MailThread*forward.mnemonic:			w
*MailMsg*forward.mnemonic:				w
*MailThread*forward.acceleratorText:		Alt+Right
*MailMsg*forward.acceleratorText:		Alt+Right
*MailThread*forward.documentationString: Go forward to the next message
*MailMsg*forward.documentationString:	Go forward to the next message

!================================
!  Message Menu - Message Threads
!================================

*menuBar*replySubmenu.labelString:				Reply
*menuBar*replySubmenu.mnemonic:					R
*replySubmenu.documentationString:	\
Reply to one or more recipients.

*menuBar*replyAllSubmenu.labelString:		    Reply to All
*menuBar*replyAllSubmenu.mnemonic:					p
*replySubmenu.documentationString:	\
Reply to one or all recipients.

! Message/Reply Submenu
*replyToSender.labelString:				to Sender Only
*replyToSender.mnemonic:				S
*replyToSender.acceleratorText:			Alt+R
*replyToSender.documentationString:	\
Mail a reply to the sender of the message selected

*replyToAll.labelString:				to Sender and All Recipients
*replyToAll.mnemonic:					S
*replyToAll.acceleratorText:			Alt+Shift+R
*replyToAll.documentationString:	\
Reply to all recipients of the message selected

*replyToNewsgroup.labelString:			to Newsgroup
*replyToNewsgroup.mnemonic:				N
!*replyToNewsgroup.acceleratorText:		Alt+D
*replyToNewsgroup.documentationString:	\
Post a reply to the newsgroup

*replyToSenderAndNewsgroup.labelString:	to Sender And Newsgroup
*replyToSenderAndNewsgroup.mnemonic:	N
!*replyToSenderAndNewsgroup.acceleratorText:	Alt+Shift+D
*replyToSenderAndNewsgroup.documentationString:	\
Post a reply to the newsgroup and mail a reply to the author
! end Message/Reply Submenu

!
*cleanUpDisk.labelString:		Clean Up Disk
*cleanUpDisk.mnemonic:			a
*cleanUpDisk.documentationString:	Purge old news messages
*cleanUpDisk.tipString:			Purge old news messages
*menuBar*forwardSubmenu.labelString: Forward As
*menuBar*forwardSubmenu.mnemonic: o

*menuBar*forwardMessage.labelString:			Forward
*menuBar*forwardMessage.mnemonic:				F
*menuBar*forwardMessage.acceleratorText:		Alt+L
*forwardMessage.documentationString:	\
Forward the selected message.

*menuBar*forwardMessageAttachment.labelString: Attachment
*menuBar*forwardMessageAttachment.mnemonic:    A
*menuBar*forwardMessageAttachment.documentationString: \
Forward the selected message as an attachment.

*menuBar*forwardMessageQuoted.labelString:		Quoted
*menuBar*forwardMessageQuoted.mnemonic:			Q
*menuBar*forwardMessageQuoted.acceleratorText:	Alt+Shift+L
*forwardMessageQuoted.documentationString:	\
Forward the selected message as quoted text.

*menuBar*forwardMessageInLine.labelString:		Inline
*menuBar*forwardMessageInLine.mnemonic:			I
*forwardMessageInLine.documentationString:	\
Forward the selected message inline

*menuBar*fileSubmenu.labelString:				Move Message
*menuBar*fileSubmenu.mnemonic:					M
*fileSubmenu.documentationString:	\
File the selected message to a folder

*menuBar*copySubmenu.labelString:				Copy Message
*menuBar*copySubmenu.mnemonic:					C

*copySubmenu.documentationString:	\
Copy the selected message to a folder

*menuBar*addToABSubmenu.labelString:			Add to Address Book
*menuBar*addToABSubmenu.mnemonic:				A

! Message/Add to Address Book Submenu
*addSenderToAddressBook.labelString:	Add Sender to Address Book
*addSenderToAddressBook.mnemonic:		S
*addSenderToAddressBook.documentationString:	\
Add sender to address book
*addAllToAddressBook.labelString:		All All to Address Book
*addAllToAddressBook.mnemonic:			A
*addAllToAddressBook.documentationString:	\
Add all recipients to address book
! end Message/Add to Address Book Submenu

*menuBar*markSubmenu.labelString:		Mark
*menuBar*markSubmenu.mnemonic:			k

! Message/Mark Submenu

*markMessages.labelString: Flag
*markMessages.mnemonic: F
*markMessages.documentationString: Flag the selected message.

*markMessageRead.labelString:			as Read
*markMessageRead.mnemonic:				R
*markMessageRead.acceleratorText:		M
*markMessageRead.documentationString:	Mark selected messages as read
*markMessageRead.tipString:				Mark messages

*markThreadRead.labelString:			Thread as Read
*markThreadRead.mnemonic:				T
*markThreadRead.documentationString:	\
Mark messages with the same subject as read

*markAllMessagesRead.labelString:		All Read
*markAllMessagesRead.mnemonic:			A
*markAllMessagesRead.acceleratorText:	Alt+Shift+C
*markAllMessagesRead.documentationString:	\
Mark all messages as read

*markMessageByDate.labelString:			by Date...
*markMessageByDate.mnemonic:			D
*markMessageByDate.acceleratorText:		C
*markMessageByDate.documentationString:	\
Catch up in newsgroup and mark selected messages by date

*markMessageForLater.labelString:		for Later
*markMessageForLater.mnemonic:			L
*markMessageForLater.acceleratorText:	L
*markMessageForLater.documentationString:	\
Mark message to be read later
! end Message/Mark Submenu

*menuBar*flagMessage.labelString:		Flag
*menuBar*flagMessage.mnemonic:			F
*flagMessage.documentationString: Flag selected messages

*menuBar*ignoreThread.labelString:		Ignore Thread
*menuBar*ignoreThread.mnemonic:			I
*menuBar*ignoreThread.acceleratorText:		K
*ignoreThread.documentationString: Ignore selected thread

*menuBar*ignoreCategory.labelString:	Ignore Category
*ignoreCategory.documentationString: Ignore selected category

*menuBar*watchThread.labelString:		Watch Thread
*menuBar*watchThread.mnemonic:			W
*menuBar*watchThread.acceleratorText:		W
*watchThread.documentationString:	\
Show when new messages arrive in this thread

! override shared resources
*MailThread*mommy.tipString: Message Center
*MailMsg*mommy.tipString: Open Folder

*MailThread*menuBar*composeMessage.labelString: New Message
*MailThread*menuBar*composeMessage.mnemonic: N
*MailThread*menuBar*composeMessage.acceleratorText: Alt+M

!=============================
!  Insert Menu - Page Composer
!=============================

*menuBar*insert.labelString:				Insert
*menuBar*insertLink.labelString:                Link...
*menuBar*insertLink.mnemonic:                   L
*insertLink.documentationString:		Insert a link

*menuBar*insertTarget.labelString:              Target...
*menuBar*insertTarget.mnemonic:                 T
*insertTarget.documentationString:		Insert a target

*menuBar*insertImage.labelString:               Image...
*menuBar*insertImage.mnemonic:                  I
*insertImage.documentationString:		Insert an image

*insertTableMenu.labelString:                   Table
*insertTableMenu.mnemonic:                      e
*insertTableMenu.documentationString:	\
Insert table at current cursor location

*menuBar*insertHorizontalLine.labelString:      Horizontal Line...
*menuBar*insertHorizontalLine.mnemonic:         o
*insertHorizontalLine.documentationString:	\
Insert horizontal line

*menuBar*insertHtmlTag.labelString:             HTML Tag...
*menuBar*insertHtmlTag.mnemonic:                H
*insertHtmlTag.documentationString:	\
Insert an HTML tab

*menuBar*insertNewLineBreak.labelString:        New Line Break
*menuBar*insertNewLineBreak.mnemonic:           N
*menuBar*insertNewLineBreak.acceleratorText:    Shift+Return
*insertNewLineBreak.documentationString:	\
Insert a new link break at cursor location

*menuBar*insertBreakBelow.labelString:          Break below Image(s)
*menuBar*insertBreakBelow.mnemonic:             B
*insertBreakBelow.documentationString:	\
Insert break to continue text to the left and right 

*menuBar*insertNonBreaking.labelString:         Nonbreaking Space
*menuBar*insertNonBreaking.mnemonic:            S
*menuBar*insertNonBreaking.acceleratorText:     Shift+Space
*insertNonBreaking.documentationString:	\
Insert a non-breaking space character at cursor location 

!=============================
!  Format Menu - Page Composer
!=============================

*menuBar*formatMenu.labelString:            Format
*menuBar*fontStyleMenu.labelString:         Font
*menuBar*fontStyleMenu.mnemonic:            F
*fontStyleMenu.documentationString: Change the font face

*menuBar*characterSizeMenu.labelString:     Size
*menuBar*characterSizeMenu.mnemonic:        z

! Format/Size Submenu
*setFontSizeMinusTwo.labelString:           -2
*setFontSizeMinusTwo.documentationString:	\
Set the relative font size to -2
*setFontSizeMinusOne.labelString:           -1
*setFontSizeMinusOne.documentationString:	\
Set the relative font size to -1
*setFontSizeZero.labelString:               +0
*setFontSizeZero.documentationString:		\
Set the relative font size to +0
*setFontSizePlusOne.labelString:            +1
*setFontSizePlusOne.documentationString:	\
Set the relative font size to +1
*setFontSizePlusTwo.labelString:            +2
*setFontSizePlusTwo.documentationString:	\
Set the relative font size to +2
*setFontSizePlusThree.labelString:          +3
*setFontSizePlusThree.documentationString:	\
Set the relative font size to +3
*setFontSizePlusFour.labelString:           +4
*setFontSizePlusFour.documentationString:	\
Set the relative font size to +4
*setFontSize.labelString:                   Default
*setFontSize.documentationString:			\
Set the relative font size to the default
! end Format/Size Submenu

*menuBar*characterStyleMenu.labelString:	Style
*menuBar*characterStyleMenu.mnemonic:	    S

! Format/Style Submenu
*toggleCharacterStyleBold.labelString:			Bold
*toggleCharacterStyleBold.documentationString:	\
Set the style to Bold <Alt+B>
*toggleCharacterStyleItalic.labelString:		Italic
*toggleCharacterStyleItalic.documentationString:	\
Set the style to Italic <Alt+I>
*toggleCharacterStyleUnderline.labelString:		Underline
*toggleCharacterStyleUnderline.documentationString:	\
Set the style to Underline <Alt+U>
*toggleCharacterStyleFixed.labelString:			Fixed
*toggleCharacterStyleFixed.documentationString:	\
Set the style to Fixed
*toggleCharacterStyleSuperscript.labelString:	Superscript
*toggleCharacterStyleSuperscript.documentationString:	\
Set the style to Superscript
*toggleCharacterStyleSubscript.labelString:		Subscript
*toggleCharacterStyleSubscript.documentationString:	\
Set the style to Subscript
*toggleCharacterStyleStrikethrough.labelString:	Strikethrough
*toggleCharacterStyleStrikethrough.documentationString:	\
Set the style to Strikethrough
*toggleCharacterStyleBlink.labelString:			Blinking
*toggleCharacterStyleBlink.documentationString:	\
Set the style to Blink
! end Format/Style Submenu

*menuBar*characterColorMenu.labelString:    Text Color
*menuBar*characterColorMenu.mnemonic:       C

*menuBar*setCharacterColor.labelString:     Text Color...
*menuBar*setCharacterColor.mnemonic:        C

*menuBar*clearAllStyles.labelString:        Remove All Styles
*menuBar*clearAllStyles.mnemonic:           r
*clearAllStyles.documentationString: Remove all character styles

*menuBar*setTableProperties.labelString:    Table Properties
*menuBar*setTableProperties.mnemonic:       T
*setTableProperties.documentationString: Change table properties

*menuBar*headingStyleMenu.labelString:      Heading
*menuBar*headingStyleMenu.mnemonic:         H

! Format/Heading Submenu
*setParagraphStyleNormal.labelString:       Normal
*setParagraphStyleNormal.documentationString:	\
Set the style to Normal
*setParagraphStyleHeadingOne.labelString:   Heading 1
*setParagraphStyleHeadingOne.documentationString:	\
Set the style to heading 1
*setParagraphStyleHeadingTwo.labelString:   Heading 2
*setParagraphStyleHeadingTwo.documentationString:	\
Set the style to heading 2
*setParagraphStyleHeadingThree.labelString: Heading 3
*setParagraphStyleHeadingThree.documentationString:	\
Set the style to heading 3
*setParagraphStyleHeadingFour.labelString:  Heading 4
*setParagraphStyleHeadingFour.documentationString:	\
Set the style to heading 4
*setParagraphStyleHeadingFive.labelString:  Heading 5
*setParagraphStyleHeadingFive.documentationString:	\
Set the style to heading 5
*setParagraphStyleHeadingSix.labelString:   Heading 6
*setParagraphStyleHeadingSix.documentationString:	\
Set the style to heading 6
! end Format/Heading Submenu

*menuBar*paragraphStyleMenu.labelString:    Paragraph
*menuBar*paragraphStyleMenu.mnemonic:       P

! Format/Paragraph Style Submenu
*setParagraphStyleAddress.labelString:      Address
*setParagraphStyleAddress.documentationString:	\
Set the paragraph style to Address
*setParagraphStyleFormatted.labelString:    Formatted
*setParagraphStyleFormatted.documentationString:	\
Set the paragraph style to Formatted
*setParagraphStyleDescriptionTitle.labelString: Description Title
*setParagraphStyleDescriptionTitle.documentationString:	\
Set the paragraph style to Description Title
*setParagraphStyleDescriptionText.labelString: Description Text
*setParagraphStyleDescriptionText.documentationString:	\
Set the paragraph style to Description Text
! end Format/Paragraph Style Submenu

*menuBar*listStyleMenu.labelString:         List
*menuBar*listStyleMenu.mnemonic:            L

! Format/List Submenu
*setListStyleNone.labelString:              None
*setListStyleNone.documentationString:	\
Remove list style
*setListStyleBulleted.labelString:          Bulleted
*setListStyleBulleted.documentationString:	\
Insert bulletted list
*setListStyleNumbered.labelString:          Numbered
*setListStyleNumbered.documentationString:	\
Insert numbered list
! end Format/List Submenu

*menuBar*indent.labelString:                Increase Indent
*menuBar*indent.mnemonic:                   I
*indent.documentationString:		Increase the indent one level

*menuBar*outdent.labelString:               Decrease Indent
*menuBar*outdent.mnemonic:                  D
*outdent.documentationString:		Decrease the indent one level

*menuBar*setObjectProperties.labelString:   Object Properties
*menuBar*setObjectProperties.mnemonic:      e
*setObjectProperties.documentationString:	\
Change selected object properties

*setPageProperties.labelString:     Page Colors and Properties
*setPageProperties.mnemonic:        g
*setPageProperties.documentationString:	\
Change page properties

*setSaveEncrypted.labelString:     Save Encrypted
*setSaveEncrypted.mnemonic:        E
*setSaveEncrypted.documentationString:	\
Save this File as a Pre-Encrypted File

*menuBar*alignmentStyleMenu.labelString:		Align
*menuBar*alignmentStyleMenu.mnemonic:			A

*setAlignmentStyleLeft.labelString:				Left
*setAlignmentStyleLeft.documentationString:	\
Left-justify the current paragraph
*setAlignmentStyleCenter.labelString:			Center
*setAlignmentStyleCenter.documentationString:	\
Center-justify the current paragraph
*setAlignmentStyleRight.labelString:			Right
*setAlignmentStyleRight.documentationString:	\
Right-justify the current paragraph

!============================
!  Tools Menu - Page Composer
!============================

*menuBar*toolsMenu.labelString:             Tools
*spellCheck.labelString:            Check Spelling...
*spellCheck.acceleratorText:		Alt+K
*spellCheck.mnemonic:			S
*spellCheck.tipString:              Check Spelling
*spellCheck.documentationString:    Check spelling errors in the page
*Composition*spellCheck.documentationString:	\
Check spelling errors in the message

!===================
!  Communicator Menu
!===================

*menuBar*openOrBringUpBrowser.labelString:		Navigator
*menuBar*openOrBringUpBrowser.mnemonic:			N
*menuBar*openOrBringUpBrowser.acceleratorText:	Alt+1
*openOrBringUpBrowser.documentationString:	\
Open a browser window

*menuBar*openInbox.labelString:					Messenger
*menuBar*openInbox.mnemonic:					M
*menuBar*openInbox.acceleratorText:				Alt+2
*openInbox.documentationString:	\
Open the mail window and get new messages

*menuBar*openNewsgroups.labelString:			Newsgroups
*menuBar*openNewsgroups.mnemonic:				g
!*menuBar*openNewsgroups.acceleratorText:		Alt+3
*openNewsgroups.documentationString:	\
Open the list of newsgroups

*menuBar*openEditor.labelString:				Composer
*menuBar*openEditor.mnemonic:					C
*menuBar*openEditor.acceleratorText:			Alt+3
*openEditor.documentationString:	\
Open the web page editor

*menuBar*openConference.labelString:			Conference
*menuBar*openConference.mnemonic:				o
*menuBar*openConference.acceleratorText:		Alt+5
!*openConference.documentationString:	\
!Open the conferencing window

*menuBar*openCalendar.labelString:				Calendar
*menuBar*openCalendar.mnemonic:					r
*menuBar*openCalendar.acceleratorText:			Alt+4
*openCalendar.documentationString:	\
Open the personal calendar window

*menuBar*openRadio.labelString:					Radio
*menuBar*openRadio.mnemonic:					d
*menuBar*openRadio.acceleratorText:				Alt+7
*openRadio.documentationString:	\
Open the radio player 

*menuBar*toggleTaskbarShowing.labelString:				Floating Component Bar
*menuBar*toggleTaskbarShowing.mnemonic:	C
*toggleTaskbarShowing.documentationString:	\
Show or hide the Component Bar

*menuBar*openFolders.labelString:				Message Center
*menuBar*openFolders.mnemonic:					M
!*menuBar*openFolders.acceleratorText:			Alt+Shift+1
*openFolders.documentationString:	\
Open the mail folders and newsgroups window

*menuBar*openAddrBook.labelString:				Address Book
*menuBar*openAddrBook.mnemonic:					A
*menuBar*openAddrBook.acceleratorText:			Alt+Shift+2
*openAddrBook.documentationString:	\
Open the address book

*menuBar*bookmarksSubmenu.labelString:			Bookmarks
*menuBar*bookmarksSubmenu.mnemonic:				B

*menuBar*toolsSubmenu.labelString:			Tools
*menuBar*toolsSubmenu.mnemonic:				T

*menuBar*serverToolsSubmenu.labelString:		Server Tools
*menuBar*serverToolsSubmenu.mnemonic:			S

! Communicator/Bookmarks Submenu
*addBookmark.labelString:						Add Bookmark
*addBookmark.mnemonic:							A
!*addBookmark.acceleratorText:					Alt+K
*addBookmark.documentationString:	\
Add the current page to the Bookmarks list

*menuBar*openBookmarks.labelString:				Edit Bookmarks...
*menuBar*openBookmarks.mnemonic:				E
!*menuBar*openBookmarks.acceleratorText:			Alt+B
*openBookmarks.documentationString:	\
Edit the Bookmarks list

*menuBar*fileBookmarksSubmenu.labelString:      File Bookmark
*menuBar*fileBookmarksSubmenu.mnemonic:	        F
*fileBookmarksSubmenu.documentationString:	\
File the current page in a Bookmarks folder

*menuBar*placesSubmenu.labelString:				Guide
*menuBar*placesSubmenu.mnemonic:				G

! Communicator/Bookmarks/Guide Submenu
*menuBar*inetIndex.labelString:		The Internet
*menuBar*inetIndex.mnemonic:		I

*menuBar*inetWhite.labelString:		People
*menuBar*inetWhite.mnemonic:		P

*menuBar*inetYellow.labelString:	Yellow Pages
*menuBar*inetYellow.mnemonic:		Y

*menuBar*whatsNew.labelString:		What's New?
*menuBar*whatsNew.mnemonic:			N

*menuBar*whatsCool.labelString:		What's Cool?
*menuBar*whatsCool.mnemonic:		C
! end Communicator/Bookmarks/Guide Submenu

! end Communicator/Bookmarks Submenu

*menuBar*openHistory.labelString:				History
*menuBar*openHistory.mnemonic:					H
!*menuBar*openHistory.acceleratorText:			Alt+H
*openHistory.documentationString:		Open the history window

*menuBar*javaConsole.labelString:				Java Console
*menuBar*javaConsole.mnemonic:					J
*javaConsole.documentationString:		Open the Java Console

*menuBar*viewSecurity.labelString:				Security Info
*menuBar*viewSecurity.mnemonic:					S
!*menuBar*viewSecurity.acceleratorText:			Alt+Shift+I
*viewSecurity.documentationString:	\
Show security information for this page

! Communicator/Server Tools Submenu
*menuBar*manageMailingList.labelString:		Mailing Lists
*menuBar*manageMailingList.mnemonic:		L

*managePublicFolders.labelString:	Folder Permissions
*managePublicFolders.mnemonic:		F

! end Communicator/Bookmarks Submenu

!===========
!  Help Menu
!===========

*menuBar*manual.labelString:	Help Contents
*menuBar*manual.mnemonic:		H
*manual.documentationString: Help manual

*menuBar*relnotes.labelString:		Release Notes
*menuBar*relnotes.mnemonic:		R
*relnotes.documentationString:	\
Information about the version of Communicator you are running

*menuBar*productInfo.labelString:	Product Support & Info
*productInfo.documentationString:	\
Product support and information

*menuBar*feedback.labelString:		How to Give Feedback
*menuBar*feedback.mnemonic:		G
*feedback.documentationString:	\
Instructions on how to give feedback about Netscape

*menuBar*intl.labelString:			For International Users
*intl.documentationString:	\
Information on running Netscape for international users

*menuBar*aboutSecurity.labelString:	On Security
*menuBar*aboutSecurity.mnemonic:	O
*aboutSecurity.documentationString:	\
Information regarding security on the Internet

*menuBar*registration.labelString:	Register Now
*menuBar*registration.mnemonic:		I
*registration.documentationString:	\
Product registration

*menuBar*upgrade.labelString:		Software
*menuBar*upgrade.mnemonic:		t
*upgrade.documentationString:	\
Download Netscape software and upgrades

*menuBar*services.labelString:		Netscape Direct

*menuBar*aboutUsenet.labelString:	Netiquette

*menuBar*aboutplugins.labelString:	About Plug-ins
*menuBar*aboutplugins.mnemonic:		P
*aboutplugins.documentationString:	\
Information about your plug-ins

*menuBar*aboutfonts.labelString:	About Font Displayers
*menuBar*aboutfonts.mnemonic:		D

*menuBar*about.labelString:		About Communicator
*menuBar*aboutLite.labelString:		About Navigator
*menuBar*about.mnemonic:		A
*about.documentationString:	\
Show product information, version number, and copyright

!==============
!  end of menus
!==============

! Leftovers, old, and duplicates...

*viewMailFilter.labelString:				Mail Filters

! Mail filter stuff

*filterDialog.dialogTitle:				Message Filters
*filterDialog*form*orderBox*orderLabel.labelString:	Filter\norder
*filterDialog*form*newFilter.labelString:		New...
*filterDialog*form*newFilter.mnemonic:			N
*filterDialog*form*editFilter.labelString:		Edit...
*filterDialog*form*editFilter.mnemonic:			E
*filterDialog*form*delFilter.labelString:		Delete
*filterDialog*form*delFilter.mnemonic:			D
*filterDialog*form*javaScript.labelString:		Java Script
*filterDialog*form*logbtn.labelString:			Log filter use
*filterDialog*form*logbtn.mnemonic:				L
*filterDialog*form*viewLog.labelString:			View Log
*filterDialog*form*viewLog.mnemonic:			V
*filterDialog*form*okbtn.labelString:			OK
*filterDialog*form*cancelbtn.labelString:		Cancel
*filterDialog*form*onserver.labelString:		Filters on Server...
*filterDialog*form*dropdownLabel.labelString:   	Filters for:
*filterDialog*form*outlinerLabel.labelString:\
Filters will be applied in the following order:
*filterDialog*form*frameTitle.labelString:				Description

*editFilterDialog.dialogTitle:	Filter Rules
*editFilterDialog*filterLabel.labelString:	Filter Name:
*editFilterDialog*criteriaFrameTitle.labelString:	Filter Criteria
*editFilterDialog*actionFrameTitle.labelString:	Filter Action

*editFilterDialog*scriptokbtn.labelString: OK
*editFilterDialog*scriptokbtn.alignment: ALIGNMENT_CENTER
*editFilterDialog*scriptcancelbtn.labelString: Cancel
*editFilterDialog*scriptcancelbtn.alignment: ALIGNMENT_CENTER
*editFilterDialog*scripteditbtn.labelString: Edit Script
*editFilterDialog*scripteditbtn.alignment: ALIGNMENT_CENTER

*editFilterDialog*editContainer*commandGrp*more.labelString: 	More
*editFilterDialog*editContainer*commandGrp*more.mnemonic:    	M
*editFilterDialog*editContainer*commandGrp*fewer.labelString: 	Fewer
*editFilterDialog*editContainer*commandGrp*fewer.mnemonic:	F
*editFilterDialog*editContainer*despLabel.labelString: Description:
*editFilterDialog*editContainer*okbtn.labelString: OK
*editFilterDialog*editContainer*cancelbtn.labelString: Cancel
*editFilterDialog*newFolder.labelString: 	New Folder...
*editFilterDialog*newFolder.mnemonic:	 	F
*editHdrBtn.labelString: Customize Headers...

! The Edit headers dialog, for search and filter:
*editHdrDialog.title: Customize Headers
*editHdrDialog*editHdrLabel.labelString: Customize the message headers that you\ncan search for and filter on.
*editHdrDialog*new.labelString: New
*editHdrDialog*edit.labelString: Edit
*editHdrDialog*delete.labelString: Delete

! The New Folder dialog:
*newFolderDialog*dialogTitle: New Folder
*newFolderDialog*name.labelString: Name:
*newFolderDialog*subFolderOf.labelString: Create as a subfolder of:
*newFolderDialog*folderTypeLabel.labelString: \
This server restricts the contents of folders.\n\
What will this folder contain?
*newFolderDialog*foldersOnly.labelString: Folders only.
*newFolderDialog*messagesOnly.labelString: Messages only.


!=============================================================================
! MailCompose menubar
!=============================================================================

! Don't limit these to just menubars or else they won't show up
! in popups.
*setPriority.labelString:			Priority	

*messageActionAskUser.labelString:		Ask Me
*messageActionText.labelString:			Text
*messageActionHTML.labelString:			HTML
*messageActionTextAndHTML.labelString:		Text and HTML

*attachFile.labelString:			File...
*attachFile.mnemonic:				F
*attachWebPage.labelString:			Web Page...
*attachWebPage.mnemonic:			W
*deleteAttachment.labelString:			Delete Attachment
*deleteAttachment.mnemonic:			D
*attachAddressBookCard.labelString:		Personal Card (vCard)
*attachAddressBookCard.mnemonic:		A

! Edit Menu
*menuBar*undoNull.labelString:              Nothing to Undo
*menuBar*undoTyping.labelString:            Undo Typing
*menuBar*undoAddText.labelString:           Undo Add Text
*menuBar*undoDeleteText.labelString:        Undo Delete Text
*menuBar*undoCut.labelString:               Undo Cut
*menuBar*undoPasteText.labelString:         Undo Paste Text
*menuBar*undoPasteHTML.labelString:         Undo Paste HTML
*menuBar*undoPasteHREF.labelString:         Undo Paste HREF
*menuBar*undoChangeAttributes.labelString:  Undo Change Attributes
*menuBar*undoIndent.labelString:            Undo Indent
*menuBar*undoParagraphAlign.labelString:    Undo Align Paragraph
*menuBar*undoMorphContainer.labelString:    Undo Change Paragraph Style
*menuBar*undoInsertHorizRule.labelString:   Undo Insert Horizontal Rule
*menuBar*undoSetHorizRuleData.labelString:  Undo Set Horizontal Rule Data
*menuBar*undoInsertImage.labelString:       Undo Insert Image
*menuBar*undoSetImageData.labelString:      Undo Set Image Data
*menuBar*undoInsertBreak.labelString:       Undo Insert Break
*menuBar*undoChangePageData.labelString:    Undo Change Page Data
*menuBar*undoSetMetaData.labelString:       Undo Set Meta Data
*menuBar*undoDeleteMetaData.labelString:    Undo Delete Meta Data
*menuBar*undoInsertTarget.labelString:      Undo Insert Target
*menuBar*undoSetTargetData.labelString:     Undo Set Target Data
*menuBar*undoInsertUnknownTag.labelString:  Undo Unknown Tag
*menuBar*undoSetUnknownTagData.labelString: Undo Set Unknown Tag Data
*menuBar*undoGroupOfChanges.labelString:    Undo Changes
*menuBar*undoSetListData.labelString:       Undo Set List Data
*menuBar*undoInsertTable.labelString:		Undo Insert Table
*menuBar*undoDeleteTable.labelString:		Undo Delete Table
*menuBar*undoSetTableData.labelString:		Undo Set Table Data
*menuBar*undoInsertTableCaption.labelString: Undo Insert Caption
*menuBar*undoSetTableCaptionData.labelString: Undo Set Caption Data
*menuBar*undoDeleteTableCaption.labelString: Undo Delete Caption
*menuBar*undoInsertTableRow.labelString:	Undo Insert Row
*menuBar*undoSetTableRowData.labelString:	Undo Set Row Data
*menuBar*undoDeleteTableRow.labelString:	Undo Delete Row
*menuBar*undoInsertTableColumn.labelString: Undo Insert Column
*menuBar*undoSetTableCellData.labelString:	Undo Set Cell Data
*menuBar*undoDeleteTableColumn.labelString: Undo Delete Column
*menuBar*undoInsertTableCell.labelString:	Undo Insert Cell
*menuBar*undoDeleteTableCell.labelString:	Undo Delete Cell

*menuBar*redoNull.labelString:              Nothing to Redo
*menuBar*redoTyping.labelString:            Redo Typing
*menuBar*redoAddText.labelString:           Redo Add Text
*menuBar*redoDeleteText.labelString:        Redo Delete Text
*menuBar*redoCut.labelString:               Redo Cut
*menuBar*redoPasteText.labelString:         Redo Paste Text
*menuBar*redoPasteHTML.labelString:         Redo Paste HTML
*menuBar*redoPasteHREF.labelString:         Redo Paste HREF
*menuBar*redoChangeAttributes.labelString:  Redo Change Attributes
*menuBar*redoIndent.labelString:            Redo Indent
*menuBar*redoParagraphAlign.labelString:    Redo Align Paragraph
*menuBar*redoMorphContainer.labelString:    Redo Change Paragraph Style
*menuBar*redoInsertHorizRule.labelString:   Redo Insert Horizontal Rule
*menuBar*redoSetHorizRuleData.labelString:  Redo Set Horizontal Rule Data
*menuBar*redoInsertImage.labelString:       Redo Insert Image
*menuBar*redoSetImageData.labelString:      Redo Set Image Data
*menuBar*redoInsertBreak.labelString:       Redo Insert Break
*menuBar*redoChangePageData.labelString:    Redo Change Page Data
*menuBar*redoSetMetaData.labelString:       Redo Set Meta Data
*menuBar*redoDeleteMetaData.labelString:    Redo Delete Meta Data
*menuBar*redoInsertTarget.labelString:      Redo Insert Target
*menuBar*redoSetTargetData.labelString:     Redo Set Target Data
*menuBar*redoInsertUnknownTag.labelString:  Redo Unknown Tag
*menuBar*redoSetUnknownTagData.labelString: Redo Set Unknown Tag Data
*menuBar*redoGroupOfChanges.labelString:    Redo Changes
*menuBar*redoSetListData.labelString:       Redo Set List Data
*menuBar*redoInsertTable.labelString:		Redo Insert Table
*menuBar*redoDeleteTable.labelString:		Redo Delete Table
*menuBar*redoSetTableData.labelString:		Redo Set Table Data
*menuBar*redoInsertTableCaption.labelString: Redo Insert Caption
*menuBar*redoSetTableCaptionData.labelString: Redo Set Caption Data
*menuBar*redoDeleteTableCaption.labelString: Redo Delete Caption
*menuBar*redoInsertTableRow.labelString:	Redo Insert Row
*menuBar*redoSetTableRowData.labelString:	Redo Set Row Data
*menuBar*redoDeleteTableRow.labelString:	Redo Delete Row
*menuBar*redoInsertTableColumn.labelString: Redo Insert Column
*menuBar*redoSetTableCellData.labelString:	Redo Set Cell Data
*menuBar*redoDeleteTableColumn.labelString: Redo Delete Column
*menuBar*redoInsertTableCell.labelString:	Redo Insert Cell
*menuBar*redoDeleteTableCell.labelString:	Redo Delete Cell
! new


! View Menu
*Editor*menuBar*source.labelString:		        View Document Source
*Editor*menuBar*source.mnemonic:                S
*menuBar*editSource.labelString:			Edit Document Source
*menuBar*editSource.mnemonic:		            E
*menuBar*paragraphMarks.labelString:		Display Paragraph Marks
*menuBar*paragraphMarks.mnemonic:		        P
!*displayTableBoundaries.labelString:           Display Table Boundaries
*displayTables.labelString:                     Display Tables
*displayTables.mnemonic:                        T
! new
*menuBar*toggleComposeToolbar.labelString:		Compose Toolbar
*menuBar*toggleComposeToolbar.mnemonic:			C
*menuBar*toggleFormatToolbar.mnemonic:			F
*menuBar*toggleFormatToolbar.labelString:		Formatting Toolbar
*menuBar*toggleTableBorders.labelString:		Table Borders
*menuBar*toggleTableBorders.mnemonic:			B

! Insert Menu
! new
*menuBar*insertMenu.labelString:				Insert
*menuBar*insertListMenu.labelString:			List
*menuBar*insertBulletedList.labelString:		Bulleted List
*menuBar*insertNumberedList.labelString:		Numbered List
*insertTableRow.labelString:                    Row
*insertTableRow.mnemonic:                       R
*insertTableRow.documentationString:            Insert a new row in the table
*insertTableColumn.labelString:                 Column
*insertTableColumn.mnemonic:                    o
*insertTableColumn.documentationString:        Insert a new column in the table
*insertTableCell.labelString:                   Cell
*insertTableCell.mnemonic:                      C
*insertTableCell.documentationString:           Insert a new cell in the table

*insertHtml.labelString:                        HTML Tag...
*insertHtml.mnemonic:                           H
*insertHtml.documentationString:                \
Insert an arbitrary HTML Tag at the insertion location
*insertNonBreakingSpace.labelString:            Non-breaking Space
*insertNonBreakingSpace.mnemonic:               S
*insertBreakBelowImage.labelString:             Break below Image(s)
*insertBreakBelowImage.mnemonic:                B
*insertLineBreak.labelString:                   New Line Break
*insertLineBreak.mnemonic:                      L

! Insert/Tables pullaside.
*insertTable.labelString:					Table...
*insertTable.mnemonic:                          T
*insertRow.labelString:                         Row
*insertRow.mnemonic:                            R
*insertColumn.labelString:                      Column
*insertColumn.mnemonic:                         o
*insertCell.labelString:                        Cell
*insertCell.mnemonic:                           C

! new
! Format Menu
! Properties Menu
*menuBar*properties.labelString:			Properties
*menuBar*textProperties.labelString:		Character Properties
*menuBar*textProperties.mnemonic:	    e
*menuBar*linkProperties.labelString:		Link Properties
*menuBar*linkProperties.mnemonic:	    L
*menuBar*imageProperties.labelString:		Image Properties
*menuBar*imageProperties.mnemonic:	    I
*menuBar*targetProperties.labelString:		Target Properties
*menuBar*targetProperties.mnemonic:	    a
*menuBar*tableProperties.labelString:		Table Properties
*menuBar*tableProperties.mnemonic:	    T
*menuBar*hruleProperties.labelString:		Horizontal Line Properties
*menuBar*hruleProperties.mnemonic:	    o
*menuBar*tagProperties.labelString:			HTML Tag Properties
*menuBar*tagProperties.mnemonic:		H
*menuBar*documentProperties.labelString:	Document Properties
*menuBar*documentProperties.mnemonic:   D

! Properties Character Pullaside
*charProperties.labelString:				Character
*charProperties.mnemonic:			    C
*charProperties.bold.labelString:			Bold
*charProperties.bold.acceleratorText:	Alt+B
*charProperties.bold.mnemonic:	        B
*charProperties.underline.labelString:	Underline
*charProperties.underline.acceleratorText:	Alt+U
*charProperties.underline.mnemonic:	    U
*charProperties.italic.labelString:			Italic
*charProperties.italic.acceleratorText:	Alt+I
*charProperties.italic.mnemonic:	    I
*charProperties.fixed.labelString:			Fixed Width
*charProperties.fixed.acceleratorText:	Alt+T
*charProperties.fixed.mnemonic:	        F
*charProperties.superscript.labelString:	Superscript
*charProperties.superscript.mnemonic:	p
*charProperties.subscript.labelString:		Subscript
*charProperties.subscript.mnemonic:		S
*charProperties.strikethrough.labelString:	Strikethrough
*charProperties.strikethrough.mnemonic:	t
*charProperties.blink.labelString:			Blinking
*charProperties.blink.mnemonic:         k
*charProperties.textColor.labelString:		Text Color...
*charProperties.textColor.mnemonic:		C
*charProperties.defaultColor.labelString:	Default Color
*charProperties.defaultColor.mnemonic:	D
*charProperties.serverJavaScript.labelString: JavaScript (Server)
*charProperties.serverJavaScript.mnemonic: J
*charProperties.clientJavaScript.labelString: JavaScript (Client)
*charProperties.clientJavaScript.mnemonic: v
*menuBar*charProperties.clearAllStyles.labelString:	Clear All Styles <Alt+K>
*menuBar*charProperties.clearAllStyles.acceleratorText:	Alt+K
*menuBar*charProperties.clearAllStyles.mnemonic:	a
*menuBar*fontSize.labelString:						Font Size
*menuBar*fontSize.mnemonic:			    S
*menuBar*paragraphProperties.labelString:			Paragraph
*menuBar*paragraphProperties.mnemonic:	    P
*menuBar*paragraphProperties.indent.labelString:	Indent one level
*menuBar*paragraphProperties.indent.acceleratorText:	Tab
*menuBar*paragraphProperties.indent.mnemonic:           I
*menuBar*paragraphProperties.outdent.labelString:	Remove one indent level
*menuBar*paragraphProperties.outdent.acceleratorText:	Shift+Tab
*menuBar*paragraphProperties.outdent.mnemonic:          R

! Properties Font Size PullAside/Toolbar Font Size Popup.
*characterToolbar*fontSize.marginWidth:				0
*characterToolbar*fontSize.marginHeight:			0
*composeToolbar*fontSize.marginWidth:				0
*composeToolbar*fontSize.marginHeight:				0
*fontSize.XmPushButtonGadget.labelType: STRING
*fontSize.minusTwo.labelString: 					-2
*fontSize.minusOne.labelString: 					-1
*fontSize.plusZero.labelString:  					+0
*fontSize.plusZero.mnemonic:                 0
*fontSize.plusOne.labelString:  					+1
*fontSize.plusOne.mnemonic:                  1
*fontSize.plusTwo.labelString:  					+2 
*fontSize.plusTwo.mnemonic:                  2
*fontSize.plusThree.labelString:					+3
*fontSize.plusThree.mnemonic:                3
*fontSize.plusFour.labelString: 					+4
*fontSize.plusFour.mnemonic:				 4

! Properties Paragraph PullAside/Toolbar Properties Popup.
*composeToolbar*paragraphProperties.marginWidth:	0
*composeToolbar*paragraphProperties.marginHeight:	0
*paragraphProperties.XmPushButtonGadget.labelType:	STRING
*normal.labelString:      	    Normal
*normal.mnemonic:			    N
*headingOne.labelString:		Heading 1
*headingOne.mnemonic:		    1
*headingTwo.labelString:		Heading 2
*headingTwo.mnemonic:		    2
*headingThree.labelString:		Heading 3
*headingThree.mnemonic:		    3
*headingFour.labelString:		Heading 4
*headingFour.mnemonic:		    4
*headingFive.labelString:		Heading 5
*headingFive.mnemonic:		    5
*headingSix.labelString:		Heading 6
*headingSix.mnemonic:		    6
*address.labelString:			Address
*address.mnemonic:			    A
*formatted.labelString:			Formatted
*formatted.mnemonic:			F
*listItem.labelString:			List Item
*listItem.mnemonic:			    L
*descriptionItem.labelString:	Description Title
*descriptionItem.mnemonic:		T
*descriptionText.labelString:	Description Text
*descriptionText.mnemonic:		x

! Tools menu
! Options Menu
*menuBar*editorPrefs.labelString:	Editor Preferences...
*menuBar*editorPrefs.mnemonic:	    E
*Editor*menuBar*showToolbar.labelString:	Show File/Edit Toolbar
*Editor*menuBar*showToolbar.mnemonic:	T
*menuBar*showCharacter.labelString:	Show Character Toolbar
*menuBar*showCharacter.mnemonic:	C
*menuBar*showParagraph.labelString:	Show Paragraph Toolbar
*menuBar*showParagraph.mnemonic:	P

! Windows Menu
*menuBar*netBrowser.labelString:	Netscape Browser

!=============
!  Popup Menus
!=============

!this comes up when you right click on a person in the address book
!so it should say "New Message" and not "Message"
*popup*composeMessage.labelString:	New Message
!
*popup*viewProperties.labelString:   	Properties
*popup*viewProperties.mnemonic:   		s
!
*popup*abDelete.labelString:    	Delete
*popup*abDelete.mnemonic:    		D
*popup*abDelete.acceleratorText: 	Alt+D
!
*popup*abDeleteAllEntries.labelString:    	Delete From All Lists
!
*popup*addToAddressBook.labelString: 	New Card...
*popup*addToAddressBook.mnemonic: 		w
*popup*abNewList.labelString:       	New List...
*popup*abNewList.mnemonic:        		L
!
*popup*saveMessagesAs.labelString:      Save As...
*popup*saveMessagesAs.mnemonic:         S
*popup*saveMessagesAs.acceleratorText:  Alt+S

! These are std Mail folder names.
*popup*sentMail.labelString:				Sent
*popup*sentMail.mnemonic:				S

*popup*inbox.labelString:				Inbox
*popup*inbox.mnemonic:					I

*popup*trash.labelString:				Trash
*popup*trash.mnemonic:					T

*popup*newFolder.labelString:				New...
*popup*newFolder.mnemonic:				N

! A few Message Center popups:
*popup*openFolder.labelString:  Open
*popup*openFolderInNew.labelString:  Open in New Window
*popup*deleteFolder.labelString:	 Delete
*popup*renameFolder.labelString:	 Rename...
*popup*compactFolder.labelString:	 Compact
*popup*subscribeFolder.labelString:	 Subscribe...
*popup*unsubscribeFolder.labelString:	 Unsubscribe

*popup*search.labelString:		Search Messages
*popup*search.labelString:		Search Messages
*popup*openNewsgroups.labelString:	Open Newsgroups
*popup*markNewsgroupsRead.labelString:	Mark Newsgroup Read
*popup*updateMessageCount.labelString:	Update Message Count

! These are only in the threads window popup:
*popup*ignoreThread.labelString:	Ignore Thread
*popup*ignoreThread.mnemonic:		I
*popup*watchThread.labelString:		Watch Thread
*popup*watchThread.mnemonic:		W
*popup*changePriority.labelString:	Change Priority
*popup*openSelected.labelString:	Open Message
*popup*openMsgInNew.labelString:	Open Message in New Window
*popup*editMsg.labelString:	        Edit Message
*popup*addSenderToAddressBook.labelString:	Add to Address Book

! the Mail Message window popup:
! many of these don't actually get there because they're
! overridden by the backend's allxpstr.h defs.
*popup*replyToSender.labelString:	Reply To Sender Only
*popup*replyToSender.mnemonic:		R
*popup*replyToAll.labelString:		Reply To Sender and All
*popup*replyToAll.mnemonic:		A
*popup*replyToNewsgroup.labelString:		Reply To Newsgroup

*toolBar*popup_PopupMenu.PopupMenu.replyToSender.labelString: to Sender Only
*toolBar*popup_PopupMenu.PopupMenu.replyToNewsgroup.labelString: to Newsgroup

*popup*replyToSenderAndNewsgroup.labelString:		Reply To Sender and Newsgroup
*popup*forwardMessage.labelString:	Forward
*popup*forwardMessage.mnemonic:		a
*popup*forwardMessageQuoted.labelString:	Forward Quoted
*popup*forwardMessage.mnemonic:		Q
*popup*forwardMessageInLine.labelString:	Forward Inline
*popup*forwardMessageInLine.mnemonic:	l
! "Recipients"?  What does that do?  It's in the spec.


*popup*addToAddrBkSubmenu.labelString:	Add to Address Book
*popup*addToABSubmenu.labelString:	Add to Address Book
*popup*addSenderToAddrBk.labelString:	Sender
*popup*addAllToAddrBk.labelString:	All

*popup*fileSubmenu.labelString:		Move Message
*popup*deleteMessage.labelString:	Delete Message
*popup*deleteMessage.mnemonic:		D
*popup*saveMessage.labelString:		Save Message
*popup*saveMessage.mnemonic:		v
*popup*print.labelString:		Print Message...
*popup*print.mnemonic:			P

! Editor Popup Menu
*popup*textProperties.labelString:      Character Properties
*popup*textProperties.mnemonic:         x
*popup*targetProperties.labelString:    Target Properties
*popup*targetProperties.mnemonic:       a
*popup*imageProperties.labelString:     Image Properties
*popup*imageProperties.mnemonic:        I
*popup*tableProperties.labelString:     Table Properties
*popup*tableProperties.mnemonic:        T
*popup*hruleProperties.labelString:     Horizontal Line Properties
*popup*hruleProperties.mnemonic:        o
*popup*tagProperties.labelString:       HTML Tag Properties
*popup*tagProperties.mnemonic:          H
*popup*paragraphProperties.labelString: Paragraph Properties
*popup*paragraphProperties.mnemonic:    g
*popup*documentProperties.labelString:  Document Properties
*popup*documentProperties.mnemonic:     D
*popup*insert.labelString:              Insert
*popup*insert.mnemonic:                 s
*popup*insertLink.labelString:          Insert Link...
*popup*insertLink.mnemonic:             n
*popup*linkProperties.labelString:      Link Properties
*popup*linkProperties.mnemonic:         n
*popup*browseLink.labelString:          Open Link in Browser...
*popup*browseLink.mnemonic:             w
*popup*browseToLink.labelString:        Browse to: (%s)
*popup*editLink.labelString:            Open Link in Editor...
*popup*editLink.mnemonic:               E
*popup*bookmarkLink.labelString:        Add Link to Bookmarks
*popup*bookmarkLink.mnemonic:           B
*popup*copyLink.labelString:            Copy Link Location
*popup*copyLink.mnemonic:               k
*popup*removeLink.labelString:          Remove Link
*popup*removeLink.mnemonic:             R

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Editor toolbar (submenu).
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*toolBar*newBlank.labelString:          Blank Page
*toolBar*newTemplate.labelString:       New From Template
*toolBar*newWizard.labelString:         New From Wizard
*toolBar*openPage.labelString:          Open Page...
*toolBar*save.labelString:              Save
*toolBar*saveAs.labelString:            Save As...
*toolBar*publish.labelString:           Publish
*toolBar*sendPage.labelString:          Send Page

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Editor toolbar (text only).
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*toolBar.editDocument.labelString:      Edit
*toolBar.editorNewBlank.labelString:    New
*toolBar.editorOpenFile.labelString:    Open...
*toolBar.save.labelString:              Save
*toolBar.editorBrowse.labelString:      Browse
*toolBar.cut.labelString:		Cut
*toolBar.copy.labelString:		Copy
*toolBar.paste.labelString:		Paste
*toolBar.publish.labelString:		Publish
! new
*toolBar.newBlank.labelString:          New
*newBlank.tipString:                New Page
*toolBar.openPage.labelString:          Open
*toolBar.browsePage.labelString:        Browse
*toolBar.findInObject.labelString:      Find
*toolBar.insertLink.labelString:        Link
*toolBar.insertTarget.labelString:      Target
*toolBar.insertImage.labelString:       Image
*toolBar.insertHorizontalLine.labelString: Line
*toolBar.insertTable.labelString:       Table
*toolBar.spellCheck.labelString:        Spelling

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Editor dialogs.
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*textPropertiesDialog_popup.title:			Netscape: Properties
*textPropertiesDialog.folder.XmForm.marginHeight: 		10
*textPropertiesDialog.folder.XmForm.marginWidth:		10
*textPropertiesDialog*XmFrame.marginHeight: 	2
*textPropertiesDialog*XmFrame.marginWidth:		2
*imagePropertiesDialog_popup.title:		       Netscape: Properties
*imagePropertiesDialog.folder.XmForm.marginHeight: 		10
*imagePropertiesDialog.folder.XmForm.marginWidth:		10
*imagePropertiesDialog*XmFrame.marginHeight: 	2
*imagePropertiesDialog*XmFrame.marginWidth:		2

! Properties/Link properties.
*linkProperties.tabLabelString:	Link
*linkSourceTitle.labelString:	Link source
*linkSourceLabel.labelString:		Enter the text of the link:
*linkToTitle.labelString:		Link to
*linkToLabel.labelString:		Enter link to a page location or local file:
*browseFile.labelString:		Browse File...
*linkTarget.labelString:		\
Link to a named target in specified document(optional)
*showTargets.labelString:		Show targets in: 
*currentDocument.labelString:	Current document
*selectedFile.labelString:		Selected file
*linkProperties*targetText.height:				100

! Properties/Character properties:
*characterProperties.tabLabelString:	Character
*colorTitle.labelString:		Color
*colorLabel.labelString:		Current color:
*default.labelString:			Document's default color
*custom.labelString:			Custom color
*chooseColor.labelString:		Choose Color...
*colorText.labelString:			Selected text will be set to the chosen color.
*sizeTitle.labelString:			Size
*sizeText.labelString:			Each paragraph style has\nits own default size.
*styleTitle.labelString:		Style
*clearStyles.labelString:		Clear Style Settings
*characterProperties*clearStyles.marginWidth:	10
*characterProperties*clearStyles.marginHeight:	5
*characterProperties*clearStyles.leftOffset:	30
*characterProperties*clearStyles.rightOffset:	30
*characterProperties*clearStyles.bottomAttachment: ATTACH_FORM
*characterProperties*clearStyles.bottomOffset:	5
*characterProperties*javaFrame.leftOffset:		10
*characterProperties*sizeFrame.leftOffset:		10
*javaTitle.labelString:			Java Script
*java*client.labelString:		Client
*java*server.labelString:		Server
*clearAll.labelString:			Clear All Settings
*characterProperties*clearAll.marginWidth:		10
*characterProperties*clearAll.marginHeight:		5
*characterProperties*clearAll.topOffset:		20
*characterProperties*clearAll.leftOffset:		15
*characterProperties*clearAll.rightOffset:		15

! Properties/Paragraph properties:
*paragraphProperties.tabLabelString: Paragraph
*styleLabel.labelString:			Paragraph style:
*additionalLabel.labelString:		Additional style:
*additional*default.labelString:	Default
*additional*list.labelString:		List
*additional*blockQuote.labelString:	Block quote
*listTitle.labelString:				List
*listLabel.labelString:				Style:
*numbered.labelString:				Numbered
*unnumbered.labelString:			Unnumbered
*directory.labelString:				Directory
*menu.labelString:					Menu
*description.labelString:			Description
*automatic.labelString:				Automatic
*digital.labelString:				1,2,3,4,5..
*lowerRoman.labelString:			i,ii,iii,iv,v..
*upperRoman.labelString:			I,II,III,IV,V..
*lowerAlpha.labelString:			a,b,c,d,e..
*upperAlpha.labelString:			A,B,C,D,E..
*solidCircle.labelString:			Solid Circle
*openCircle.labelString:			Open Circle
*openSquare.labelString:			Open Square
*startLabel.labelString:			Starting number
*startText.columns:					4
*spaceAvailable.labelString:		This Space Available
*paragraphProperties*spaceAvailable.topOffset:	40
*paragraphProperties*spaceAvailable.leftOffset:	150

! Properties/Image properties:
*imageProperties.tabLabelString:	Image
*imageFileTitle.labelString:		\
Image location - Enter a remote URL or local file:
*chooseFile.labelString:		    Choose File...
*browse.labelString:				Browse...
*alternativeImageTitle.labelString:	Alternative representations (optional):
*alternativeImageLabel.labelString:	Image:
*alternativeTextLabel.labelString:	Text:
*alignmentRowColumn*XmToggleButtonGadget.shadowThickness: 2
*alignmentTitle.labelString:		Text alignment and wrapping around images
*alignmentInfoLabel.labelString:	\
To see wrapped text, view page in Browse window.
*imageSpaceTitle.labelString:		Space around image
*imageProperties.imageSpaceFrame.leftOffset:	10
*leftRightLabel.labelString:		Left and right:
*topBottomLabel.labelString:		Top and Bottom:
*solidBorderLabel.labelString:		Solid Border:
*originalSize.labelString:			Original Size
*customSize.labelString:			Custom Size
*constrain.labelString:			    Constrain
*copyImage.labelString:				Copy image to document location
*leaveImage.labelString:			Leave image at the original location
*useAsBackground.labelString:		Use as background
*removeImageMap.labelString:		Remove Image Map
*editImage.labelString:				Edit Image

! Horizontal Line Properties
*horizontalLineProperties_popup.title: Netscape: Horizontal Line
*dimensionsTitle.labelString:		Dimensions
*horizontalLineProperties*XmFrame.marginWidth:  10
*horizontalLineProperties*XmFrame.marginHeight: 10
*heightLabel.labelString:			Height:
*heightText.columns:				4
*pixels.labelString:				pixels
*widthLabel.labelString:			Width:
*widthText.columns:					4
*percent.labelString:				% of window
*alignTitle.labelString:			Align
*left.labelString:					Left
*center.labelString:				Center
*right.labelString:				Right
*threeDShading.labelString:			3-D shading

! Document Properties & Editor Preferences/Appearance
*appearanceProperties.tabLabelString:				Colors and Background
*documentPropertiesDialog_popup.title:	Netscape: Document Properties
*editorPreferencesDialog_popup.title:	Netscape: Editor Preferences
*folder*appearance.marginHeight: 	10
*folder*appearance.marginWidth:		10
*folder*appearance*XmFrame.marginHeight: 2
*folder*appearance*XmFrame.marginWidth:	2
*appearance*custom.labelString:		Use custom colors
*appearance*browser.labelString:		\
Use the Browser's color settings
*schemesTitle.labelString:		Color schemes
*save.labelString:			Save
*remove.labelString:			Remove
*documentColorsTitle.labelString:	Document colors
*documentPropertiesDialog*previewFrame.marginHeight: 	0
*documentPropertiesDialog*previewFrame.marginWidth:	0
*appearance*normal.labelString:			Normal text...
*appearance*link.labelString:			Link text...
*appearance*active.labelString:			Active Link text...
*appearance*followed.labelString:		Followed Link text...
*appearance*background.labelString:		Background...
*appearance*backgroundInfo.labelString:		Background image will override color.
*appearance*preview.normal.labelString: Normal text
*appearance*preview.link.labelString:	Link text
*appearance*preview.active.labelString:  Active (selected) link
*appearance*preview.followed.labelString: Followed (visited) link
*appearance*preview*normalLabelString: Normal text
*appearance*preview*linkLabelString:	Link text
*appearance*preview*activeLabelString:  Active (selected) link
*appearance*preview*followedLabelString: Followed (visited) link
*backgroundImageTitle.labelString:			Background image
*browseImageFile.labelString:				Browse for File...
*solid.labelString:			Solid color
*useImage.labelString:				Use Image
*choose.labelString:			Choose Color...
*documentPropertiesDialog*appearance*infoLabel.labelString:	\
These settings will be applied to the current document.
*editorAppearance*appearance*infoLabel.labelString:	\
These settings will be applied to new documents, not the current.

! Document Properties/General
*generalProperties.tabLabelString:	General
*folder*general.marginHeight: 		10
*folder*general.marginWidth:		10
*locationLabel.labelString:			Location:
*titleLabel.labelString:			Title:
*authorLabel.labelString:			Author:
*descriptionLabel.labelString:		Description:
*createdLabel.labelString:			Creation date:
*updatedLabel.labelString:			Last updated:
*otherAttributesTitle.labelString:	Other attributes
*infoLabel.labelString:				\
Use commas to separate multiple words or phrases.
*keywordsLabel.labelString:			Keywords:
*classificationLabel.labelString:	Classification:

! Document Properties/Advanced
*advanced.tabLabelString:			Advanced
*folder*advanced.marginHeight: 		10
*folder*advanced.marginWidth:		10
*systemLabel.labelString:		Netscape system variables (HTTP-EQUIV):
*userLabel.labelString:			User variables (META):
*nameLabel.labelString:			Name:
*valueLabel.labelString:		Value:
*delete.labelString:			Delete
*set.labelString:			Set
*new.labelString:			New

! Target Properties
*targetPropertiesDialog_popup.title: 	Netscape: Target Properties
*targetLabel.labelString:				Enter a name for this target:

! Html Properties
*htmlPropertiesDialog_popup.title: 	Netscape: HTML Tag
*htmlPropertiesInfo.labelString:	\
Enter tag name and any attributes or parameters for one tag only.
*htmlPropertiesDialog.Apply.labelString:	Verify
*htmlPropertiesDialog.ApplyLabelString: 	Verify

! Editor Preferences/General
*generalPreferences.tabLabelString:	General
*authorTitle.labelString:		Author name
*externalTitle.labelString:		External editors
*htmlLabel.labelString:			HTML source:
*imageLabel.labelString:		Image:
*templateTitle.labelString:		New document template
*templateInfo.labelString:		\
This page will open when you select from menu:\n\
File/New Document/From Template.
*restoreDefault.labelString:		Restore default
*autosaveTitle.labelString:		Auto Save
*autosaveEnable.labelString:	Automatically save document every:
*minutes.labelString:			minutes

! Editor/Tables Properties&Create
*table.tabLabelString:			Table
*row.tabLabelString:			Row
*cell.tabLabelString:			Cell
*tableCreateDialog_popup.title:				Netscape: New Table Properties
*tablePropertiesDialog_popup.title: 		Netscape: Table Properties
*tableRowsLabel.labelString:				Number of rows:
*tableColumnsLabel.labelString:				Number of columns:
*attributesTitle.labelString:				Attributes
*tableAlignmentTitle.labelString:			Table alignment
*borderLineWidthLabel.labelString:			Border line width
*borderLineWidthUnits.labelString:			pixels
*cellSpacingLabel.labelString:				Cell spacing
*cellSpacingUnits.labelString:				pixels between cells
*cellPaddingLabel.labelString:				Cell padding
*cellPaddingUnits.labelString:			       pixel space within cells
*tableWidthToggle.labelString:				Table width
*tableHeightToggle.labelString:				Table min. height
*tableColorToggle.labelString:				Table color
*captionToggle.labelString:				Include caption
*above.labelString:					above
*below.labelString:					below table
*tableWidthUnits.marginWidth:				0
*tableWidthUnits.marginHeight:				0
*tableHeightUnits.marginWidth:				0
*tableHeightUnits.marginHeight:				0
*captionUnits.marginWidth:				0
*captionUnits.marginHeight:				0
*textAlignmentTitle.labelString:			Text alignment
*horizontalLabel.labelString:				Horizontal
*verticalLabel.labelString:				Vertical
*textAlignment*default.labelString:			Default
*textAlignment*left.labelString:			Left
*textAlignment*right.labelString:			Right
*textAlignment*center.labelString:			Center
*textAlignment*top.labelString:				Top
*textAlignment*bottom.labelString:			Bottom
*textAlignment*baselines.labelString:			Baselines
*tableAlignmentBox*left.labelString:			Left
*tableAlignmentBox*right.labelString:			Right
*tableAlignmentBox*center.labelString:			Center
*rowColorToggle.labelString:				Row color
*textOtherTitle.labelString:				Text
*headerStyle.labelString:				Header style
*nonBreaking.labelString:				Nonbreaking
*cellRowsLabel.labelString:				Cell spans
*cellColumnsLabel.labelString:				row(s), and 
*cellColumnsUnits.labelString:				column(s)
*cellWidthToggle.labelString:				Cell width
*cellHeightToggle.labelString:				Cell min. height
*cellColorToggle.labelString:				Cell color
*percentOfCell.labelString:				% of parent cell
*percentOfWindow.labelString:			% of window
*cancel.cancelLabelString:              Cancel
*cancel.closeLabelString:               Close
*Cancel.cancelLabelString:              Cancel
*Cancel.closeLabelString:               Close
*borderLineWidth.labelString:           Border Line Width
*equalColumnWidth.labelString:          Equal Column Widths
*backgroundTitle.labelString:           Background
*backgroundAttributes.useColor.labelString: Use Color:
*backgroundAttributes.useImage.labelString: Use Image:
*backgroundAttributes.chooseImage.labelString: Choose Image...

! Editor Preferences/Publish
*publishPreferences.tabLabelString:	Publish
*folder*publish.marginHeight: 		10
*folder*publish.marginWidth:		10
*linksAndImagesTitle.labelString:	Links and images
*linksAndImagesLabel.labelString:	\
When saving remote documents, and when inserting links and images:
*linksToggle.labelString:		Maintain links
*linksInfo.labelString:			\
Adjust links to work from the document's location. (Links to local\n\
documents will work when local versions exist).
*imagesToggle.labelString:		Keep images with document
*imagesInfo.labelString:		\
Save copies of images to the document's location.\n\
Images will always appear in local versions of the document and\n\
when document is published.
*linksAndImagesTip.labelString:		\
Tip: Set both options if you will be using remote publishing.
*publishTitle.labelString:		Default publishing location
*publishLabel.labelString:		Publish to (FTP or HTTP):	
*browseLabel.labelString:		Browse to (HTTP):
*usernameLabel.labelString:		User name:
*passwordLabel.labelString:		Password:
*savePassword.labelString:		Save password

! Publish Files dialog box
*publishFilesDialog_popup.title: 	Netscape: Publish Files
*localFilesTitle.labelString:		Local files
*localFiles.publishLabel.labelString:	Publish:
*includeLabel.labelString:		Include files:
*includeImages.labelString:		Files associated with this page
*includeAll.labelString:		All files in directory
*selectNone.labelString:		Select None
!
!
*titleFrameTitle.labelString:	Page Title
*publishLocationTitle.labelString:	Publishing location
*publishLocation.publishLabel.labelString:	\
Upload files to this location (FTP or HTTP):
*useDefault.labelString:		Use Default Location
! bogus url alert default button:
*publishFilesDialog_popup.question_popup.dialog.defaultButtonType:	\
dialog_cancel_button

*hintDialog_popup.title:		Netscape: Hint
*dontDisplayAgain.labelString:	Don't display this message again.
*hintDialog.dontDisplayAgainRow.marginWidth: 9

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Editor popups.
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! Color Picker
*setColors_popup.title:                         Netscape: Set Colors
*standardColorsTitle.labelString:               Standard Colors
*colorPicker*oldSample.labelString:             Old
*colorPicker*newSample.labelString:             New
*colorPicker*swatches.tabLabelString:           Swatches
*colorPicker*rgb.tabLabelString:                Rgb
*colorPicker*rgb*unitsMenu.decimal.labelString: Decimal
*colorPicker*rgb*unitsMenu.hex.labelString:     Hexidecimal
*colorPicker*rgb*unitsMenu.percent.labelString: %
*colorPicker*defaultColor.labelString:          Default Color
*colorPicker*otherColor.labelString:            Other Color...

! Save Remote Dialog.
*saveRemote.marginHeight:		10
*saveRemote.marginWidth:		10
! These don't seem to get set by above two lines.
*saveRemote*infoIcon.marginWidth:	15
*saveRemote*infoIcon.marginHeight:	15
*saveRemote_popup.title:		Netscape: Save Remote Document
*saveRemote*infoText.labelString:	\
This document is on a remote server.\n\
You must save it locally before making\n\
changes.
*saveRemote*linksTitle.labelString:	Links
*saveRemote*linksToggle.labelString:	Adjust links to aid in remote publishing
*saveRemote*linksText.labelString:	\
Links to other documents in the same location (directory) will work\n\
locally and when documents are published.\n\
\n\
Links to remote sites will not change.
*saveRemote*imagesTitle.labelString:	Images
*saveRemote*imagesToggle.labelString:	Save images with document
*saveRemote*imagesText.labelString:	\
Images will appear in local versions of the document.
*saveRemote*save.labelString:		Save
*saveRemote*cancel.labelString:		Cancel
*saveRemote*help.labelString:		Help

! Confirm Save File(s) Dialog.
*confirmSaveFiles_popup.title:			Netscape: Confirm Save File
*confirmSaveFiles.marginHeight:			0
*confirmSaveFiles.marginWidth:			0
*yes.labelString:		Yes
*confirmSaveFiles*yesToAll.labelString:	Yes To All
*no.labelString:		No
*confirmSaveFiles*noToAll.labelString:	No To All
*confirmSaveFiles*cancel.labelString:	Cancel
*confirmSaveFiles*help.labelString:		Help
*confirmSaveFiles*defaultButtonShadowThickness:	0

! Save/Upload files message dialogs.
*saveMessageDialog_popup.title:			Saving files
*uploadMessageDialog_popup.title:		Uploading files
*imageLoadMessageDialog_popup.title:	Loading image
*saveMessageDialog.width:               400
*uploadMessageDialog.width:             400
*imageLoadMessageDialog.width:          400

!=============================================================================
! Mail/News column titles
!=============================================================================
*mailNewsColumns.folderlist.Name:	Name
*mailNewsColumns.folderlist.Unread:	Unread
*mailNewsColumns.folderlist.Total:	Total
*mailNewsColumns.messagelist.Thread:	Thread
*mailNewsColumns.messagelist.Sender:	Sender
*mailNewsColumns.messagelist.Subject:	Subject
*mailNewsColumns.messagelist.Date:	Date


!=============================================================================
*toolBar*spacer.marginWidth:		4

*urlBar*whatsNew.labelString:		What's New?
*whatsNew.documentationString:		What's New on the net
*urlBar*whatsCool.labelString:		What's Cool?
*whatsCool.documentationString:		Cool sites on the net
*urlBar*inetIndex.labelString:		The Internet
*inetIndex.documentationString:		Exploring the Net
*urlBar*inetSearch.labelString:		Net Search
*inetSearch.documentationString:	Internet Search
*urlBar*inetWhite.labelString:		People
*inetWhite.documentationString:		People and Places
*urlBar*inetYellow.labelString:		Yellow Pages
*urlBar*upgrade.labelString:		Software
*urlBar*welcome.labelString:		Welcome
*urlBar*newsgroups.labelString:		Groups
*inetAbout.documentationString:		About the Internet

*toolBar.getNewMail.labelString:	Get Mail
*toolBar.deleteMessage.labelString:	Delete
*toolBar.mailNew.labelString:		New Mail Message
*toolBar.postNew.labelString:		New
*toolBar.replyToSender.labelString:	Reply
*toolBar.replyToAll.labelString:	Reply All
*toolBar.postReply.labelString:		Post Reply
*toolBar.postAndMailReply.labelString:	Reply
*toolBar.forwardMessage.labelString:	Forward
*toolBar.previousUnreadMessage.labelString:Previous
*toolBar.nextUnreadMessage.labelString:	Next
*toolBar.markThreadRead.labelString:	Thread
*toolBar.markAllRead.labelString:	All

*msgViewAttachPopup*open.labelString:		Open...
*msgViewAttachPopup*open.mnemonic:		O
*msgViewAttachPopup*save.labelString:		Save...
*msgViewAttachPopup*save.mnemonic:		S
*msgViewAttachPopup*properties.labelString:	Properties
*msgViewAttachPopup*properties.mnemonic:	P

*attachmentProps.dialogTitle:			Attachment
Netscape*attachmentProps*XmLabelGadget.fontList:	-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*attachmentProps.okLabelString:			Ok
*attachmentProps*nameLabel.labelString:		Name:
*attachmentProps*typeLabel.labelString:		Type:
*attachmentProps*encLabel.labelString:		Encoding:
*attachmentProps*descLabel.labelString:		Description:

!=============================================================================
! Toolbar for addressbook
!
*toolBar.addToAddressBook.labelString:	New Card
*toolBar.abNewList.labelString:		New List
*toolBar.deleteABEntry.labelString:	Delete
*toolBar.toAB.labelString:		To:
*toolBar.ccAB.labelString:		CC:
*toolBar.bccAB.labelString:		BCC:
*toolBar.directoryAB.labelString:	Directory

!
*Properties*showSecurBtn.labelString: Show Certificate
!*filterBoxForm.filterPrompt.labelString: Select a directory and type in the name you are looking for:
*filterBoxForm.filterPrompt.labelString: Show names containing:
*filterBoxForm.filterInLabel.labelString: Search Results
*filterBoxForm.filterSearchBtn.labelString: Search for...
*filterBoxForm.filterStopBtn.labelString: Stop

!=============================================================================
! Toolbar for mail compose
*toolBar.SendOrSendLater.labelString:	Send
*toolBar.quoteMessage.labelString:	Quote
*toolBar.attach.labelString:		Attach
*toolBar.openAddrBook.labelString:	Address

!=============================================================================
! Turn off beeping on name completion in the address outliner:
*addressText*verifyBell:		False

!=============================================================================
*noDocumentLoadedMessage:	No document has yet been loaded in this window.
*optionsSavedMessage:		Options have been saved.
*clickToSaveMessage:		Click on the link to save.
*clickToSaveCancelledMessage:	Save link to file was cancelled.
*noPreviousURLMessage:		No previous document.
*noNextURLMessage:		No next document.
*noHomeURLMessage:		No home document specified.
*notOverImageMessage:		Not over an image.
*notOverLinkMessage:		Not over a link.
*noSearchStringMessage:		Nothing to search for.
*wrapSearchMessage:	     End of document reached; continue from beginning?
*wrapSearchBackwardMessage:  Beginning of document reached; continue from end?
*wrapSearchNotFoundMessage:  Search string not found.
*noAddressesMessage:	     No recipients specified.
*noFileMessage:		     No output file specified.
*noPrintCommandMessage:	     No print command specified.
*overwriteFileMessage:	     Overwrite existing file %s?
*bookmarksChangedMessage:    Bookmarks file has changed on disk: overwrite it?
*bookmarkConflictMessage:	\
			Bookmark list not saved.\nReload the disk version now?
*bookmarksNoFormsMessage:	\
	      Cannot add the result of a form submission to the bookmark list.
*reallyQuitMessage:	Close all windows and exit Netscape?
*doubleInclusionMessage:	\n\
The document has already been quoted.\n\
 \n\
Are you sure you want to quote it again?\n

*expireNowMessage:		\
		This will mark all of your links as unfollowed.\nProceed?
*clearMemCacheMessage:		\
    This will remove all the files currently in your memory cache.\nContinue?
*clearDiskCacheMessage:		\
    This will remove all the files currently in your disk cache.\nContinue?

*createCacheDirErrorMessage:	\
Error: unable to create the persistent cache directory:\n\
 \n\
            %s: %s.\n\
 \n\
Please set a new disk cache directory from the Advanced/Cache\n\
section of the`Edit|Preferences...' dialog.\n

*createdCacheDirMessage:	\
A directory has been created for use as the disk cache:\n\
 \n\
            %s/\n\
 \n\
You can change the cache directory in the Advanced/Cache\n\
section of the`Edit|Preferences...' dialog.\n

*cacheNotDirMessage:	\
Error: the directory configured for use as the disk cache\n\
exists, but is not a directory:\n\
 \n\
            %s\n\
 \n\
Please set a new disk cache directory using the Advanced/Cache\n\
section of the`Edit|Preferences...' dialog.\n

*cacheSuffixMessage:	\
 \n\
There should be one disk cache per user, so using a shared\n\
directory (such as /tmp) is not advised.\n\
 \n\
The maximum disk cache size is currently %d kilobytes.\n\
You can change the cache size in the Advanced/Cache\n\
section of the`Edit|Preferences...' dialog.\n\
 \n\
If you wish to disable disk caching, set the Disk Cache Size\n\
to 0.  If you do this, documents will continue to be cached\n\
in memory according to the Memory Cache Size preference,\n\
but will no longer be cached on disk.  This means that the\n\
cache will not last from session to session of Netscape.

*cubeTooSmallMessage:		\
We were only able to allocate %d cells for the color\n\
cube to which images are dithered.  As a result, the\n\
image quality may be poor.\n\
 \n\
One way to improve image quality is to exit any other\n\
color-intensive applications which are running and\n\
restart Netscape.\n\
 \n\
Another way is to run Netscape with the `-install'\n\
command-line option, which will cause it to use a\n\
private colormap.  The drawback to this is that on\n\
some systems, this will result in colormap flashing\n\
when moving focus to other windows.

*renameInitFilesMessage:		\
Preferences files from an older version of Netscape exist;\n\
This version of Netscape uses the same file formats, but the\n\
file names have changed.  Would you like us to rename these\n\
files now?

*unsentMailMessage:			\
 Unsent mail messages exist, do you really want to quit without sending them?

*binaryDocumentMessage:			\
 This document is binary data; cannot view source.

! For Helper App Editor - Delete
*helperAppDeleteMessage:			\
Are you sure you want to delete this MIME type? Any future\n\
files of this type that you encounter will not be recognized\n\
by Netscape's plug-ins or Netscape's helper applications.

!=============================================================================
!*preeditType:				root
!*Netscape.preeditType:			overthespot

! default titles for the TopLevelShell widgets.
! note that the title and icon title of Navigator windows are
! changed at runtime; these resources won't override that.
*title:					Netscape
*iconName:				Netscape
*Navigator.title:			Netscape Navigator 4.8
*MailThread.title:			Netscape Mail & Newsgroups
*MailThread.iconName:		Mail & Newsgroups


*Download.title:			Netscape Download
*Download.iconName:			Download
*Composition.title:			Netscape Message Composition
*Composition.iconName:		Message Composition
*bookmarks.title:			Netscape: Bookmarks
*bookmarks.iconName:		Bookmarks
*AddressBook.title:			Netscape: Address Book
*AddressBook.iconName:		Address Book
*Editor.title:				Netscape: Composer
*Editor.iconName:			Composer
*MailFolder.title:			Netscape Message Center
*MailFolder.iconName:		Msg Center
*AWTapp.iconName:           Java Console
*history.iconName:          History
*MailMsg.iconName:          Message

!========================
!  Popup Menu - Navigator
!========================

*popup.title.labelString:		Netscape Commands:
*popup.openURLNewWindow.labelString:	Open Link in New Window
*popup.openURLNewWindow.mnemonic:		 O
*popup*openURLNewWindow.acceleratorText:  Button2
*popup.openFrameNew.labelString:		Open Frame in New Window
*popup.openFrameNew.mnemonic:			 w
*popup.openFrameInWindow.labelString:	Open Frame in Window
*popup.openFrameInWindow.mnemonic:		 i
*popup.editLink.labelString:			Open Link in Composer
*popup.editLink.mnemonic:				 e
!                                       ------------------------
! back
! forward
*reloadNonFrameCmdString:				Reload
*reloadWithFrameCmdString:				Reload Frame
*popup.frameReload.mnemonic:			 R
*popup.showImage.labelString:			Show Image
*popup.showImage.mnemonic:              g
! stopLoading
!                                       ------------------------
*pageSourceNonFrameCmdString:			View Page Source
*pageSourceWithFrameCmdString:			View Frame Source
*popup.framePageSource.mnemonic:		 u
*pageInfoNonFrameCmdString:				View Page Info
*pageInfoWithFrameCmdString:			View Frame Info
*popup.framePageInfo.mnemonic:			 V
*openImageCmdString:					View Image
*popup.openImage.mnemonic:				 m
!                                       ------------------------
*popup.addLinkBookmark.labelString:		Add Bookmark for Link
*popup.addLinkBookmark.mnemonic:		 k
*popup.addFrameBookmark.labelString:	Add Bookmark for Frame
*popup.addFrameBookmark.mnemonic:		 k
! sendPage
!                                       ------------------------
*popup.saveURL.labelString:				Save Link As...
*popup.saveURL.mnemonic:				 S
*popup.saveURL.acceleratorText:			 Shift+Button1
*popup.saveImage.labelString:		   	Save Image As...
*popup.saveImage.mnemonic:				 i
*popup.saveBGImage.labelString:			Save Background As...
*popup.saveBGImage.mnemonic:			 d
!                                       ------------------------
! 'copy' command defined in editor popup above
! 'copyLink' command defined in editor popup above
*popup.copyImage.labelString:			Copy Image Location
*popup.copyImage.mnemonic:				 y


!
! Convert from old version file formats
*convertQuestion_popup*OK.labelString:		Delete Old Config Files
*convertQuestion_popup*Cancel.labelString:	Keep Old Config Files

!
! Convert from old version file formats
*sendNow_popup*OK.labelString:		Yes
*sendNow_popup*Cancel.labelString:	No


! Mail/News popup menus
!
*Mail*popup.title.labelString:		Netscape Mail
*News*popup.title.labelString:		Netscape Newsgroups

! News open News host dialog
!
*News*openNewsHost.title:	Netscape: Open News Host
*News*openNewsHost*selectionLabelString:	\
				Input name and port of news host to open:
*News*openNewsHost*hostLabel.labelString:	News host:
*News*openNewsHost*hostLabel.alignment:		ALIGNMENT_END
*News*openNewsHost*portLabel.labelString:	Port:
*News*openNewsHost*portLabel.leftOffset:	10
*News*openNewsHost*portLabel.alignment:		ALIGNMENT_END
*News*openNewsHost*secure.labelString:		Secure
*News*openNewsHost*secure.topOffset:		10
*News*openNewsHost*portText.columns:		5

*history_popup.title:			Netscape: Window History
*history_popup*listLabelString:		Where You've Been...
*history_popup*OK.labelString:		Go To
*history_popup*OkLabelString:		Go To
*history_popup*Cancel.labelString:	Close
*history_popup*CancelLabelString:	Close
*history_popup*Apply.labelString:	Create Bookmark
*history_popup*ApplyLabelString:	Create Bookmark

*source_popup.title:				Netscape: View Source
*source_popup*save.labelString:			Save...
*source_popup*OK.labelString:			OK
*source_popup*text.editable:			False
*source_popup*text.cursorPositionVisible:	False
*source_popup*text.wordWrap:			True
*source_popup*text.scrollHorizontal:		False
*source_popup*urlLabel.labelString:		Location:
*source_popup*titleLabel.labelString:		Title:
*source_popup*titleLabel.leftOffset:		0
*source_popup*titleLabel.rightOffset:		4
*source_popup*titleLabel.alignment:		ALIGNMENT_END
*source_popup*urlLabel.topOffset:		0
*source_popup*urlLabel.leftOffset:		0
*source_popup*urlLabel.rightOffset:		4
*source_popup*urlLabel.alignment:		ALIGNMENT_END
*source_popup*titleText.leftOffset:		0
*source_popup*titleText.rightOffset:		0
*source_popup*urlText.leftOffset:		0
*source_popup*urlText.rightOffset:		0
*source_popup*text.leftOffset:			0
*source_popup*text.rightOffset:			0
*source_popup*XmScrolledWindow.topOffset:	8
*source_popup*text.columns:			80
*source_popup*text.rows:			20

*docinfo_popup.title:				Netscape: Document Information
*docinfo_popup*OK.labelString:	OK
*docinfo_popup*titleLabel.labelString:		Title:
*docinfo_popup*urlLabel.labelString:		Location:
*docinfo_popup*modifiedLabel.labelString:	Last Modified:
*docinfo_popup*sourceLabel.labelString:		Source:
*docinfo_popup*charsetLabel.labelString:	Encoding:
*docinfo_popup*dpyLabel.labelString:		Visual:
*docinfo_popup*securityFrame.label.labelString:	Security Information
*docinfo_popup*certificateLabel.labelString:	Server Certificate:
*docinfo_popup*certificateText.columns:		60
*docinfo_popup*certificateText.rows:		6
*docinfo_popup*certificateText.wordWrap:	True
*docinfo_popup*certificateText.scrollHorizontal:False
*docinfo_popup*scrollBarDisplayPolicy:		AS_NEEDED
*docinfo_popup*scrollingPolicy:			AUTOMATIC
*docinfo_popup*securityText.wordWrap:		True
*docinfo_popup*securityText.scrollHorizontal:	False
*docinfo_popup*urlLabel.topOffset:		0
*docinfo_popup*urlLabel.leftOffset:		0
*docinfo_popup*urlLabel.rightOffset:		4
*docinfo_popup*urlLabel.alignment:		ALIGNMENT_END
*docinfo_popup*titleLabel.leftOffset:		0
*docinfo_popup*titleLabel.rightOffset:		4
*docinfo_popup*titleLabel.alignment:		ALIGNMENT_END
*docinfo_popup*modifiedLabel.topOffset:		0
*docinfo_popup*modifiedLabel.leftOffset:	0
*docinfo_popup*modifiedLabel.rightOffset:	4
*docinfo_popup*modifiedLabel.alignment:		ALIGNMENT_END
*docinfo_popup*charsetLabel.topOffset:		0
*docinfo_popup*charsetLabel.leftOffset:		0
*docinfo_popup*charsetLabel.rightOffset:	4
*docinfo_popup*charsetLabel.alignment:		ALIGNMENT_END
*docinfo_popup*sourceLabel.topOffset:		0
*docinfo_popup*sourceLabel.leftOffset:		0
*docinfo_popup*sourceLabel.rightOffset:		4
*docinfo_popup*sourceLabel.alignment:		ALIGNMENT_END
! add 5 to dpyLabel.topOffset to align label with text baseline (gag)
*docinfo_popup*dpyLabel.topOffset:		5
*docinfo_popup*dpyLabel.leftOffset:		0
*docinfo_popup*dpyLabel.rightOffset:		4
*docinfo_popup*dpyLabel.alignment:		ALIGNMENT_END
*docinfo_popup*dpyText.rows:			3
*docinfo_popup*dpyText.columns:			48
*invalidLangTagFormatMsg:		\
Invalid Language/Country Tag format.\n\n\
The format is: 'Aaaaa/Bbbbb [xx-YY]' where:	\n\
    'Aaaa/Bbbb' is the Language/Country (optional, not used)\n\
    '[' and ']' bracket the tag (required, spaces not allowed between these)\n\
    'xx' specifies the language (required)\n\
    '-YY' specifies the Country (optional)

*invalidLangTagFormatDialogTitle:	Invalid Tag Format

*docinfo_popup*titleText.columns:		40
*docinfo_popup*securityFrame.topOffset:		10
*docinfo_popup*keyDescLabel.leftOffset:		14
*docinfo_popup*keyDescLabel.rightOffset:	14
*docinfo_popup*keyDescLabel.alignment:		ALIGNMENT_BEGINNING
*docinfo_popup*certificateLabel.leftOffset:	10
*docinfo_popup*certificateLabel.rightOffset:	10
*docinfo_popup*certificateLabel.alignment:	ALIGNMENT_BEGINNING
*docinfo_popup*securityLabel.leftOffset:	14
*docinfo_popup*securityLabel.rightOffset:	14
*docinfo_popup*securityLabel.alignment:		ALIGNMENT_BEGINNING
*docinfo_popup*XmScrolledWindow.leftOffset:	10
*docinfo_popup*XmScrolledWindow.rightOffset:	10

*docinfo*noSecurityMessage:\
This version of Netscape does not have security built in.

*docinfo*securityLabel.labelString:\
Security protects Internet documents you receive and information you send\n\
back with server authentication, privacy using encryption, and data\n\
integrity.  You can see a document's security status using the key/broken\n\
key icon in the status area or the colorbar above the content area (blue for\n\
secure; gray for insecure).  Consult the Handbook or the `On Security' page\n\
for details.



*bmPreferences_popup.title:				Netscape: Bookmarks
*bmPreferences_popup*frame1label.labelString:		Add Bookmark
*bmPreferences_popup*frame2label.labelString:		Bookmark Menu
*bmPreferences_popup*addbm_option.labelString:		\
						Add bookmarks to this header
*bmPreferences_popup*bmmenu_option.labelString:		\
					  View this header in bookmarks menu
*bmPreferences_popup*addbm_default.labelString: Add to toplevel
*bmPreferences_popup*bmmenu_default.labelString: Toplevel header

*bookmarksWhatsChanged*button_0.labelString: All Bookmarks
*bookmarksWhatsChanged*button_1.labelString: Selected Bookmarks
*bookmarksWhatsChanged*Apply.labelString: Start
*bookmarksWhatsChanged*ApplyLabelString:  Start
*bookmarksWhatsChanged*title.labelString: What's changed?
*bookmarksWhatsChanged.width: 400
*bookmarksWhatsChanged.minWidth: 400
*bookmarksWhatsChanged.maxWidth: 400
!*bookmarksWhatsChanged.height: 300
!*bookmarksWhatsChanged.minHeight: 300
!*bookmarksWhatsChanged.maxHeight: 300

*composeFolder.height:                          650
*composeFolder.shadowThickness:                 2
*composeFolder.bottomOffset:                    3
*composeFolder.leftOffset:                      3
*composeFolder.rightOffset:                     3
*composeFolder.topOffset:                       5
*composeFolder.spacing:                         1
*composeFolder.autoSelect:                      False


*mailto_field*fromLabel.labelString:		From:
*mailto_field*replyToLabel.labelString:		Reply To:
*mailto_field*toLabel.labelString:		Mail To:
*mailto_field*ccLabel.labelString:		Mail CC:
*mailto_field*bccLabel.labelString:		Mail BCC:
*mailto_field*fccLabel.labelString:		File CC:
*mailto_field*newsgroupsLabel.labelString:	Newsgroups:
*mailto_field*followupToLabel.labelString:	Followup To:
*mailto_field*attachmentsLabel.labelString:		Attachment:
*mailto_field*attachButton.labelString:		Attach...
*mailto_field*browseButton.labelString:		Browse...
*mailto_field*secureToggle.labelString:		Secure
*mailto_bodyText.wordWrap:			True
*mailto_bodyText.scrollHorizontal:		False
*mailto_field*attachButton.marginWidth:		10
*mailto_field*fromLabel.alignment:		ALIGNMENT_END
*mailto_field*replyToLabel.alignment:		ALIGNMENT_END
*mailto_field*toLabel.alignment:		ALIGNMENT_END
*mailto_field*ccLabel.alignment:		ALIGNMENT_END
*mailto_field*bccLabel.alignment:		ALIGNMENT_END
*mailto_field*fccLabel.alignment:		ALIGNMENT_END
*mailto_field*newsgroupsLabel.alignment:	ALIGNMENT_END
*mailto_field*followupToLabel.alignment:	ALIGNMENT_END
*mailto_field*subjectLabel.alignment:		ALIGNMENT_END
*mailto_field*attachmentsLabel.alignment:	ALIGNMENT_END

! This is 72 rather than 79 or 80 because the width of the window controls
! when word wrapping should occur; the Motif text area has no mechanism for
! wrapping at a column other than the last one.  So, if we want a fill-column
! of N, the window must be N wide.  Note that wrapping must occur before 80:
! sending out lines with 80 characters on them is antisocial, as many programs
! and terminals (including emacs) can only display 79 characters without 
! wrapping.  Wrapping at 72 is better than wrapping at 79 because it leaves
! room for further followups to quote the lines with ">" without causing
! lines to wrap.
!
! Note that, in the composition window, lines beginning with ">" will not
! be wrapped at all, despite the appearance on the screen.  So just because
! it looks like the quoted text has been mangled, doesn't mean it has.
!
*mailto_bodyText.columns:			72
! This resource will change the size of the compose tab
*mailto_bodyText.rows:				25
*composeViewBaseWidget*composeViewEditFormWidget.leftOffset: 3 
*composeViewBaseWidget*composeViewEditFormWidget.bottomOffset: 3  
*composeViewBaseWidget*subject.topOffset: 3 
*composeViewBaseWidget*subject.bottomOffset: 3 
*composeViewBaseWidget*addReceipient.topOffset:20 
*composeViewBaseWidget*removeReceipient.topOffset: 15
*composeViewBaseWidget*selectReceipient.topOffset: 15
*composeViewBaseWidget*addReceipient.leftOffset: 5
*composeViewBaseWidget*removeReceipient.leftOffset: 5
*composeViewBaseWidget*selectReceipient.leftOffset: 5


! Some people just aren't too hip.
!*defaultMailtoText:			Hey, check out this cool URL:\n\n

*attachForm*attachWebPage.labelString:  Attach Web Page...
*attachForm*attachWebPage.mnemonic:	W
*attachForm*attachFile.labelString:     Attach File...
*attachForm*attachFile.mnemonic:	F
*attachForm*deleteAttachment.labelString:		Delete Attachment
*attachForm*deleteAttachment.mnemonic:			D
*attachForm*attachAddressBookCard.labelString:		Attach Personal Card (vCard)
*attachForm*attachAddressBookCard.mnemonic:		A

*location_popup.dialogTitle:			Netscape: Attach Web Page
*location_popup*label.labelString:	Please specify a Web Page to attach:
*location_popup*locationLabel.labelString:	Web Page (URL):
*location_popup*locationText.columns:		40
*location_popup*locationText.leftOffset:	20
*location_popup*okLabelString: Attach
*location_popup*cancelLabelString: Cancel
*location_popup*clear.labelString: Clear

*attachForm*fileBrowser_popup.title:		Netscape: Attach File
*attachForm*fileBrowser.OkLabelString:		Attach

*formatType*none.labelString:		No Attachment
*formatType*text.labelString:		Text
*formatType*formattedText.labelString:	Formatted Text
*formatType*html.labelString:		Source
*formatType*tree.labelString:		Source and Images
*formatType*ps.labelString:		PostScript
*formatType*url.labelString:		URL Only


! Helper Editor stuff
*helperEditor_popup.title:		Netscape Helper
*helperEditor.width: 400
*helperEditor*mimeTypesDescriptionLabel.labelString: Description
*helperEditor*mimeTypesDescriptionLabel.leftOffset: 3
*helperEditor*mimeTypesLabel.labelString: Type
*helperEditor*mimeTypesLabel.leftOffset: 3
*helperEditor*mimeTypesSuffixLabel.labelString: Suffix
*helperEditor*mimeTypesSuffixLabel.leftOffset: 3
*helperEditor*helperEditForm.XmTextField.rightOffset: 3
*helperEditor*helperEditFrameLabel.labelString: Handle By
*helperEditor*helperEditNavigator.labelString: Navigator 
*helperEditor*helperEditPlugin.labelString: Plug In
*helperEditor*helperEditApp.labelString: Application
*helperEditor*helperEditSave.labelString: Save To Disk
*helperEditor*helperEditUnknown.labelString: Unknown:PromptUser
*helperEditor*helperEditAppBrowse.labelString: Browse...
*helperEditor*helperEditNavigator.leftOffset: 20
*helperEditor*helperEditAppText.columns: 40


! Preferences: Styles 2
!


*enteringSecureDialog_popup.title:		Netscape: Secure Document
*enteringSecureDialog*toggle.labelString:  	Show this Alert Next Time
*enteringSecureDialog*toggle.alignment:		ALIGNMENT_BEGINNING
*enteringSecureDialog*toggle.leftOffset:	100
*enteringSecureDialog.selectionLabelString:\
You have requested a secure document. The document and any information\n\
you send back are encrypted for privacy while in transit.\n\
For more information on security choose Page Info from the View \
menu.

*leavingSecureDialog_popup.title:		Netscape: Security Warning
*leavingSecureDialog*toggle.labelString:	Show this Alert Next Time
*leavingSecureDialog*toggle.alignment:		ALIGNMENT_BEGINNING
*leavingSecureDialog.OkLabelString:		Continue Loading
*leavingSecureDialog.CancelLabelString:		Cancel Loading
*leavingSecureDialog*toggle.leftOffset:		100
*leavingSecureDialog.selectionLabelString:\
You have requested an insecure document. The document and any information\n\
you send back could be observed by a third party while in transit.\n\
For more information on security choose Page Info from the View \
menu.

*mixedSecurityDialog_popup.title:		Netscape: Security Warning
*mixedSecurityDialog*toggle.labelString:	Show this Alert Next Time
*mixedSecurityDialog*toggle.alignment:		ALIGNMENT_BEGINNING
*mixedSecurityDialog*toggle.leftOffset:		100
*mixedSecurityDialog.selectionLabelString:\
You have requested a secure document that contains some insecure \
information.\n\
 \n\
The insecure information will not be shown.\n\
For more information on security choose Page Info from the View \
menu.

*redirectionToInsecureDialog_popup.title:	Netscape: Security Warning
*redirectionToInsecureDialog*toggle.labelString:Show this Alert Next Time
*redirectionToInsecureDialog*toggle.alignment:	ALIGNMENT_BEGINNING
*redirectionToInsecureDialog.OkLabelString:	Continue Loading
*redirectionToInsecureDialog.CancelLabelString:	Cancel Loading
*redirectionToInsecureDialog*toggle.leftOffset:	100
*redirectionToInsecureDialog.selectionLabelString:\
Warning! You have requested an insecure document that was\n\
originally designated a secure document (the location has been\n\
redirected from a secure to an insecure document). The document\n\
and any information you send back could be observed by a third\n\
party while in transit.

*redirectionToSecureDialog_popup.title:	Netscape: Security Warning
*redirectionToSecureDialog*toggle.labelString:Show this Alert Next Time
*redirectionToSecureDialog*toggle.alignment:	ALIGNMENT_BEGINNING
*redirectionToSecureDialog.OkLabelString:	Continue Loading
*redirectionToSecureDialog.CancelLabelString:	Cancel Loading
*redirectionToSecureDialog*toggle.leftOffset:	100
*redirectionToSecureDialog.selectionLabelString:\
Warning! Your connection has been redirected to a different\n\
site. You may not be connected to the site that you originally\n\
tried to reach.

*insecurePostFromSecureDocDialog_popup.title:	     Netscape: Security Warning
*insecurePostFromSecureDocDialog*toggle.labelString: Show this Alert Next Time
*insecurePostFromSecureDocDialog*toggle.alignment:   ALIGNMENT_BEGINNING
*insecurePostFromSecureDocDialog.OkLabelString:      Continue Submission
*insecurePostFromSecureDocDialog.CancelLabelString:  Cancel Submission
*insecurePostFromSecureDocDialog*toggle.leftOffset:  100
*insecurePostFromSecureDocDialog.selectionLabelString:\
Warning! Although this document is secure, any information you\n\
submit is insecure and could be observed by a third party while\n\
in transit. If you are submitting passwords, credit card numbers,\n\
or other information you would like to keep private, it would be\n\
safer for you to cancel the submission.

*insecurePostFromInsecureDocDialog_popup.title:	      Netscape: Security Warning
*insecurePostFromInsecureDocDialog.OkLabelString:     Continue Submission
*insecurePostFromInsecureDocDialog.CancelLabelString: Cancel Submission
*insecurePostFromInsecureDocDialog*toggle.labelString:Show this Alert Next Time
*insecurePostFromInsecureDocDialog*toggle.alignment:  ALIGNMENT_BEGINNING
*insecurePostFromInsecureDocDialog*toggle.leftOffset: 100
*insecurePostFromInsecureDocDialog.selectionLabelString:\
The information you submit is insecure and could be observed by\n\
a third party while in transit.  If you are submitting passwords,\n\
credit card numbers, or other information you would like to keep\n\
private, it would be safer for you to cancel the submission.


*licenseDialog_popup.title:			Netscape: License Agreement
*licenseDialog*label1.labelString:\n\
 Netscape is licensed software.  Its use is subject to the\n\
 terms and conditions of the license agreement below.\n
*licenseDialog*label2.labelString:\n\
 If you accept the terms of this license agreement,\n\
 press `Accept.'  Otherwise press `Do Not Accept.'\n
*licenseDialog*text.columns:			72
*licenseDialog*text.rows:			23
*licenseDialog*text.wordWrap:			True
*licenseDialog*text.scrollHorizontal:		False
*licenseDialog.accept.labelString:		Accept
*licenseDialog.reject.labelString:		Do Not Accept

*printSetup_popup.title:			Netscape: Print
*printSetup*printToLabel.labelString:		Print To:
*printSetup*toPrinterToggle.labelString:	Printer
*printSetup*toFileToggle.labelString:		File
*printSetup*printCommandLabel.labelString:	Print Command:
*printSetup*fileNameLabel.labelString:		File Name:
*printSetup*browseButton.labelString:		Browse...
*printSetup*printLabel.labelString:		Print:
*printSetup*firstFirstToggle.labelString:	First Page First
*printSetup*lastFirstToggle.labelString:	Last Page First
*printSetup*orientationLabel.labelString:	Orientation:
*printSetup*portraitToggle.labelString:		Portrait
*printSetup*landscapeToggle.labelString:	Landscape
*printSetup*printColorLabel.labelString:	Print:
*printSetup*greyscaleToggle.labelString:	Greyscale
*printSetup*colorToggle.labelString:		Color
*printSetup*paperSizeLabel.labelString:		Paper Size:
*printSetup*letterToggle.labelString:		Letter (8 1/2 x 11 in.)
*printSetup*legalToggle.labelString:		Legal (8 1/2 x 14 in.)
*printSetup*executiveToggle.labelString:	Executive (7 1/2 x 10 in.)
*printSetup*a4Toggle.labelString:		A4 (210 x 297 mm)
*printSetup*OK.labelString:			Print
*printSetup*OkLabelString:			Print
*printSetup*CancelLabelString:			Cancel
*printSetup*XmLabel.alignment:			ALIGNMENT_END
*printSetup*XmLabelGadget.alignment:		ALIGNMENT_END
*printSetup*XmToggleButtonGadget.alignment:	ALIGNMENT_BEGINNING
*printSetup*XmToggleButtonGadget.indicatorType:	ONE_OF_MANY
*printSetup*lastFirstToggle.leftOffset:		10
*printSetup*landscapeToggle.leftOffset:		10
*printSetup*colorToggle.leftOffset:		10
*printSetup*legalToggle.leftOffset:		10
*printSetup*a4Toggle.leftOffset:		10
*printSetup*XmLabel.rightOffset:		10
*printSetup*XmLabelGadget.rightOffset:		10
*printSetup*browseButton.marginHeight:		3
*printSetup*browseButton.marginWidth:		4
*printSetup*line.topOffset:			4
*printSetup*printLabel.topOffset:		4
*printSetup*firstFirstToggle.topOffset:		10
*printSetup*portraitToggle.topOffset:		10
*printSetup*greyscaleToggle.topOffset:		10
*printSetup*letterToggle.topOffset:		10
!*printSetup_popup*preeditType:			none

*findDialog_popup.title:			Netscape: Find
*findDialog*findInLabel.labelString:		Find in:
*findDialog*msgHeaders.labelString:		Message Headers in This Folder
*findDialog*msgBody.labelString:		Body of This Message
*findDialog*msgHeaders.indicatorType:		ONE_OF_MANY
*findDialog*msgBody.indicatorType:		ONE_OF_MANY
*findDialog*findLabel.labelString:		Find:
*findDialog*findLabel.alignment:		ALIGNMENT_END
*findDialog*caseSensitive.labelString:		Case Sensitive
*findDialog*backwards.labelString:		Find Backwards
*findDialog*backwards.leftOffset:		20
*findDialog*caseSensitive.alignment:		ALIGNMENT_BEGINNING
*findDialog*backwards.alignment:		ALIGNMENT_BEGINNING
*findDialog*XmToggleButtonGadget.indicatorType:	N_OF_MANY
*findDialog*XmToggleButtonGadget.visibleWhenOff:True
*findDialog*OK.labelString:			Find
*findDialog*OkLabelString:			Find
*findDialog*Apply.labelString:			Clear
*findDialog*ApplyLabelString:			Clear
*findDialog*Cancel.labelString:			Close
*findDialog*CancelLabelString:			Close
!*findDialog_popup*preeditType:			overthespot
! Bookmark Find dialog shares resources with the main find dialog
! Extra resources specific to bookmark find dialog
*findDialog*lookinLabel.labelString:		Look in:
*findDialog*nameToggle.labelString:		Name
*findDialog*locationToggle.labelString:		Location
*findDialog*descriptionToggle.labelString:	Description
*findDialog*wordToggle.labelString:		Whole word
*findDialog*helptext.labelString:		Use Find Again to keep looking.

! More resources for the Addressbook find dialog
*findDialog*nicknameToggle.labelString:		Nick Name


*openURLDialog_popup.title:			Netscape: Open Page
!*openURLDialog_popup*preeditType:		none
*openURLDialog*label.labelString:	\
Enter the World Wide Web location (URL) or specify\n\
the local file you would like to open:
*openURLDialog*choose.labelString:		Choose File...
*openURLDialog*toolLabel.labelString:		Open location or file in:
*openURLDialog*browserToggle.labelString:	Navigator
*openURLDialog*editorToggle.labelString:	Composer
*openURLDialog*OK.labelString:			Open
*openURLDialog*OkLabelString:			Open
*openURLDialog*Apply.labelString:		Clear
*openURLDialog*ApplyLabelString:		Clear
*openURLDialog*Cancel.labelString:		Cancel
*openURLDialog*CancelLabelString:		Cancel
*openURLDialog*label.alignment:			ALIGNMENT_BEGINNING
*openURLDialog*XmToggleButtonGadget.indicatorType: ONE_OF_MANY
*openURLDialog*XmRowColumn.orientation:		VERTICAL
*openURLDialog*browserToggle.set:		True
*openURLDialog*XmTextField.columns:		45
!*openURLDialog.width:				500
*openURLDialog*openInEditor.labelString: Open In Composer
*openURLDialog*openInBrowser.labelString: Open In Navigator

*message_popup.title:			Netscape
*message_popup*OK.labelString:	OK
*message_popup*OkLabelString:	OK

*error_popup.title:			Netscape: Error

*question_popup.title:			Netscape: Question
*question_popup*OK.labelString:	OK
*question_popup*Cancel.labelString:	Cancel

*prompt_popup.title:			Netscape: Prompt
*password_popup.title:			Netscape: Password
*promptSubject_popup.title:		Netscape: Subject Prompt
*stdout_popup.title:			Netscape: subprocess diagnostics (stdout)
*stderr_popup.title:			Netscape: subprocess diagnostics (stderr)
*stdout_stderr_popup.title:	 Netscape: subprocess diagnostics (stdout/stderr)

*citing_popup.title:			Netscape
*citing_popup*messageString:		\nQuoting...\n

*printing_popup.title:			Netscape
*printing_popup*messageString:		\nPrinting...\n

*deliveringMessage_popup.title:		Netscape
*deliveringMessage_popup*messageString:	\nDelivering message...\n

*saving_popup.title:			Netscape
*saving_popup*messageString:		\nSaving to disk...\n

*visual_popup.title:			Netscape: Change X Visual
*visual_popup*listLabelString:		Available Visuals:

*autoSaveNew.title:          Netscape: Auto Save New Document
*saveFile_popup.title:          Netscape: Save Document
*saveNewFile_popup.title:       Netscape: Save New Document
*markMessagesRead_popup.title:       Mark Messages Read

*promptSubject_popup*messageString:	\
You did not give a subject to this message.\n\
If you would like to provide one, please type it now.

*dialog*OK.labelString:			OK
*dialog*clear.labelString:		Clear
*dialog*Cancel.labelString:		Cancel
*dialog*userLabel.labelString:		User ID:
*dialog*passwdLabel.labelString:	Password:
*dialog*userLabel.alignment:		ALIGNMENT_END
*dialog*passwdLabel.alignment:		ALIGNMENT_END
*dialog*dialogform*text.columns:   50
*dialog*dialogform*pwtext.columns: 50

*clear.labelString:			Clear
*cancel.labelString:			Cancel
*OK.labelString:			OK

*citationQuery_popup.title:		Citation Style Question
*citationQuery.selectionLabelString:	\n\
You have quoted an entire document instead of attaching it.\n\
 \n\
You could, instead, attach the document and it would be\n\
appended to the message, without a `>' at the beginning\n\
of each line. This would make it easier for recipients\n\
to save and use this document.\n\
 \n\
Would you like to send this document as an attachment?\n

*citationQuery*OK.labelString:		Send as\nText Attachment
*citationQuery*OkLabelString:		Send as\nText Attachment
*citationQuery*Apply.labelString:	Send as\nQuoted
*citationQuery*ApplyLabelString:	Send as\nQuoted
*citationQuery*Cancel.labelString:	Cancel
*citationQuery*CancelLabelString:	Cancel

*doubleCitationQuery_popup.title:	Citation Style Question
*doubleCitationQuery.selectionLabelString:	\n\
You have (probably inadvertently) included the same document twice:\n\
first as a citation (meaning: with `>' at the beginning of each line) and\n\
then as an attachment (meaning: as a second part of the message,\n\
included after your new text.)\n\
 \n\
Would you like to send an attached document or a quoted document?

*doubleCitationQuery*OK.labelString:	Send as\nText Attachment
*doubleCitationQuery*OkLabelString:	Send as\nText Attachment
*doubleCitationQuery*Apply.labelString:	Send as\nQuoted
*doubleCitationQuery*ApplyLabelString:	Send as\nQuoted
*doubleCitationQuery*Cancel.labelString:Cancel
*doubleCitationQuery*CancelLabelString:	Cancel

*streamingAudioQuery_popup.title:	Audio Question
*streamingAudioQuery.selectionLabelString:	\
Would you like to play the data to the external viewer as it comes\n\
from the network, or save to a file and then play from the file?
*streamingAudioQuery*OK.labelString:	Play from Network
*streamingAudioQuery*OkLabelString:	Play from Network
*streamingAudioQuery*Apply.labelString:	Save First
*streamingAudioQuery*ApplyLabelString:	Save First
*streamingAudioQuery*Cancel.labelString:Cancel
*streamingAudioQuery*CancelLabelString:	Cancel

*fileSelector*filterLabelString:	Filter
*fileSelector*dirListLabelString:	Directories
*fileSelector*fileListLabelString:	Files
*fileSelector*OkLabelString:	OK
*fileSelector*ApplyLabelString:	Filter
*fileSelector*CancelLabelString:	Cancel
*fileSelector.Selection.labelString:	Selection
*fileSelector.pattern:			*.html
*fileSelector*fileTypeMask:		FILE_ANY_TYPE
*fileSelector*saveTypeBox.orientation:	HORIZONTAL
*fileSelector*formatType.labelString:	Format for Saved Document:
!*fileSelector_popup*preeditType:	overthespot

*fileBrowser_popup.title:		Netscape: File Browser
*fileBrowser*filterLabelString:		Filter
*fileBrowser*dirListLabelString:		Directories
*fileBrowser*fileListLabelString:		Files
*fileBrowser*Selection.labelString:		Selection
*fileBrowser*OkLabelString:		OK
*fileBrowser*ApplyLabelString:		Filter
*fileBrowser*CancelLabelString:		Cancel
*fileBrowser*HelpLabelString:		Help
*fileBrowser*encodingFrame*optionMenu.labelString: File Type:
*fileBrowser*encodingFrame*attachAutoDetect.labelString: Auto Detect
*fileBrowser*encodingFrame*attachBinary.labelString: Binary


*formSubmitButton.labelString:		Submit
*formResetButton.labelString:		Reset
*formButton.labelString:		Monkey Brains
*formFileBrowseButton.labelString:	Browse...

! Bookmarks popup menu. It has the same name as the main popup menu
! and hence shares the rest of the resources.
*bookmarks*popup.title.labelString:		Bookmarks
*bookmarks*popup*newFolder.labelString: New Folder...
*bookmarks*popup.saveURL.acceleratorText:

*titleSeparator.separatorType:			XmDOUBLE_LINE

! Bookmarks edit properties window.
!
*bookmarkProps_popup*title:			Netscape: Bookmark Properties
*bookmarkProps*nameLabel.labelString:		Name:
*bookmarkProps*nameLabel.alignment:		ALIGNMENT_END
*bookmarkProps*locationLabel.labelString:	Location:
*bookmarkProps*locationLabel.alignment:		ALIGNMENT_END
*bookmarkProps*descriptionLabel.labelString:	Description:
*bookmarkProps*descriptionLabel.alignment:	ALIGNMENT_END
*bookmarkProps*lastvisitedLabel.labelString:	Last Visited:
*bookmarkProps*lastvisitedLabel.alignment:	ALIGNMENT_END
*bookmarkProps*addedonLabel.labelString:	Added On:
*bookmarkProps*addedonLabel.alignment:		ALIGNMENT_END
*bookmarkProps*descriptionText.topOffset:	8
*bookmarkProps*descriptionText.columns:		40
*bookmarkProps*descriptionText.rows:		5
*bookmarkProps*aliasButton.labelString:		Select Aliases

!
! Address Book
!
*AddressBook*mainform.width:			760
*AddressBook*mainform.height:			400
*AddressBook*menuBar.Item.labelString:		Item
*AddressBook*addUser.labelString:		Add User...
*AddressBook*addUser.mnemonic:			U
*AddressBook*addList.labelString:		Add List...
*AddressBook*addList.mnemonic:			L
*AddressBook*properties.labelString:		Properties
*AddressBook*properties.mnemonic:		P
*AddressBook*queryLabel.labelString:		Type the name you are looking for:
*AddreMsgWin*toBtn.labelString:                 To:
!*AddreMsgWin*toBtn.mnemonic:					T
*AddreMsgWin*ccBtn.labelString:                 CC:
!*AddreMsgWin*ccBtn.mnemonic:					C
*AddreMsgWin*bccBtn.labelString:              	BCC:
!*AddreMsgWin*bccBtn.mnemonic:					B
*AddreMsgWin*removeBtn.labelString:           	Remove
*AddreMsgWin*addToAddressBtn.labelString:       Add to Address Book
*AddreMsgWin*propertiesBtn.labelString:     	Properties
*AddreMsgWin*delBtn.labelString:     			Delete
!*AddreMsgWin*addToAddressBtn.mnemonic:       	A
*AddressBook*dirLabel.labelString:		in:
*AddressBook*searchBtn.labelString:		Search
*AddressBook*helpBar.height:			10
*AddressBook*outline.Name:			Name
*AddressBook*outline.Nick:			Nickname
*AddressBook*outline.Secure:			Secure
*AddressBook*outline.HTML:			HTML
*AddressBook*mainform.fontList:			-*-helvetica-bold-r-*-*-*-120-*-*-*-*-koi8-r

! The mail compose window part of addr book
*mc_queryLabel.labelString:	Type the name you are looking for:
*mc_dirLabel.labelString:	in:
*mc_searchBtn.labelString:	Search
*mc_tobtn.labelString:		To:
*mc_ccbtn.labelString:		Cc:
*mc_bccbtn.labelString:		Bcc:
*mc_okbtn.labelString:		OK
*mc_cancelbtn.labelString:	Cancel

! Address Book popup menu. It has the same name as the main popup menu
! and hence shares the rest of the resources.
*AddressBook*popup.title.labelString:			Address Book
*AddressBook*popup.titleSeparator.separatorType:	XmDOUBLE_LINE


!
! Download
!
*Download*downloadURLLabel.labelString:			Source:
*Download*downloadFileLabel.labelString:		Destination:
*Download*stopLoading.labelString:				Stop
*Download*downloadURLLabel.alignment:			ALIGNMENT_END
*Download*downloadFileLabel.alignment:			ALIGNMENT_END

*Download*downloadURLLabel.topOffset:			10
*Download*downloadURLLabel.leftOffset:			10
*Download*downloadURLValue.columns:			45
*Download*downloadURLValue.editable:			False
*Download*downloadURLValue.cursorPositionVisible:	False
*Download*downloadURLValue.leftOffset:			10
*Download*downloadURLValue.rightOffset:			10

*Download*downloadFileLabel.topOffset:			5
*Download*downloadFileLabel.leftOffset:			10
*Download*downloadFileLabel.bottomOffset:		15
*Download*downloadFileValue.columns:			45
*Download*downloadFileValue.editable:			False
*Download*downloadFileValue.cursorPositionVisible:	False
*Download*downloadFileValue.leftOffset:			10
*Download*downloadFileValue.rightOffset:		10

*Download*logo.topOffset:					15
*Download*logo.rightOffset:					10
*Download*cancel.marginWidth:				15
*Download*cancel.marginHeight:				10
*Download*cancel.topOffset:					20
*Download*cancel.bottomOffset:				10


! Need class name in here to defeat *sgiMode and HP-VUE color nonsense...
! On SGIs, not having the class will cause the default SGI colors to
! be used instead of the ones specified here.  With VUE, the behavior
! is even worse - if we're using a non-default visual (for example, if
! we have requested a 24-bit TrueColor visual instead of the default
! 8-bit PseudoColor) then VUE will ignore the fact that we're not using
! the default visual, and give us colors allocated from the wrong
! colormap, resulting in lovely effects like brown-on-brown menubars!
!
! (Note: if you comment this stuff out in an attempt to let the current
! "scheme" override things, you'll find that the colors of the toolbar
! icons and the colors of form elements (like option menus) will get
! messed up.)
!Netscape*background:			#B2B2B2
Netscape*foreground:			Black
Netscape*background:			#C0C0C0

*textBackground:			#FFFFFF

! All but SGI: Set reasonable Text and List colors.
! SGI uses the default IRIX scheme colors.
Netscape*XmTextField.foreground:		Black
Netscape*XmText.foreground:		Black
Netscape*XmList.foreground:		Black
Netscape*XmTextField.background:		#FFFFFF
Netscape*XmText.background:		#FFFFFF
Netscape*XmList.background:		#FFFFFF

! On SGI, the IRIX scheme colors will override these resources,
! but we need to specify them for SGI users who turn off schemes.
! Resource color values must match the 'NOTSGI' values above.
!*XmTextField.foreground:	Black
!*XmText.foreground:		Black
!*XmList.foreground:		Black
!*XmTextField.background:	#FFFFFF
!*XmText.background:		#FFFFFF
!*XmList.background:		#FFFFFF

! Colors of the outline lists used in mail and news windows.
Netscape*XmLGrid.foreground:		#000000
Netscape*XmLGrid.background:		#C0C0C0
!Netscape*XmLGrid.selectBackground:	#FFFFCC


! Turn off borders in XmLFolder widgets.
Netscape*XmLFolder.highlightThickness: 0

! Colors of the "Secure Document" bar.
!*secureDocumentColor:			#0000BF
!*insecureDocumentColor:			#0C0C0C

! Default for all buttons
Netscape*XmPushButton*shadowThickness:	2
Netscape*XmPushButtonGadget*shadowThickness: 2

! And for option menus:
Netscape*XmCascadeButton.shadowThickness: 2
Netscape*XmCascadeButtonGadget.shadowThickness: 2

!!
!! *logo
!!
*logo.animationInterval:		150
*logo.marginBottom:				0
*logo.marginLeft:				0
*logo.marginRight:				0
*logo.marginTop:				0
*logo.shadowThickness:			1
*logo.documentationString:		Netscape Communications Corporation home page
*logo.tipString:				Go to Netscape

*historyMenuBox.marginHeight:	0
*historyMenuBox.marginWidth:	0

*characterToolbarFrame.leftOffset:	2
*paragraphToolbarFrame.leftOffset:	2
*composeToolbarFrame.leftOffset:	2

*topPane.shadowThickness:		2
*bottomPane.shadowThickness:		2
*topPane.shadowType:			SHADOW_IN
*bottomPane.shadowType:			SHADOW_IN

! Go ahead, try and figure out why some of these need to be on the
! _popup version, and some need to be one level deeper.  I dare you.
!*dialog.width:				500
!*history.width:			500
!*mailto.width:				500
!*cache_popup.width:			500
*userConfig_popup.width:		500
*userConfig.width:			500
*fileSelector.width:			500
*fileBrowser.width:			500

! I had to hardcode this in the C code - doesn't work from here...
!*history_popup.allowShellResize:	False

! Get rid of all navigation; it's totally broken for Paned windows,
! and for the form widgets under the drawingArea.
*highlightThickness:			0
*navigationType:			NONE

! Uh, but turn it back on in the popups (really I'd like to turn it off
! in all non-popups, but I don't think there's a way to specify that...)
*XmDialogShell*highlightThickness:	2
*XmDialogShell*navigationType:		TAB_GROUP

! Mail compose needs TAB_GROUP
!*Composition*form.navigationType:       TAB_GROUP
*mailcompose_container*XmText.navigationType:           TAB_GROUP
*mailcompose_container*XmTextField.navigationType:      TAB_GROUP

! Uh, and turn it on only in text fields of forms.
! But of course this doesn't work quite right.
*drawingArea*XmText.navigationType:	TAB_GROUP
*drawingArea*XmTextField.navigationType:TAB_GROUP

! Sorry, things don't display properly if you configure Netscape to put its
! scrollbars on the left or top of the document area.
Netscape*scroller.scrollBarPlacement:	BOTTOM_RIGHT

! Put scrollbars right next to text fields in forms (and lists).
*drawingArea*XmScrolledWindow.spacing:			0

! Do not under any circumstances change the following line:
Netscape.version: 		4.8


! ============================================================================
! Fonts in the widgets.
! These fonts are all down in Motif land, and thus are not controlled by the
! font selector on the Preferences dialog.  That applies only to fonts in
! the document display area.
! ============================================================================
!
*fontList:			-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-koi8-r

*XmTextField.fontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-koi8-r
*XmText.fontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-koi8-r
*XmList*fontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-koi8-r

! SGI default:
!*menuBar*fontList:		-*-helvetica-bold-o-*-*-*-120-*-*-*-*-iso8859-*
! Sensible default:
!*menuBar*fontList:		-*-lucida-medium-r-normal-*-*-120-*-*-*-*-iso8859-*

*menuBar*historyTruncated.fontList:\
				-*-helvetica-medium-o-*-*-*-120-*-*-*-*-iso8859-*
*popup*fontList:		-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-koi8-r

!*topArea*fontList:		-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
!*topArea*XmTextField.fontList:	-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*
!*topArea*XmText.fontList:	-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*

!*bookmark*fontList:	      -*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
!*bookmark*fontList:	        -*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
!*bookmark*selectedLabel.fontList:\
			      -*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
!*bookmark*XmTextField.fontList:	-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*
!*bookmark*XmText.fontList:	-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*docinfoButton.fontList:      -*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
*mailto*urlLabel.fontList:    -*-helvetica-medium-r-*-*-*-140-*-*-*-*-iso8859-*

*licenseDialog*text.fontList:	-adobe-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*

! These are the fonts used in the outline lists used in Mail, News, Bookmarks,
! and Address Book windows.  (Note that there can't be any whitespace after
! the commas.)

! For non-SUN platforms, user can accept font size to be 10 pt on the message list
Netscape*XmLGrid*fontList:\
-*-helvetica-medium-r-*-*-*-100-*-*-*-*-koi8-r,\
-*-helvetica-bold-r-*-*-*-100-*-*-*-*-koi8-r=BOLD,\
-*-helvetica-medium-o-*-*-*-100-*-*-*-*-koi8-r=ITALIC

! For SUN platforms, user wants default font size to be 12 pt on the message list to be readable
!Netscape*XmLGrid*fontList:\
-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*,\
-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*=BOLD,\
-*-helvetica-medium-o-*-*-*-120-*-*-*-*-iso8859-*=ITALIC

! Font for the Mail/News banner
! For non-SUN platforms, user can accept font size to be 10 pt to be default on the message list
Netscape*banner*folderDropdown*XmLabel.fontList: -*-courier-bold-r-*-*-*-100-*-*-*-*-koi8-r
Netscape*banner*folderDropdown*fontList:\
-*-courier-medium-r-*-*-*-100-*-*-*-*-koi8-r,\
-*-courier-bold-r-*-*-*-100-*-*-*-*-koi8-r=BOLD

Netscape*banner*title.fontList:		-*-helvetica-bold-r-*-*-*-100-*-*-*-*-koi8-r
Netscape*banner*subtitle.fontList:	-*-helvetica-medium-r-*-*-*-100-*-*-*-*-koi8-r
Netscape*banner*info.fontList:	-*-helvetica-medium-r-*-*-*-100-*-*-*-*-koi8-r

! For SUN platforms, user wants default font size to be 12 pt on the message list to be readable
!Netscape*banner*folderDropdown*XmLabel.fontList: -adobe-courier-bold-r-*-*-*-120-*-*-*-*-iso8859-*
!Netscape*banner*folderDropdown*.fontList:\
-adobe-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*,\
-adobe-courier-bold-r-*-*-*-120-*-*-*-*-iso8859-*=BOLD

!Netscape*banner*title.fontList:		-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
!Netscape*banner*subtitle.fontList:	-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
!Netscape*banner*info.fontList:	-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*banner*folderDropdown*shadowThickness: 1
! Font for the Thread window expando flippy label
*arrowlabel.fontList:		-*-helvetica-medium-r-*-*-*-120-*-*-*-*-koi8-r

! Font for the attachment panel icon label
! need class name to defeat *sgiMode
Netscape*attachItemLabel*fontList:	-*-helvetica-medium-r-*-*-*-120-*-*-*-*-koi8-r

! This is the default charset for the View | Character Set menu.
! The following values have special meanings:
!   iso-2022-jp: Japanese (Auto-Detect)
!   iso-2022-kr: Korean (Auto-Detect)
!
*defaultCharset:	iso-8859-1
!*defaultCharset:	iso-8859-2
!*defaultCharset:	windows-1250
!*defaultCharset:	iso-2022-jp
!*defaultCharset:	shift_jis
!*defaultCharset:	euc-jp
!*defaultCharset:	big5
!*defaultCharset:	x-euc-tw
!*defaultCharset:	gb2312
!*defaultCharset:	iso-2022-kr
!*defaultCharset:	iso-8859-5
!*defaultCharset:	koi8-r
!*defaultCharset:	windows-1251
!*defaultCharset:	iso-8859-7
!*defaultCharset:	windows-1253
!*defaultCharset:	iso-8859-9
!*defaultCharset:	utf-8
!*defaultCharset:	utf-7



! ============================================================================
! Fonts used in the display area.
! ============================================================================


! Default fonts for various charsets, prop(ortional) and fixed.
!
! Format is foundry-family-pointsize-scaling.
! Pointsize is in tenths of a point.
! Scaling is either "scale" or "noscale".
!
! These are only used the first time you start up.
! After that, the preferences file is used.
! The "Defaults" button in the Preferences dialog will revert to these.
!
*documentFonts.defaultFont*iso-8859-1.prop:	adobe-times-120-noscale
*documentFonts.defaultFont*iso-8859-1.fixed:	adobe-courier-100-noscale

*documentFonts.defaultFont*UTF-8.prop:	nsPseudoFont-times-120-noscale
*documentFonts.defaultFont*UTF-8.fixed:	nsPseudoFont-courier-100-noscale


! This table maps weight/slant pairs to bold/italic/boldItalic/normal
!
*documentFonts.face*-:			normal
*documentFonts.face*bold-i:		boldItalic
*documentFonts.face*bold-o:		boldItalic
*documentFonts.face*bold-r:		bold
*documentFonts.face*book-o:		italic
*documentFonts.face*book-r:		normal
*documentFonts.face*demi-i:		boldItalic
*documentFonts.face*demi-o:		boldItalic
*documentFonts.face*demi-r:		bold
*documentFonts.face*demibold-i:		boldItalic
*documentFonts.face*demibold-r:		bold
*documentFonts.face*light-i:		italic
*documentFonts.face*light-r:		normal
*documentFonts.face*medium-i:		italic
*documentFonts.face*medium-o:		italic
*documentFonts.face*medium-r:		normal
*documentFonts.face*medium-roman:	normal
*documentFonts.face*normal-i:		italic
*documentFonts.face*normal-r:		normal
*documentFonts.face*regular-i:		italic
*documentFonts.face*regular-r:		normal
*documentFonts.face*roman-r:		normal
*documentFonts.face*w3-r:		normal
*documentFonts.face*w3h-r:		normal
*documentFonts.face*w4-r:		normal
*documentFonts.face*w5-r:		normal
*documentFonts.face*w9-r:		normal


! This table maps XLFD family names to nice family names
!
*documentFonts.family*djb:			DJB
*documentFonts.family*haebfix:			Haeberli Fixed
*documentFonts.family*itc avant garde gothic:	ITC Avant Garde Gothic
*documentFonts.family*itc bookman:		ITC Bookman
*documentFonts.family*itc zapf chancery:	ITC Zapf Chancery
*documentFonts.family*itc zapf dingbats:	ITC Zapf Dingbats
*documentFonts.family*lucidatypewriter:		Lucida Typewriter


! This table maps XLFD foundry names to nice foundry names
!
*documentFonts.foundry*b&h:	B&H
*documentFonts.foundry*dec:	DEC
*documentFonts.foundry*hku:	HKU
*documentFonts.foundry*sgi:	SGI
*documentFonts.foundry*nsPseudoFont:	NSPseudoFonts


! This table maps MIME charsets to language groups
!
*documentFonts.charsetlang*gb_2312-80:			Simplified Chinese
*documentFonts.charsetlang*iso-8859-1:			Western
*documentFonts.charsetlang*iso-8859-2:			Central European
*documentFonts.charsetlang*iso-8859-5:			Cyrillic
*documentFonts.charsetlang*iso-8859-7:			Greek
*documentFonts.charsetlang*iso-8859-9:			Turkish
*documentFonts.charsetlang*jis_x0201:			Japanese
*documentFonts.charsetlang*jis_x0208-1983:		Japanese
*documentFonts.charsetlang*jis_x0212-1990:		Japanese
*documentFonts.charsetlang*koi8-r:			Cyrillic
*documentFonts.charsetlang*ks_c_5601-1987:		Korean
*documentFonts.charsetlang*x-cns11643-1110:		Traditional Chinese
*documentFonts.charsetlang*x-cns11643-1:		Traditional Chinese
*documentFonts.charsetlang*x-cns11643-2:		Traditional Chinese
*documentFonts.charsetlang*x-gb2312-11:			Simplified Chinese
*documentFonts.charsetlang*x-jisx0208-11:		Japanese
*documentFonts.charsetlang*x-ksc5601-11:		Korean
*documentFonts.charsetlang*x-x-big5:			Traditional Chinese
*documentFonts.charsetlang*unicode-2-0:			Unicode


! This table maps X11 font charsets to MIME charsets
!
*documentFonts.charset*-:					x-ignore
*documentFonts.charset*-ascii:					x-ignore
*documentFonts.charset*-dingbats:				x-ignore
*documentFonts.charset*-hiragana:				x-ignore
*documentFonts.charset*-ibm pc:					x-ignore
*documentFonts.charset*-katakana:				x-ignore
*documentFonts.charset*-roman:					x-ignore
*documentFonts.charset*-symbol:					x-ignore
*documentFonts.charset*78-h:					x-ignore
*documentFonts.charset*78.euc-h:				x-ignore
*documentFonts.charset*add-h:					x-ignore
*documentFonts.charset*adobe.cns1-0:				x-ignore
*documentFonts.charset*adobe.gb1-0:				x-ignore
*documentFonts.charset*adobe.japan1-0:				x-ignore
*documentFonts.charset*adobe.japan1-1:				x-ignore
*documentFonts.charset*adobe.japan1-2:				x-ignore
*documentFonts.charset*adobe.japan2-0:				x-ignore
*documentFonts.charset*adobe.korea1-0:				x-ignore
*documentFonts.charset*big5-0:					x-x-big5
*documentFonts.charset*big5.et-0:				x-x-big5
*documentFonts.charset*big5.et.ext-0:				x-x-big5
*documentFonts.charset*big5.etext-0:				x-x-big5
*documentFonts.charset*big5.hku-0:				x-x-big5
*documentFonts.charset*big5.hku-1:				x-x-big5
*documentFonts.charset*big5.pc-0:				x-x-big5
*documentFonts.charset*big5.shift-0:				x-x-big5
*documentFonts.charset*cmr.sun-fontspecific:			x-ignore
*documentFonts.charset*cns11643-0:				x-cns11643-1
*documentFonts.charset*cns11643-1:				x-cns11643-2
*documentFonts.charset*cns11643.1986-1:				x-cns11643-1
*documentFonts.charset*cns11643.1986-2:				x-cns11643-2
*documentFonts.charset*cns11643.1992-1:				x-cns11643-1
*documentFonts.charset*cns11643.1992-2:				x-cns11643-2
*documentFonts.charset*cns11643.1992.1-0:			x-cns11643-1
*documentFonts.charset*cns11643.1992.2-0:			x-cns11643-2
*documentFonts.charset*dec-decctrl:				x-ignore
*documentFonts.charset*dec-decksroman:				x-ignore
*documentFonts.charset*dec-decmath_extension:			x-ignore
*documentFonts.charset*dec-decmath_italic:			x-ignore
*documentFonts.charset*dec-decmath_symbol:			x-ignore
*documentFonts.charset*dec-decsuppl:				x-ignore
*documentFonts.charset*dec-dectech:				x-ignore
*documentFonts.charset*dec-drcs:				x-ignore
*documentFonts.charset*dec-fontspecific:			x-ignore
*documentFonts.charset*dec.cns11643.1986-2:			x-cns11643-1110
*documentFonts.charset*dec.cns11643.1986-udc:			x-ignore
*documentFonts.charset*dec.dtscs.1990-2:			x-ignore
*documentFonts.charset*euc-h:					x-ignore
*documentFonts.charset*ext-h:					x-ignore
*documentFonts.charset*gb2312.1980-0:				gb_2312-80
*documentFonts.charset*gb2312.1980-1:				x-gb2312-11
*documentFonts.charset*gb2312.1980-udc:				x-ignore
*documentFonts.charset*hojo-h:					x-ignore
*documentFonts.charset*hp-japanese15:				x-ignore
*documentFonts.charset*hp-japaneseeuc:				x-ignore
*documentFonts.charset*hp-roman8:				x-ignore
*documentFonts.charset*hpbig5-:					x-x-big5
*documentFonts.charset*ibm-850:					x-ignore
*documentFonts.charset*ibm-fontspecific:			x-ignore
*documentFonts.charset*ibm-ibmcs01007ext:			x-ignore
*documentFonts.charset*ibm-special:				x-ignore
*documentFonts.charset*ibm-udcjp:				x-ignore
*documentFonts.charset*iso646.1991-irv:				x-ignore
*documentFonts.charset*iso8859-1:				iso-8859-1
*documentFonts.charset*iso8859-2:				iso-8859-2
*documentFonts.charset*iso8859-3:				x-ignore
*documentFonts.charset*iso8859-4:				x-ignore
*documentFonts.charset*iso8859-5:				iso-8859-5
*documentFonts.charset*iso8859-6:				x-ignore
*documentFonts.charset*iso8859-7:				iso-8859-7
*documentFonts.charset*iso8859-8:				x-ignore
*documentFonts.charset*iso8859-9:				iso-8859-9
*documentFonts.charset*iso8859-adobe:				x-ignore
*documentFonts.charset*itc zapf dingbats.adobe-fontspecific:	x-ignore
*documentFonts.charset*itc zapfdingbats.sun-fontspecific:	x-ignore
*documentFonts.charset*jisx0201-romankana:			x-ignore
*documentFonts.charset*jisx0201.1976-0:				jis_x0201
*documentFonts.charset*jisx0201.1976-1:				jis_x0201
*documentFonts.charset*jisx0208-kanji00:			x-ignore
*documentFonts.charset*jisx0208-kanji11:			x-ignore
*documentFonts.charset*jisx0208.1983-0:				jis_x0208-1983
*documentFonts.charset*jisx0208.1983-1:				x-jisx0208-11
*documentFonts.charset*jisx0208.1990-0:				jis_x0208-1983
*documentFonts.charset*jisx0212.1990-0:				jis_x0212-1990
*documentFonts.charset*jisx0212.1990-ocmp.1992:			jis_x0212-1990
*documentFonts.charset*koi8-1:					koi8-r
*documentFonts.charset*koi8-r:					koi8-r
*documentFonts.charset*ks-roman:				x-ignore
*documentFonts.charset*ksc5601.1987-0:				ks_c_5601-1987
*documentFonts.charset*ksc5601.1987-1:				x-ksc5601-11
*documentFonts.charset*misc-fontspecific:			x-ignore
*documentFonts.charset*necjisx0208.1983-0:			x-ignore
*documentFonts.charset*novanet-1:				x-ignore
*documentFonts.charset*nwp-h:					x-ignore
*documentFonts.charset*pimai.adobe-fontspecific:		x-ignore
*documentFonts.charset*rksj-h:					x-ignore
*documentFonts.charset*screen.sun-fontspecific:			x-ignore
*documentFonts.charset*sgi-fontspecific:			x-ignore
*documentFonts.charset*shiftjis-0:				x-ignore
*documentFonts.charset*sunolcursor-1:				x-ignore
*documentFonts.charset*sunolglyph-1:				x-ignore
*documentFonts.charset*symbol.adobe-fontspecific:		x-ignore
*documentFonts.charset*symbol.sun-fontspecific:			x-ignore
*documentFonts.charset*tis620.2533-1:				x-ignore
*documentFonts.charset*ucs2.cjk-rest:				x-ignore
*documentFonts.charset*ucs2.cns11643.1986-1:			x-ignore
*documentFonts.charset*ucs2.cns11643.1986-2:			x-ignore
*documentFonts.charset*ucs2.gb2312.1980-0:			x-ignore
*documentFonts.charset*ucs2.ibm-udccn:				x-ignore
*documentFonts.charset*wp-symbol:				x-ignore
*documentFonts.charset*zapfdingbats.adobe-fontspecific:		x-ignore


! There are 7 font sizes, 1 thru 7.  The default font is 3, and the others
! are based on this.  The default increment is 20%, which means that the 4
! is 20% larger than the 3, the 5 is 40% larger, and so on.
!
*documentFonts.sizeIncrement:	20

! Maximum size to scale fonts, in points.
*documentFonts.maximumPoints: 200

! CSS-1 generic font family mapping
! to change the defaults, uncomment and give a different family name
! *documentFonts.generic.serif: times
! *documentFonts.generic.sans-serif: helvetica
! *documentFonts.generic.cursive: itc zapf chancery
! *documentFonts.generic.fantasy: new century schoolbook
! *documentFonts.generic.monospace: courier

! Some people have both 75 DPI (dots per inch) and 100 DPI versions of the
! same fonts in their font path, and, to make matters even worse, they have
! the 75 before the 100 even if their monitor is around 100 DPI.  The
! following is provided so that these people can hack their fonts without
! having to correct their font path.
!
! To correct your font path, take a look at
!   http://home.netscape.com/assist/support/client/tn/unix/10305.html
! which is a Technical Note linked from Help->Frequently Asked Questions.
!
! The last part of the left hand side (iso-8859-1) is the MIME charset
! corresponding to the X11 font charset (see above).
!
! To use e.g. 100 DPI fonts, change the final "*" to "100".
!
*documentFonts.xResolution*iso-8859-1:	*
*documentFonts.yResolution*iso-8859-1:	*


! ============================================================================
! Fonts used for printing.
! ============================================================================
!
! psname  is the full PostScript font name
! pscode  is the character encoding used in the PostScript font
! pswidth is the PostScript width per character, only useful for "square"
!         fonts such as those found in East Asia


! The following Latin-1 PostScript printer fonts are hard-coded into Netscape
! and cannot be changed.
!
!*documentFonts.latin1.variable.normal*psname:		Times-Roman
!*documentFonts.latin1.variable.bold*psname:		Times-Bold
!*documentFonts.latin1.variable.italic*psname:		Times-Italic
!*documentFonts.latin1.variable.boldItalic*psname:	Times-BoldItalic
!*documentFonts.latin1.fixed.normal*psname:		Courier
!*documentFonts.latin1.fixed.bold*psname:		Courier-Bold
!*documentFonts.latin1.fixed.italic*psname:		Courier-Oblique
!*documentFonts.latin1.fixed.boldItalic*psname:		Courier-BoldOblique
!*documentFonts.latin1*pscode:				iso-8859-1
!*documentFonts.latin1*pswidth:				*


! Netscape does not differentiate between variable and fixed, and between
! normal, bold, italic and boldItalic for the following East Asian fonts.
!
! The charset fields are the charset names corresponding to the available
! locales (e.g. for Japan, that would be euc-jp and shift_jis).
!
*documentFonts.euc-jp*psname:		Ryumin-Light-RKSJ-H
*documentFonts.euc-jp*pscode:		shift_jis
*documentFonts.euc-jp*pswidth:		1000
*documentFonts.euc-jp*psascent:		950

*documentFonts.shift_jis*psname:	Ryumin-Light-RKSJ-H
*documentFonts.shift_jis*pscode:	shift_jis
*documentFonts.shift_jis*pswidth:	1000
*documentFonts.shift_jis*psascent:	950

*documentFonts.EUC-KR*psname:		SMgoJ
*documentFonts.EUC-KR*pscode:		euc-kr
*documentFonts.EUC-KR*pswidth:		1000
*documentFonts.EUC-KR*psascent:		950

!*documentFonts.gb2312*psname:		???
!*documentFonts.gb2312*pscode:		???
!*documentFonts.gb2312*pswidth:		???
!*documentFonts.gb2312*psascent:	???

!*documentFonts.x-euc-tw*psname:	???
!*documentFonts.x-euc-tw*pscode:	???
!*documentFonts.x-euc-tw*pswidth:	???
!*documentFonts.x-euc-tw*psascent:	???

! Unicode Pseudo Font
! These map a Unicode Pseudo Font 
! latin-1 font name to an equivalent 
! font name for a different encoding
*unicodeFont.helvetica*jis_x0208-1983:        gothic
*unicodeFont.helvetica*jis_x0201:             gothic
*unicodeFont.times*jis_x0208-1983:            mincho
*unicodeFont.times*jis_x0201:                 mincho
*unicodeFont.courier*jis_x0208-1983:          fixed
*unicodeFont.courier*jis_x0201:               fixed
*unicodeFont.lucida*jis_x0208-1983:           gothic
*unicodeFont.lucida*jis_x0201:                gothic
*unicodeFont.lucidatypewriter*jis_x0208-1983: gothic
*unicodeFont.lucidatypewriter*jis_x0201:      gothic
*unicodeFont.allowHPScaling:                  false
!*unicodeFont.screenDpi:                       100
!*javaFont.usePointSizing:                     false
!*javaFont.screenDpi:                          100


*scrollerX*VertScrollBar.width:		10
*scrollerX*VertScrollBar.height:	100

! Mail search dialog...
*MNSearch.title:                          Netscape: Search
*MNSearch.iconName:                       Search
*MNSearch*SearchBtn.labelString:          Search
*MNSearch*NewBtn.labelString:             Clear 
*MNSearch*MiscBtn.labelString:            Options...
*MNSearch*HelpBtn.labelString:		  Help
*MNSearch*SaveAsBtn.labelString:          Save As...
*MNSearch*CloseBtn.labelString:           Close
*matchAll.labelString:           Match all of the following
*matchAny.labelString:           Match any of the following
*MNSearch*SaveAsDialogTextLabel.labelString:	      	Newsgroup Name:
*searchSaveAsPromptDialog.dialogTitle:		Netscape: Save As Virtual Newsgroup
*MNSearch*SaveAsDialogInfo.labelString:	Saving search criteria will create a Virtual Newsgroup based on that\n\criteria. The Virtual Newsgroup will be available from the folder list in\n\the Messenger window.

*where.labelString:                       where
*MNSearch*searchFolderLabel.labelString:  Search for messages in
*MNSearch*itemsLabelTitle.labelString:    Total items found:
*MNSearch.width:     			  650
! needs to match up with XFE_SEARCH_DATE_FORMAT in ns/cmd/xfe/xfe_err.h
*MNSearch*labelValueField.labelString:    mm/dd/yyyy
*MNSearch*moreBtn.labelString:		  More
*MNSearch*lessBtn.labelString:		  Fewer
*MNSearch*searchContent.marginWidth:	  5
*MNSearch*searchContent.marginHeight:	  5
*MNSearch*resultComment.topOffset: 	  4
*MNSearch*goToMessageFolder.labelString:  Open Message Folder
*MNSearch*fileMsg.labelString:            File in:
*MNSearch*fileMsg.buttonLayout:           button_label_only
*MNSearch*deleteMsg.labelString:          Delete Message
*popup*copySubmenu.labelString:        	  Copy Message

! Advanced mail search (Options) dialog
*advancedSearch*subfolderToggle.labelString:	Search Subfolders
*advancedSearch*whenOnlineSearch.labelString: When online, search for messages:
*advancedSearch*searchLocalToggle.labelString:	on your local system
*advancedSearch*searchServerToggle.labelString:	on the specified server

! Ldap Search
*Ldap.title:                          	Netscape:Search Directories
*Ldap.iconName:                       	Search Directories
*Ldap*A_the1.labelString:             	the
*Ldap*A_the2.labelString:             	and the
*Ldap*SearchBtn.labelString:     	Search
*Ldap*NewBtn.labelString:     		Clear
*Ldap*MiscBtn.labelString:     		Help	
*Ldap*CloseBtn.labelString:     	Close
*Ldap*ldapSearchFolderLabel.labelString: Search for items
*Ldap*itemsLabelTitle.labelString:    	Total items found:
*Ldap.width:				650
*Ldap.height:				250
*Ldap*labelValueField.labelString:	mm/dd/yy
*Ldap*searchContent.marginWidth:	5
*Ldap*searchContent.marginHeight:	5
*Ldap*resultComment.topOffset: 		4
*Ldap*ldapCommands.marginWidth:   	10
*Ldap*ldapCommands.spacing:   		20	
*Ldap*toAddrBook.labelString:   	Add To Address Book
*Ldap*toCompose.labelString:     	Compose Message

!
! Navigator mouse documentation.
!
*tipLabel.fontList:           -*-helvetica-medium-r-*-*-*-120-*-*-*-*-koi8-r
Netscape*tipLabel.background:  #FFFFCC
Netscape*tipLabel.foreground:  Black
Netscape*tipShell.borderColor: Black
Netscape*tipShell.borderWidth: 1

!
! Browser documentation and tip strings
!

! Navigator/Toolbar (tip strings and special documentation strings)
*back.tipString:		            Go to previous page
*forward.tipString:		            Go to next page
*home.tipString:                    Go to the Home page
*home.documentationString:          Go to the Home page
*search.tipString:                  Search on the Internet
*search.documentationString:        Search the Internet for information
*MailThread*search.documentationString:  Search mail and newsgroup messages
*MailMsg*search.documentationString:  Search mail and newsgroup messages
*MailFolder*search.documentationString:  Search mail and newsgroup messages
*destinations.tipString:            Your personal start page
*destinations.documentationString:  Go to your personal start page
*guide.tipString:            Interesting places on the Internet
*guide.documentationString:  Go to interesting places on the Internet
*myshopping.tipString:		    Go to Shop@Netscape
*myshopping.documentationString:    Go to Shop@Netscape
*showImages.tipString:              Display images on this page
*reload.tipString:                  Reload this page from the server
*stopLoading.tipString:             Stop the current transfer

!
! Some mail/news documentation and tip strings
!
!*MailFolder*stopLoading.tipString:  Stop downloading messages
!*MailFolder*search.documentationString:	Search mail and newsgroup messages
!*MailThread*search.documentationString:	Search mail and newsgroup messages
!*MailMsg*search.documentationString:	Search mail and newsgroup messages

!!
!! *urlBarItem
!!
*urlBarItem.shadowType:					shadow_out
*urlBarItem.shadowThickness:			1
*urlBarItem.marginLeft:					1
*urlBarItem.marginRight:				1
*urlBarItem.marginTop:					1
*urlBarItem.marginBottom:				1

!!
!! *bookmarkQuickfile
!!
*bookmarkQuickfile.labelString:			Bookmarks
*bookmarkQuickfile.tipString:			Bookmark QuickFile
*bookmarkQuickfile.documentationString:	Bookmark QuickFile
*bookmarkQuickfile.topOffset:			2
*bookmarkQuickfile.leftOffset:			2
*bookmarkQuickfile.buttonLayout:		button_label_on_right
*bookmarkQuickfile.mappingDelay:		0

!!
!! *relatedItems
!!
*relatedItems.labelString:				What's Related
*relatedItems.tipString:				What's Related
*relatedItems.documentationString:		What's Related
*relatedItems.topOffset:				2
*relatedItems.leftOffset:				2
*relatedItems.buttonLayout:				button_label_on_right

!!
!! *urlLocationProxyIcon
!!
*urlLocationProxyIcon.tipString:	\
Drag this to create a link to this page
*urlLocationProxyIcon.documentationString:	\
Drag this to create a link to this page
*urlLocationProxyIcon.topOffset:		3
*urlLocationProxyIcon.leftOffset:		3
*urlLocationProxyIcon.cursor:			hand2

*urlLocationProxyIcon.shadowThickness:			0
*urlLocationProxyIcon.raiseBorderThickness:		0
*urlLocationProxyIcon.fillOnArm:				false
*urlLocationProxyIcon.buttonLayout:				button_pixmap_only


!!
!! *urlLocationLabel
!!
*urlLocationLabel.alignment:				alignment_end
*urlLocationLabel.recomputeSize:			False
*urlLocationLabel.marginHeight:				0
*urlLocationLabel.leftOffset:				4


*urlLocationLabel.netsiteLabelString:		Netsite:
*urlLocationLabel.uneditedLabelString:		Location:
*urlLocationLabel.editedLabelString:		Go To:

! this must be the longer of the two...
*urlLocationLabel.labelString:				Location:

!!
!! Fixed Quickfile items
!!
*bookmarkQuickfile*addBookmark.labelString:				Add Bookmark
*bookmarkQuickfile*addBookmark.mnemonic:					A
*bookmarkQuickfile*addBookmark.acceleratorText:			Alt+K

*bookmarkQuickfile*openBookmarks.labelString:				Edit Bookmarks...
*bookmarkQuickfile*openBookmarks.mnemonic:					E
*bookmarkQuickfile*openBookmarks.acceleratorText:			Alt+B

*bookmarkQuickfile*fileBookmarksSubmenu.labelString:		File Bookmark
*bookmarkQuickfile*fileBookmarksSubmenu.mnemonic:	        F

!!
!! *personalToolbarItem
!!
*personalToolbarItem.shadowType:				shadow_out
*personalToolbarItem.shadowThickness:			1
*personalToolbarItem.marginLeft:				1
*personalToolbarItem.marginRight:				1
*personalToolbarItem.marginTop:					1
*personalToolbarItem.marginBottom:				1

*personalToolbar.shadowThickness:				0
*personalToolbar.marginLeft:					0
*personalToolbar.marginRight:					0
*personalToolbar.marginTop:						0
*personalToolbar.marginBottom:					0

*personalToolbar.spacing:						1
*personalToolbar.raiseBorderThickness:			2

*personalToolbar*XfeButton.marginBottom:		1
*personalToolbar*XfeButton.marginLeft:			1
*personalToolbar*XfeButton.marginRight:			1
*personalToolbar*XfeButton.marginTop:			1
*personalToolbar*XfeButton.shadowThickness:		1

*personalToolbar*XfeCascade.marginBottom:		1
*personalToolbar*XfeCascade.marginLeft:			1
*personalToolbar*XfeCascade.marginRight:		1
*personalToolbar*XfeCascade.marginTop:			1
*personalToolbar*XfeCascade.shadowThickness:	1
*personalToolbar*XfeCascade.mappingDelay:		0

*personalToolbar*toolBarSeparator.shadowThickness:		0
*personalToolbar*toolBarSeparator.width:				20
*personalToolbar*toolBarSeparator.height:				2
*personalToolbar*toolBarSeparator.orientation:			horizontal


! Navigator/Dashboard
*docinfoLabel.documentationString:	\
Security indicator, document is secure when doorkey is unbroken
*docinfoLabel.tipString:            Security Indicator
*biffButton.documentationString:    Launch mail window, and check for new mail
*biffButton.tipString:              Check Mail

! Editor/Toolbar
*editorNewBlank.tipString:          New Document
*editorOpenFile.tipString:          Open File
*save.tipString:                    Save
*browsePage.tipString:              View in Browser
*editorBrowse.tipString:            View in Browser
*cut.tipString:                     Cut
*copy.tipString:                    Copy
*paste.tipString:                   Paste
*publish.tipString:                 Publish Document
*findInObject.tipString:            Find in Page <Alt+F>
*Editor*openPage.tipString:         Open File

*findInObject.tipString:            Find in Page <Alt+F>

*editorFormattingToolbar*buttonLayout:	button_pixmap_only
*editorFormattingToolbar*buttonLayout:	button_pixmap_only
*editorFormattingToolbar*mappingDelay:	0

*charSizeShrink.documentationString: Decrease font size 1 unit
*charSizeShrink.tipString:          Decrease Font Size
*charSizeGrow.documentationString:  Increase font size 1 unit
*charSizeGrow.tipString:            Increase Font Size
*fontSize.documentationString:      Set font size
*fontSize.tipString:                Set Font Size
!*bold.documentationString:         Set the style to Bold <Alt+B>
*bold.tipString:                    Bold
!*italic.documentationString:       Set the style to Italic <Alt+I>
*italic.tipString:                  Italic
!*fixed.documentationString:        Set the style to Fixed Width <Alt+T>
*fixed.tipString:                   Fixed Width
!*textColor.documentationString:    Change or edit current font color
*textColor.tipString:               Font Color
*makeLink.documentationString:		\
Make link to highlighted text, change existing link(s), or insert new link
*makeLink.tipString:				Make Link
*insertLink.tipString:				Insert or Make Link
*clearAllStyles.tipString:          Clear All Styles <Alt+K>
*insertTarget.documentationString:  Insert a Target (Named Anchor)
*insertTarget.tipString:            Insert Target (Named Anchor)
*insertImage.documentationString:   Insert Image at current cursor location
*insertImage.tipString:             Insert Image
*insertHorizontalLine.documentationString:	\
Insert Horizontal Line at current cursor location
*insertHorizontalLine.tipString:    Insert Horizontal Line
*insertTable.documentationString:   Insert table at the insertion location
*insertTable.tipString:             Insert Table
*objectProperties.documentationString:	\
Change Properties of object at caret position
*objectProperties.tipString:        Object Properties

*paragraphProperties.documentationString: Change paragraph or heading style
*paragraphProperties.tipString:     Change Paragraph style
*insertBulleted.documentationString:	\
Start, change to, or clear an unnumbered (bulleted) list
*insertBulleted.tipString:          Bullet List
*insertNumbered.documentationString:	\
Start, change to, or clear a numbered list
*insertNumbered.tipString:          Numbered List
*indent.documentationString:	\
Increase indent of paragraph one level <Alt+=>
*indent.tipString:                  Increase Indent
*outdent.documentationString:	\
Decrease indent of paragraph one level <Alt+->
*outdent.tipString:                 Decrease Indent
*alignLeft.documentationString:     Align to left margin
*setAligmentStyleLeft.documentationString: Align to left margin
*alignLeft.tipString:               Align Left
*alignCenter.documentationString:   Center between margins
*setAligmentStyleCenter.documentationString: Center between margins
*alignCenter.tipString:             Align Center
*alignRight.documentationString:    Align to right margin
*setAligmentStyleRight.documentationString: Align to right margin
*alignRight.tipString:              Align Right

! Formatting toolbar
*setParagraphStyle*documentationString: \
Change paragraph or heading style
*setParagraphStyle*tipString:       Paragraph Style
*setFontFace*documentationString:   Change font face
*setFontFace*tipString:             Font
*setFontSize*documentationString:   Change font size
*setFontSize*tipString:             Font Size
*setFontColor*documentationString:  Change font color
*setFontColor*tipString:            Font Color
*setFontColor*documentationString:  Change font color
*setFontColor*tipString:            Font Color
*toggleCharacterStyleBold.tipString: Bold <Alt+B>
*toggleCharacterStyleItalic.tipString: Italic <Alt+I>
*toggleCharacterStyleUnderline.tipString: Underline <Alt+U>
*insertNumberedList.tipString:      Numbered List
*insertNumberedList.documentationString: \
Start, change, or clear a numbered list
*insertBulletedList.tipString:      Bullet List
*insertBulletedList.documentationString: Start, change, or clear a bullet list
*setAlignmentStyle.tipString:       Alignment
*setAlignmentStyle.documentationString: Choose horizontal alignment
*insertLineBreak.documentationString: \
Insert break to continue text on new line
*insertBreakBelowImage.documentationString: \
Insert break to continue text below images to the left and the right
*setCharacterColor.documentationString: Change the current text color
*editorGoodiesMenu.tipString:           Insert Object
*editorGoodiesMenu.documentationString: Insert object

! Editor/Popups (additional items)
*browseLink.documentationString:    Browse this link
*editLink.documentationString:      Open this link in a new editor window
*bookmarkLink.documentationString:  Add this link to the bookmark list  
*copyLink.documentationString:      Copy this link to the clipboard
*removeLink.documentationString:	\
Remove link at caret or all links within selected region

! Mail/Toolbar
*getNewMail.tipString:              Get new mail
*deleteMessage.tipString:           Delete the selected message
*mailNew.tipString:                 Compose new message
*replyToSender.tipString:           Reply to the message
*replyToAll.tipString:              Reply to all recipients
*forwardMessage.tipString:          Forward the selected message
*previousUnreadMessage.tipString:   Previous unread message
*nextUnreadMessage.tipString:       Next unread message

! Composition/Edit menu (additional items)
*pasteQuote.documentationString:    Insert clipboard contents in quoted form
*clear.documentationString:         Erase the selection
*clearAllText.documentationString:  Erase everything
*selectAllText.documentationString: Select the entire document
*rot13.documentationString:         Rotate message text by 13 characters

! Composition/View menu (additional items)
*showFrom.documentationString:      Show the mail-from field
*showReplyTo.documentationString:   Show reply-to field
*showTo.documentationString:        Show mail-to field
*showCC.documentationString:        Show the Carbon-Copy field
*showBCC.documentationString:       Show the Blind-Carbon-Copy field
*showFCC.documentationString:       Show the copy file location field
*showPostTo.documentationString:    Show the Post-to-newsgroup field
*showFollowupTo.documentationString: Show the Send-followups-to field
*showSubject.documentationString:   Show the subject field
*showAttachments.documentationString: Show the attachments field
*wrapLines.documentationString:		Wrap lines longer than 72 characters

! Composition/Options menu (additional items)
*deliverNow.documentationString:    Send messages immediately
*deliverLater.documentationString:  Defer sending messages until later

! Compose/Toolbar
*sendOrSendLater.documentationString: Send the current message
*sendOrSendLater.tipString:         Send Message
*quoteMessage.documentationString:	\
Paste the text of the original document in quoted form
*quoteMessage.tipString:            Quote Original

*options.labelString:	Options
*options.tipString:	Display message options

*attach.tipString:  Include an attachment 
*attachFile.documentationString:	\
Attach a file to this message
*attachFile.tipString:  Attach File
*attachWebPage.documentationString:	\
Attach a web page to this message
*attachWebPage.tipString:  Attach Web Page
*deleteAttachment.documentationString:	\
Delete selected attachment
*deleteAttachment.tipString:  Delete Attachment

*attachAddressBookCard.documentationString:	\
Attach your personal card as a vCard
*attachAddressBookCard.tipString:  Attach My Card
*attachForm.documentationString:	\
Drag a document here to attach it to this message.
*attachForm.tipString: Drag document here to attach

!*editAddressBook.documentationString: Open the address book
*editAddressBook.tipString:         Addresses

*formattingToolbar*buttonLayout:	button_pixmap_only
*formattingToolbar*buttonLayout:	button_pixmap_only
*formattingToolbar*mappingDelay:	0


! News/Toolbar
*postNew.tipString:			        Post new message
*postReply.tipString:			    Post reply
*postAndMailReply.tipString:        Post and mail reply
*markThreadRead.tipString:          Mark thread read
*markAllRead.tipString:             Mark all read

! Preferences dialog
!
*prefs*fontList:							-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*prefs_popup.title:							Netscape: Preferences
*pref.category:                             Category

*prefs.form.leftPane.topOffset:				8
*prefs.form.leftPane.leftOffset:			8
*prefs.form.leftPane.bottomOffset:			8

*prefs.form.rightPane.leftOffset:			8
*prefs.form.rightPane.rightOffset:			8
*prefs.form.rightPane.bottomOffset:			8

*prefs*pageTitle.alignment:					ALIGNMENT_BEGINNING
*prefs*pageTitle.fontList:\
-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*=NORMAL,\
-*-helvetica-bold-r-*-*-*-140-*-*-*-*-iso8859-*=BOLD,\
-*-helvetica-medium-o-normal-*-*-120-*-*-*-*-iso8859-*=ITALIC

*prefs*categoryList*fontList:				-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*

*prefs*pageForm.topOffset:					4
*prefs*XmFrame.marginWidth:					8
*prefs*XmFrame.marginHeight:				4
*prefs*XmPushButtonGadget.marginWidth:		8

! Preferences dialog - Appearance

*prefs*appearance*launchBoxLabel.labelString:	On startup, launch
*prefs*appearance*navigator.labelString:	Navigator
*prefs*appearance*messenger.labelString:	Messenger Mailbox
*prefs*appearance*collabra.labelString:		Newsgroups
*prefs*appearance*composer.labelString:		Page Composer
*prefs*appearance*conference.labelString:	Conference
*prefs*appearance*netcaster.labelString:	Netcaster
*prefs*appearance*calendar.labelString:		Calendar
*prefs*appearance*radio.labelString:		Radio	
*prefs*appearance*frame2*toolbarBoxLabel.labelString:	Show Toolbar As
*prefs*appearance*frame2*picAndText.labelString:	Pictures and Text
*prefs*appearance*frame2*picOnly.labelString:		Pictures Only
*prefs*appearance*frame2*textOnly.labelString:	Text Only
*prefs*appearance*frame2*showTooltips.labelString:	Show ToolTips
*prefs*appearance*frame2*showTooltips.tipString:	Toggle Toolbar Tips
*prefs*appearance*underline.labelString:		Underline Links

! Preferences dialog - General/Fonts

*prefs*fontsFrame*fontsBoxLabel.labelString:	Fonts and Encodings
*prefs*fontsFrame*encodingLabel.labelString:	For the Encoding:
*prefs*fontsFrame*proportionalLabel.labelString:Variable Width Font:
*prefs*fontsFrame*propSizeLabel.labelString:	Size:
*prefs*fontsFrame*propSizeToggle.labelString:	Allow Scaling
*prefs*fontsFrame*fixedLabel.labelString:		Fixed Width Font:
*prefs*fontsFrame*fixedSizeLabel.labelString:	Size:
*prefs*fontsFrame*fixedSizeToggle.labelString:	Allow Scaling
*prefs*fontsFrame*0.labelString:				Any
*prefs*webFontFrame*useFontLabel.labelString:	Sometimes a document will provide its own fonts.
*prefs*webFontFrame*dynaFont.labelString:		Dynamic Fonts...
*prefs*webFontFrame*useMyFont.labelString:		\
Use my default fonts, overriding document-specified fonts 
*prefs*webFontFrame*useDocFontSelective.labelString:\
Use document-specified fonts, but disable Dynamic Fonts  
*prefs*webFontFrame*useDocFontWhenever.labelString:	\
Use document-specified fonts, including Dynamic Fonts  

! Preferences dialog - General/Colors

*prefs*colors*colorBoxLabel.labelString:	Colors
*prefs*colors*textColorLabel.labelString:	Text:
*prefs*colors*bgColorLabel.labelString:		Background:
*prefs*colors*useDefColors.labelString:		Use Default
*prefs*colors*linksBoxLabel.labelString:	Links
*prefs*colors*linksLabel.labelString:		Unvisited Links:
*prefs*colors*vlinksLabel.labelString:		Visited Links:
*prefs*colors*underline.labelString:		Underline links
*prefs*colors*useColor.labelString:			\
Sometimes a document will provide its own colors and background
*prefs*colors*useMyColor.labelString:		Always use my colors, overriding document

! Preferences dialog - Browser/Languages - Add

*prefsLang*fontList:					-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*prefsLang_popup.title:					Netscape: Add Languages
*prefsLang*langLabel.labelString:		Select the language you would like to add.\n\nLanguages:
*prefsLang*langList.visibleItemCount:	15
*prefsLang*otherLabel.labelString:		Others:

! Preferences dialog - Smart Browsing
*prefs*relatedFrame*relatedBoxLabel.labelString:	What's Related
*prefs*relatedFrame*enableRelated.labelString:		Enable What's Related

*prefs*relatedFrame*autoloadLabel.labelString:		Automatically Load What's Related

*prefs*relatedFrame*autoloadAlways.labelString:		Always
*prefs*relatedFrame*autoloadAdaptive.labelString:	After First Use
*prefs*relatedFrame*autoloadNever.labelString:		Never

*prefs*relatedFrame*excludedLabel.labelString:		\
Enter a comma separated list of domain names for\n\
whose sites related items will never be loaded

*prefs*keywordFrame*keywordBoxLabel.labelString:	Internet Keywords
*prefs*keywordFrame*enableKeywords.labelString:		Enable Internet Keywords

! Preferences dialog - Advanced

*prefs*advanced*showImage.labelString:			\
Automatically load images and other data types\n\
(Otherwise, click the Images button to load when needed)
*prefs*advanced*enableJava.labelString:			Enable Java
*prefs*advanced*enableJs.labelString:			Enable JavaScript
*prefs*advanced*enableJsMailNews.labelString:           Enable JavaScript for Mail and News
*prefs*advanced*enableStyleSheet.labelString:	Enable Style Sheets
*prefs*advanced*emailAnonFtp.labelString:		Send email address as anonymous FTP password
*prefs*cookieFrame*cookieBoxLabel.labelString:	Cookies
*prefs*cookieFrame*alwaysAcceptCookie.labelString:	Accept all cookies
*prefs*cookieFrame*noForeignCookie.labelString:	\
Only accept cookies originating from the same server as\n\
the page being viewed
*prefs*cookieFrame*neverAcceptCookie.labelString:Do not accept or send cookies
*prefs*cookieFrame*warnCookie.labelString:		Warn me before accepting a cookie

*prefs*alertFrame*submDoc.labelString:			submitting a secure document
*prefs*alertFrame*dpyDoc.labelString:			displaying a secure document
*prefs*alertFrame*viewMixed.labelString:		viewing a document with a secure/insecure mix
*prefs*alertFrame*submForm.labelString:			submitting a form insecurely
*prefs*alertFrame*submMixedForm.labelString:	submitting a form with a secure/insecure mix

! Preferences dialog - Browser/Applications

*prefs*applFrame*newButton.labelString:			New...
*prefs*applFrame*editButton.labelString:		Edit...
*prefs*applFrame*deleteButton.labelString:		Delete
*prefs*appl*folderLabel.labelString:			Download files to:
*prefs*appl*browseButton.labelString:			Choose...

! Preferences dialog - General - Applications - Edit

*prefsApplEdit*fontList:						-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*prefsApplEdit_popup.title:						Netscape: Application
*prefsApplEdit*mimeTypesDescriptionLabel.labelString: Description:
*prefsApplEdit*mimeTypesLabel.labelString: 		MIMEType:
*prefsApplEdit*mimeTypesSuffixLabel.labelString:Suffixes:
*prefsApplEdit*applEditFrameLabel.labelString:	Handled By
*prefsApplEdit*applEditNavigator.labelString: 	Navigator 
*prefsApplEdit*applEditPlugin.labelString: 		Plug In:
*prefsApplEdit*applEditApp.labelString: 		Application:
*prefsApplEdit*applEditSave.labelString: 		Save To Disk
*prefsApplEdit*applEditUnknown.labelString: 	Unknown:PromptUser
*prefsApplEdit*applEditAppBrowse.labelString: 	Choose...
*prefsApplEdit*defaultOutgoingToggle.labelString: Use this MIME as the outgoing default for these extensions.

! Preferences dialog - General/Cache

*prefs*cache*cacheLabel.labelString:		\
The cache is used to keep local copies of frequently accessed docu-\n\
ments and thus reduce time connected to the network. The Reload\n\
button will always compare the cache document to the network\n\
document and show the most recent one. To load pages and images\n\
from the network instead of the cache, press the Shift key and click\n\
the reload button.
*prefs*cache*cacheDirLabel.labelString:		Cache Folder:
*prefs*cache*memoryLabel.labelString:		Memory cache:
*prefs*cache*memoryK.labelString:			kBytes
*prefs*cache*diskLabel.labelString:			Disk cache:
*prefs*cache*diskK.labelString:				kBytes
*prefs*cache*verifyLabel.labelString:		\
Document in cache is compared to document on network
*prefs*cache*verifyRc*once.labelString:		Once per session
*prefs*cache*verifyRc*every.labelString:	Every time
*prefs*cache*verifyRc*never.labelString:	Never
*prefs*cache*browse.labelString:			Choose...
*prefs*cache*clearDisk.labelString:			Clear Disk Cache
*prefs*cache*clearMem.labelString:			Clear Memory Cache

! Preferences dialog - General/Proxies

*prefs*proxies*proxiesLabel.labelString:		\
A network proxy is used to provide additional security between your\n\
computer and the Internet (usually along with a firewall) and/or to\n\
increase performance between networks by reducing redundant traffic\n\
via caching. Your system administrator can provide you with proper\n\
proxy settings.
*prefs*proxies*direct.labelString:			Direct connection to the internet
*prefs*proxies*manual.labelString:			Manual proxy configuration
*prefs*proxies*auto.labelString:			Automatic proxy configuration
*prefs*proxies*config.labelString:			Configuration location (URL)
*prefs*proxies*view.labelString:			View...
*prefs*proxies*reload.labelString:			Reload

! Preferences dialog - General - Proxies - View

*prefsProxiesView*fontList:					-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*prefsProxiesView_popup.title:				Netscape: View Manual Proxy Configuration
*prefsProxiesView*proxyViewLabel1.labelString:	\
You may configure a proxy and port number for each of the internet\n\
protocols that Netscape supports.
*prefsProxiesView*proxyViewLabel2.labelString:	\
You may provide a list of domains that Netscape should access directly,\n\
rather than via the proxy:
*prefsProxiesView*ftpProxyLabel.labelString:	FTP Proxy:
*prefsProxiesView*gopherProxyLabel.labelString:	Gopher Proxy:
*prefsProxiesView*httpProxyLabel.labelString:	HTTP Proxy:
*prefsProxiesView*httpsProxyLabel.labelString:	Security Proxy:
*prefsProxiesView*waisProxyLabel.labelString:	WAIS Proxy:
*prefsProxiesView*noProxyLabel.labelString:		No Proxy for:
*prefsProxiesView*socksHostLabel.labelString:	SOCKS Host:
*prefsProxiesView*ftpPortLabel.labelString:		Port:
*prefsProxiesView*gopherPortLabel.labelString:	Port:
*prefsProxiesView*httpPortLabel.labelString:	Port:
*prefsProxiesView*httpsPortLabel.labelString:	Port:
*prefsProxiesView*waisPortLabel.labelString:	Port:
*prefsProxiesView*socksPortLabel.labelString:	Port:

! Roaming Access Conflict Dialog
*liConflict*queryLabel.labelString: What would you like to do?
*liConflict*alwaysToggle.labelString: Apply this decision to remaining items.

! Preferences dialog - Roaming Access: General Prefs
!*prefs*liGeneral*topTitle.labelString: General Flags
*prefs*liGeneral*hint.labelString: \
Use Roaming Access to retrieve your user profile information from\n\
any place on the network.\n\
\n\
Your user profile information will then be retrieved from your\n\
Roaming Access server each time on startup and transferred to the\n\
server on shutdown.

*prefs*liGeneral*enableToggle.labelString: Enable Roaming Access for this profile
!*prefs*liGeneral*syncToggle.labelString: Background synchronize every
!*prefs*liGeneral*unitLabel.labelString: minutes.
*prefs*liLoginAdvancedButton.labelString: Options

!*prefs*liGeneral*bottomTitle.labelString: User Information
*prefs*liGeneral*bottomFrame.topOffset: 20
*prefs*liGeneral*userInfoLabel.labelString: \
Please enter your login information to be used when retrieving your\n\
user profile from your Roaming Access server.
*prefs*liGeneral*userLabel.labelString: User Name:
*prefs*liGeneral*passwordLabel.labelString: Password:
*prefs*liGeneral*passwordText.maxLength: 256
*prefs*liGeneral*savePasswordToggle.labelString: Remember my Roaming Access password

! Preferences dialog - Roaming Access: Server Prefs
*prefs*liServer*frameLabel.labelString: Server Information

*prefs*liServer*serverLabel.labelString: \
The information below is needed to connect to your Roaming Access\n\
server.  If you do not know the information requested, please contact\n\
your system administrator.

*prefs*liServer*bottomFrame.topOffset: 20
*prefs*liServer*ldapToggle.labelString: LDAP Directory Server
*prefs*liServer*ldapAddrLabel.labelString: Address:
*prefs*liServer*ldapBaseLabel.labelString: User DN:
*prefs*liServer*httpToggle.labelString: HTTP Server
*prefs*liServer*httpBaseLabel.labelString: Base URL:

! Preferences dialog - Roaming Access: File Prefs
*prefs*liFiles*fileLabel.labelString: \
The user profile items selected below will be retrieved from your\n\
Roaming Access server on startup and transferred to the server\n\
on shutdown.
*prefs*liFiles*frameLabel.labelString: Items
*prefs*liFiles*bookmarkToggle.labelString: Bookmarks
*prefs*liFiles*cookiesToggle.labelString: Cookies
*prefs*liFiles*filterToggle.labelString: Mail Filters
*prefs*liFiles*addrbookToggle.labelString: Address Book
*prefs*liFiles*historyToggle.labelString: History
*prefs*liFiles*prefsToggle.labelString: User Preferences
*prefs*liFiles*javasecToggle.labelString: Java Security
*prefs*liFiles*certToggle.labelString: Certificates and Private Keys

! Preferences dialog - Advanced/Disk space

*prefs*diskSpace*allMsgsBoxLabel.labelString: 	All Messages
*prefs*diskSpace*maxMsgSize.labelString: 		Do not store messages locally that are larger than
*prefs*diskSpace*k.labelString: 				kB
*prefs*diskSpace*askThreshold.labelString: 		Automatically compact folders when it will save over
*prefs*diskSpace*k2.labelString: 				kB

*prefs*diskSpace*newsMsgsBoxLabel.labelString: 	Newsgroups Messages Only
*prefs*diskSpace*newsMsgsLabel.labelString: 	When it's time to clean up messages:
*prefs*diskSpace*keepNewsByAge.labelString:		Keep messages which have arrived within the past
*prefs*diskSpace*keepAllNews.labelString:		Keep all messages
*prefs*diskSpace*keepNewsByCount.labelString:	Keep
*prefs*diskSpace*keepUnreadNews.labelString:	Keep only unread messages
*prefs*diskSpace*daysLabel.labelString: 		days
*prefs*diskSpace*msgsLabel.labelString: 		newest messages
*prefs*diskSpace*more.labelString: 				More Options...
*prefs*diskSpace*rmMsgBodyToggle.labelString:	Remove message bodies only older than

! Preferences dialog - Advanced/Help Files

*prefs*helpFiles*helpLabel.labelString: 	Help files come from:
*prefs*helpFiles*netscapeToggle.labelString:Netscape's Help site
*prefs*helpFiles*installToggle.labelString:	Installed Help files
*prefs*helpFiles*customToggle.labelString:	Custom Page:
*prefs*helpFiles*browse.labelString: 		Choose...

! Preferences dialog - Advanced/SmartUpdate
*prefs*smartUpdate*enableToggle.labelString: 	Enable SmartUpdate
*prefs*smartUpdate*confirmToggle.labelString: 	Require manual confirmation of each install

*prefs*smartUpdate*uninstallLabel.labelString: To uninstall, select from the following list and click the Uninstall button
*prefs*smartUpdate*uninstallButton.labelString: Uninstall

! Preferences dialog - Browser

*prefs*browser*indicatorType:				ONE_OF_MANY
*prefs*browser*XmLabelGadget.alignment:		ALIGNMENT_BEGINNING
*prefs*browser*browserBoxLabel.labelString:	Browser starts with
*prefs*browser*blankPage.labelString:		Blank page
*prefs*browser*homePage.labelString:		Home page
*prefs*browser*lastPage.labelString:		Last page visited
*prefs*browser*homePageBoxLabel.labelString:Home page
*prefs*browser*homePageLabel.labelString:	Clicking the Home button will take you to this page.
*prefs*browser*locLabel.labelString:		Location:
*prefs*browser*browse.labelString:			Choose...
*prefs*browser*useCurrent.labelString:		Use Current Page
*prefs*browser*historyBoxLabel.labelString:	History
*prefs*browser*expireLabel.labelString:		History expires after
*prefs*browser*daysLabel.labelString:		days
*prefs*browser*expireNow.labelString:		Clear History

! Preferences dialog - Browser/Languages

*prefs*lang*langLabel.alignment:			ALIGNMENT_BEGINNING
*prefs*lang*langLabel.labelString:	\
Choose in order of preference the language(s) in which you prefer to\n\
view web pages. Web pages are sometimes available in serveral\n\
languages. Navigator presents the pages in the available language\n\
you most prefer.
*prefs*lang*addButton.labelString:		Add...
*prefs*lang*deleteButton.labelString:	Delete

! Preferences dialog - Mail News

*prefs.quotedTextStyle.plain:				Plain
*prefs.quotedTextStyle.bold:				Bold
*prefs.quotedTextStyle.italic:				Italic
*prefs.quotedTextStyle.boldItalic:			Bold Italic
*prefs.quotedTextSize.normal:				Normal
*prefs.quotedTextSize.bigger:				Bigger
*prefs.quotedTextSize.smaller:				Smaller
*prefs*mailnews*quotedTextLabel.labelString:	\
Plain quoted text beginning with ">" is displayed with
*prefs*mailnews*quotedTextStyleLabel.labelString:	Style:
*prefs*mailnews*quotedTextSizeLabel.labelString:	Size:
*prefs*mailnews*quotedTextColorLabel.labelString:	Color:
*prefs*mailnews*msgArticleLabel.labelString:	\
Display plain text messages and articles with
*prefs*mailnews*fixedWidthFont.labelString:			Fixed width font
*prefs*mailnews*varWidthFont.labelString:			Variable width font
*prefs*mailnews*rememberSelected.labelString: Remember the last selected message.
*prefs*mailnews*reuseThread.labelString: Double-clicking a folder or newsgroup opens it in a new window.
*prefs*mailnews*reuseMsg.labelString: Double-clicking a message opens it in a new window.
*prefs*mailnews*confirmFolderTrash.labelString: Confirm when moving folders to the trash.

*prefs*mailnews*newsBehaviorLabel.labelString: The Newsgroups menu item or button:
*prefs*mailnews*newsInThreePaneToggle.labelString: Opens newsgroups in a Messenger window.
*prefs*mailnews*newsInMessageCenterToggle.labelString: Opens the Message Center.
! Preferences dialog - Mail News/Messages
*prefs*mailnewsMessages*replyLabel.labelString: Forwarding and Replying to messages:
*prefs*mailnewsMessages*forwardLabel.labelString: By default, forward messages:
*prefs*mailnewsMessages*autoquoteToggle.labelString: Automatically quote the original message when replying
*prefs*mailnewsMessages*autoquoteMyReplyLabel.labelString: Then, 
*prefs*mailnewsMessages*autoquoteSepLabel.labelString: Separate reply and quoted text by 
*prefs*mailnewsMessages*autoquoteSepLinesLabel.labelString: lines
*prefs*mailnewsMessages*spellToggle.labelString: Spell check messages before sending
*prefs*mailnewsMessages*wrapLabel.labelString: Message Wrapping:
*prefs*mailnewsMessages*wrapToggle.labelString: Wrap incoming, plain text messages to window width
*prefs*mailnewsMessages*wrapLengthLabel.labelString: Wrap outgoing, plain text messages at:
*prefs*mailnewsMessages*wrapLengthAfterLabel.labelString: characters
*prefs*mailnewsMessages*eightbitLabel.labelString: Send messages that use 8-bit characters:
*prefs*mailnewsMessages*eightbitAsIsToggle.labelString: As is (does not work well with some mail servers)
*prefs*mailnewsMessages*eightbitQuotedToggle.labelString: \
Using the "quoted printable" MIME encoding\n\
(does not work well with some mail or newsgroup readers)

! Preferences dialog - Mail News/Identity

*prefs*mailnewsIdentity*idLabel.labelString:		\
The information below is needed before you can send mail. If you do\n\
not know the information requested, please contact your system\n\
administrator or Internet Service Provider.
*prefs*mailnewsIdentity*nameLabel.labelString:	Your name:
*prefs*mailnewsIdentity*emailAddrLabel.labelString:	Email address:
*prefs*mailnewsIdentity*replyToAddrLabel.labelString:	\
Reply-to address (only needed if different from email address):
*prefs*mailnewsIdentity*orgLabel.labelString:	Organization:
*prefs*mailnewsIdentity*sigFileLabel.labelString:	Signature File:
*prefs*mailnewsIdentity*browse.labelString:		Choose...
*prefs*mailnewsIdentity*editCardButton.labelString: Edit Card...
*prefs*mailnewsIdentity*attachCard.labelString:	Attach my personal card to messages (as a vCard)
*prefs*mailnewsIdentity*editCard.labelString:	Edit Card...

! Preferences dialog - Mail News/Mail Server

*prefs*mailnewsMserver*iServerFrame*incomingServerLabel.labelString: \
 Incoming Mail Servers
*prefs*mailnewsMserver*oServerFrame*outgoingServerLabel.labelString: \
Outgoing Mail Server
*prefs*mailnewsMserver*localFrame*localMailDirLabel.labelString: \
Local mail directory
*prefs*mailnewsMserver*iServerFrame*iServerBox*ButtonForm*newButton.labelString: \
Add...
*prefs*mailnewsMserver*iServerFrame*iServerBox*ButtonForm*editButton.labelString: \
Edit...
*prefs*mailnewsMserver*iServerFrame*iServerBox*ButtonForm*deleteButton.labelString: \
Delete
*prefs*mailnewsMserver*iServerFrame*iServerBox*ButtonForm*defaultButton.labelString: \
Set as Default

*prefs*mailnewsMserver*iServerFrame*iServerBox*incomingServerLabel.labelString:\
To set server properties (such as checking for\n\
new messages automatically), select a server\n\
and then click Edit.
*SubUpgradeDialog*paragraphLabel.labelString: \
Messenger detects that you have upgraded from a previous version. In order to read your\n\
mail, Messenger will need to know which folders you would like to subscribe to.\n\
\n\
Only folders you subscribe to will appear in your folder view. Any folders you do not\n\
subscribe to will not be available. (Note: you can always change which folders\n\
you subscribe to later on by selecting Subscribe from the File menu.)
*SubUpgradeDialog*customToggle.labelString: \
Let me choose now which folders are subscribed to

! Preferences dialog - incoming mail server - new server pop up

*MailServerInfo.title:	Netscape: Mail server info
*MailServerInfo*form1*ServerName.labelString: \
Server Name:
*MailServerInfo*form1*ServerType.labelString: \
Server Type:
*MailServerInfo*form1*ServerUser.labelString: \
User Name:
*MailServerInfo*form1*RememberPass.labelString: \
Remember password.
*MailServerInfo*form1*CheckMail.labelString: \
Check for mail every
*MailServerInfo*form1*MinuteLabel.labelString: \
minutes.
*MailServerInfo*form1*downloadToggle.labelString: \
Automatically download any new messages.
*MailServerInfo*form1*imapOption.labelString: IMAP
*MailServerInfo*form1*popOption.labelString: POP
*MailServerInfo*form1*movemailOption.labelString: MoveMail

! Imap tab

*prefs_popup*MailServerInfo*xmlFolder*form2*imapImap.labelString: IMAP
*prefs_popup*MailServerInfo*xmlFolder*form2*deleteLabel.labelString: \
When I delete a message:
*prefs_popup*MailServerInfo*xmlFolder*form2*trashToggle.labelString: \
Move it to the Trash folder.\n\
(It will be removed when I select 'Empty Trash')
*prefs_popup*MailServerInfo*xmlFolder*form2*markToggle.labelString: \
Mark it as deleted.\n\
(It will be removed when I select 'Compact This Folder')
*prefs_popup*MailServerInfo*xmlFolder*form2*removeToggle.labelString: \
Remove it immediately.\n\
(It can be restored by selecting Undo)
*prefs_popup*MailServerInfo*xmlFolder*form2*trashExitToggle.labelString:\
Empty Trash on Exit.
*prefs_popup*MailServerInfo*xmlFolder*form2*expungeExitToggle.labelString:\
Clean up ("Expunge") Inbox on Exit.
*prefs_popup*MailServerInfo*xmlFolder*form2*UseSSL.labelString: \
Use secure connection. (SSL)

! Advanced tab 

*MailServerInfo*form3*PathPrefsLabel.labelString: \
These preferences specify the different namespaces on your\n\
IMAP server.
*MailServerInfo*form3*PersonalDir.labelString: \
Personal Namespace
*MailServerInfo*form3*PublicDir.labelString: \
Public (shared)
*MailServerInfo*form3*OtherUsers.labelString: \
Other Users
*MailServerInfo*form3*AllowServer.labelString: \
Allow server to override these namespaces
*MailServerInfo*form3*imapDirLabel.labelString: \
IMAP server directory:
*MailServerInfo*form3*subfolderMessageToggle.labelString: \
Server supports folders that contain subfolders and messages.
*MailServerInfo*form3*useSubscriptions.labelString: \
Show only subscribed folders.

! pop server - general tab

*MailServerInfo*form4*LeaveMessages.labelString: \
Leave messages on server
*MailServerInfo*form4*deleteOnPopServer.labelString: \
When deleting a message locally, remove it from the server.

! Movemail tab

*MailServerInfo*form5*builtinToggle.labelString: Use built-in movemail
*MailServerInfo*form5*externalToggle.labelString: Use an external application:
*MailServerInfo*form5*appChoose.labelString: Choose..
! Preferences dialog - outgoing mail server
*prefs*mailnewsMserver*oServerFrame*oServerBox*outgoingServerLabel.labelString: \
Outgoing mail (SMTP) server:
*prefs*mailnewsMserver*oServerFrame*oServerBox*serverUsernameLabel.labelString:\
Outgoing mail server user name:
*prefs*mailnewsMserver*oServerFrame*oServerBox*chooseSSLLabel.labelString: \
Use Secure Socket Layer (SSL) or TLS for outgoing messages:
*prefs*mailnewsMserver*oServerFrame*oServerBox*sslNever.labelString: \
Never
*prefs*mailnewsMserver*oServerFrame*oServerBox*sslIfPossible.labelString: \
If Possible
*prefs*mailnewsMserver*oServerFrame*oServerBox*sslAlways.labelString: \
Always

! Preferences dialog - mail server - local mail directory

*prefs*mailnewsMserver*localFrame*localBox*localMailDir.labelString: \
Directory: 
*prefs*mailnewsMserver*localFrame*localBox*chooseButton.labelString: \
Choose...

! Preferences dialog - Mail News/News Server

*prefs*mailnewsNServer*serverLabel.labelString:
*prefs*mailnewsNServer*serverAddButton.labelString: Add...
*prefs*mailnewsNServer*serverEditButton.labelString: Edit...
*prefs*mailnewsNServer*serverDeleteButton.labelString: Delete
*prefs*mailnewsNServer*serverDefaultButton.labelString: Set as Default
*prefs*mailnewsNServer*localLabel.labelString: Newsgroup directory:
*prefs*mailnewsNServer*dirLabel.labelString: Newsgroup (news) folder:
*prefs*mailnewsNServer*chooseButton.labelString: Choose...
*prefs*mailnewsNServer*sizeLimitToggle.labelString: Ask me before downloading more than 
*prefs*mailnewsNServer*sizeLimit2.labelString: messages.

! Preferences dialog - Mail News/News Server popup

*NewsServerInfo*serverLabel.labelString: Server:
*NewsServerInfo*portLabel.labelString: Port:
*NewsServerInfo*sslToggle.labelString: \
Support encrypted connections (SSL)
*NewsServerInfo*passwordToggle.labelString: \
Always use name and password

! Preferences dialog - Mail News/Address Book

*prefs*mailnewsAddrBook*addrBookLabel.labelString:	\
When searching directories, search for items using\n\
these directories in the following order:
*prefs*mailnewsAddrBook*newButton.labelString:		New...
*prefs*mailnewsAddrBook*editButton.labelString:		Edit...
*prefs*mailnewsAddrBook*deleteButton.labelString:	Delete
*prefs*mailnewsAddrBook*fullNameLabel.labelString:	Show full names as
*prefs*mailnewsAddrBook*firstLastToggle.labelString:(First Name)(Last Name)
*prefs*mailnewsAddrBook*lastFirstToggle.labelString:(Last Name),(First Name)
*prefs*mailnewsAddrBook*firstLastLabel.labelString:	(John Smith)
*prefs*mailnewsAddrBook*lastFirstLabel.labelString:	(Smith, John)

*prefs*mailnewsAddress*messageLabel.labelString: Pinpoint Addressing:
*prefs*mailnewsAddress*completeLabel.labelString: Look for addresses in the following:
*prefs*mailnewsAddress*completeABToggle.labelString: Address books.
*prefs*mailnewsAddress*completeDirToggle.labelString: Directory server:
*prefs*mailnewsAddress*conflictLabel.labelString: When there are multiple addresses found:
*prefs*mailnewsAddress*conflictShowToggle.labelString: Show me a list of choices
*prefs*mailnewsAddress*conflictAcceptToggle.labelString: Accept what I have typed
*prefs*mailnewsAddress*onlyMatchLabel.labelString: If there is only one match in your personal address books:
*prefs*mailnewsAddress*onlyMatchToggle.labelString: Use the address and do not search in the directory
*prefs*mailnewsAddress*sortLabel.labelString: When displaying full names:
*prefs*mailnewsAddress*sortFirstToggle.labelString: Show names using display name. (from address book card)
*prefs*mailnewsAddress*sortLastToggle.labelString: Show names using last name, first name.
! Preferences dialog - Mail News/Directory - New/Edit

*prefsLdapProp*fontList:					-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*prefsLdapProp_popup.title:					Netscape: LDAP Server Preferences
*prefsLdapProp*descLabel.labelString:		Description:	
*prefsLdapProp*serverLabel.labelString:		LDAP Server:
*prefsLdapProp*rootLabel.labelString:		Search Root:
*prefsLdapProp*portNumberLabel.labelString:	Port Number:
*prefsLdapProp*numHitLabel.labelString:		Maximum Number of Hits:
*prefsLdapProp*secure.labelString:			Secure
*prefsLdapProp*savePasswd.labelString:		Save Password

! Preferences dialog - Mail News/Message Copies

*prefs*mailnewsCopies*newsCopies.labelString: When sending a newsgroup message, automatically
*prefs*mailnewsCopies*newsOtherToggle.labelString: BCC other addresses:
*prefs*mailnewsCopies*newsChooseButton.labelString: Choose Folder ...
*prefs*mailnewsCopies*newsFccToggle.labelString: Folder %s on %s
*prefs*mailnewsCopies*mailCopies.labelString: When sending a mail message, automatically
*prefs*mailnewsCopies*mailOtherToggle.labelString: BCC other addresses:
*prefs*mailnewsCopies*mailChooseButton.labelString: Choose Folder ...
*prefs*mailnewsCopies*mailFccToggle.labelString: Folder %s on %s
*prefs*mailnewsCopies*dtCopies.labelString: Storage for Drafts and Templates
*prefs*mailnewsCopies*dSaveToggle.labelString: Keep drafts in '%s' on %s
*prefs*mailnewsCopies*tSaveToggle.labelString: Keep templates in '%s' on %s
*prefs*mailnewsCopies*dFccButton.labelString: Choose Folder ...
*prefs*mailnewsCopies*tFccButton.labelString: Choose Folder ...

*prefsMailFolderDialog*specificFolder.labelString: Other:

! Preferences dialog - HTML Formatting
*prefs*mailnewsHTML*useHTML.labelString: Message formatting
*prefs*mailnewsHTML*useHTMLToggle.labelString: Use the HTML editor to compose messages.
*prefs*mailnewsHTML*usePlainToggle.labelString: Use the plain text editor to compose messages.
*prefs*mailnewsHTML*noHTML.labelString: When sending HTML messages to recipients who are not\nlisted as being able to receive them:
*prefs*mailnewsHTML*noHTMLoverride.labelString: You can override these settings in any message through the\noptions panel of the message composition window.
*prefs*mailnewsHTML*noHTMLAsk.labelString: Ask me what to do if the message has HTML formatting,\notherwise send plain text.
*prefs*mailnewsHTML*noHTMLText.labelString: Convert the message into plain text.\n(may lose some formatting)
*prefs*mailnewsHTML*noHTMLHTML.labelString: Send the message in HTML anyway\n(some recipients may not be able to read it)
*prefs*mailnewsHTML*noHTMLBoth.labelString: Send the message in plain text and HTML\n(uses more disk space)

*prefs*editor*authorLabel.labelString:		Author name:
*prefs*editor*externalFrameTitle.labelString:	External editors
*prefs*editor*htmlLabel.labelString:		HTML source:
*prefs*editor*imageLabel.labelString:		Images:
*prefs*editor*locationLabel.labelString:	Template for new page:
*prefs*editor*restoreDefault.labelString:	Use Default
*prefs*editor*browseTemplate.labelString:	Choose...
*prefs*editor*autosaveEnable.labelString:	Automatically save page every
*prefs*editor*minutes.labelString:			minutes
*prefs*editor*browse.labelString:			Choose...

! Preferences dialog - Read Receipts
*prefs*mailnewsReceipts*requestReceiptsLabel.labelString: If I request a receipt when sending a message, I want
*prefs*mailnewsReceipts*dsn.labelString: A delivery receipt from the receiving server (DSN)
*prefs*mailnewsReceipts*mdn.labelString: A read receipt notify me when recipients display this message (MDN)
*prefs*mailnewsReceipts*both.labelString: Both types of receipt
*prefs*mailnewsReceipts*receiptsArriveLabel.labelString: When a receipt arrives
*prefs*mailnewsReceipts*inbox.labelString: Leave it in my inbox
*prefs*mailnewsReceipts*sentmail.labelString: Move it to my Sent Mail folder
*prefs*mailnewsReceipts*receiveReceiptsLabel.labelString: When I receive a message and sender requested a receipt (MDN)
*prefs*mailnewsReceipts*never.labelString: Never return a receipt
*prefs*mailnewsReceipts*some.labelString: Return receipts for some messages
*prefs*mailnewsReceipts*customizeButton.labelString: Customize...

! make sure these are multi-line, otherwise the widgets line up funny
*prefsDialogReceipts.title: Customize Return Receipts
*prefsDialogReceipts*instructLabel.labelString:\
When I receive a message and its sender requested a receipt\n\
(MDN), send one in the following cases:
*prefsDialogReceipts*mailingLabel.labelString:\
If I'm not in the To or CC list of the message\n\
(as for a message to a mailing list):
*prefsDialogReceipts*outsideLabel.labelString:\
If the message comes from outside the\n\
domain (domain here):
*prefsDialogReceipts*otherLabel.labelString:\
In all other cases:

! Preferences dialog - Editor/Publish

*prefs*editor*linksAndImagesTitle.labelString:	Links and images
*prefs*editor*linksAndImagesLabel.labelString:	\
When saving remote documents and when inserting links and images:
*prefs*editor*linksToggle.labelString:		Maintain links
*prefs*editor*linksInfo.labelString:			\
Adjust links to work from the document's location. Links to local\n\
files will work when local versions exist.
*prefs*editor*imagesToggle.labelString:		Keep images with document
*prefs*editor*imagesInfo.labelString:		\
Save copies of images to the document's location. Images will\n\
always appear in local versions of the document and when it is\n\
published.
*prefs*editor*linksAndImagesTip.labelString:		\
Tip: Set both options if you will be using remote publishing.
*prefs*editor*publishTitle.labelString:		Default publishing location
*prefs*editor*publishLabel.labelString:		Publish to (FTP or HTTP):	
*prefs*editor*browseLabel.labelString:		Browse to (HTTP):

! Preferences dialog - Offline

*prefs*offline*startupBoxLabel.labelString:	Startup Communicator in
*prefs*offline*online.labelString:			Online Work Mode
*prefs*offline*offline.labelString:			Offline Work Mode
*prefs*offline*ask.labelString:				Ask Me
*prefs*offline*onlineDesc.labelString:\
Choose this if you are on a network and connected to the\n\
Internet all the time.
*prefs*offline*offlineDesc.labelString:\
Choose this if you use a modem and/or want to control\n\
when you make network connections.
*prefs*offline*askDesc.labelString:\
Choose this if you are not sure when you will have access\n\
to a network when you use Communicator. You will be\n\
prompted with a choice dialog on start up.

! Preferences dialog - Offline/News

*prefs*offlineNews*downloadBoxLabel.labelString: 	Message Download
*prefs*offlineNews*downloadMsgs.labelString: 		Download
*prefs*offlineNews*downloadByDate.labelString:		Download by date
*prefs*offlineNews*downloadDateFrom.labelString:	from
*prefs*offlineNews*downloadDateSince.labelString:	since
*prefs*offlineNews*msgsLabel.labelString:			messages
*prefs*offlineNews*daysAgoLabel.labelString:		days ago
*prefs*offlineNews*discussionLabel.labelString:	\
In order to read newsgroups offline, you must first select them for\n\
download. Click the Select newsgroups... button to choose newsgroups\n\
for download.
*prefs*offlineNews*selectDiscussion.labelString:	Select Newsgroups...
*prefs*offlineNews*discussionLabel2.labelString:	(12 newsgroups selected)

! Preferences dialog - page labels

*pref.appearance:					Appearance
*pref.fonts:						Fonts
*pref.colors:						Colors
*pref.browser:						Navigator
*pref.lang:							Languages
*pref.smart:						Smart Browsing
*pref.applications:					Applications
*pref.mailNews:						Mail & Newsgroups
*pref.identity:						Identity
*pref.messages:                     Messages
*pref.mailServer:					Mail Servers
*pref.newsServer:					Newsgroups Servers
*pref.addressing:                   Addressing
*pref.copies:                       Copies and Folders
*pref.htmlmail:                     Formatting
*pref.readreceipts:                 Return Receipts
*pref.diskSpace:					Disk Space
*pref.editor:						Composer
*pref.editorAppearance:				New Page Colors
*pref.editorPublish:				Publish
*pref.offline:						Offline
*pref.offlineNews:					Groups
*pref.helpFiles:					Help Files
*pref.advanced:						Advanced
*pref.cache:						Cache
*pref.proxies:						Proxies
*pref.liGeneral:					Roaming User
*pref.liServer:						Server Information
*pref.liFiles:						Item Selection

*prefDesc.appearance:				Change the appearance of the display
*prefDesc.fonts:					Change the fonts in your display
*prefDesc.colors:					Change the colors in your display
*prefDesc.browser:					Specify the home page location
*prefDesc.lang:						View web pages in different languages
*prefDesc.smart:					Configure browsing aids
*prefDesc.applications:				Specify helper applications for different file types
*prefDesc.mailNews:					Settings for Mail and Newsgroups
*prefDesc.identity:					Set your name, email address, and signature file
*prefDesc.composition:				Choose settings for outgoing messages
*prefDesc.mailServer:				Specify servers for mail
*prefDesc.newsServer:				Specify your servers for reading newsgroups
*prefDesc.addressBook:				Choose directories for searching addresses
*prefDesc.addressing:               Settings for addressing messages
*prefDesc.copies:                   Copies, drafts, and templates
*prefDesc.messages:                 Choose settings for messages
*prefDesc.htmlMail:                 Message formatting
*prefDesc.readReceipts:             Settings for requesting or returning receipts.
*prefDesc.editor:					Set general preferences for authoring Web pages
*prefDesc.editorAppearance:			Choose default appearance of new Web pages
*prefDesc.editorPublish:			Designate the default publishing location
*prefDesc.offline:					Choose the startup mode of the product
*prefDesc.offlineNews:				Choose settings for reading newsgroups offline
*prefDesc.diskSpace:				Manage the amount of disk space taken by messages
*prefDesc.helpFiles:				Choose Help files
*prefDesc.advanced:					Change preferences that affect the entire product
*prefDesc.cache:					Designate the size of the cache
*prefDesc.proxies:					Configure proxies to access the Internet
*prefDesc.liGeneral:				Enter your server login information
*prefDesc.liServer:					Specify the Roaming Access server information
*prefDesc.liFiles:					Specify which items to transfer
*prefDesc.smartUpdate:				Configure software installation

! Preferences dialog - TODOs


*prefs*mailnewsMserver*inboxToggle.sensitive:	false


! Color picker

*colorDialog_popup.title:			Netscape: Color Picker

! Mail/News banners
*bannerItem.shadowType:				shadow_out
*bannerItem.shadowThickness:		1
*bannerItem.marginLeft:				1
*bannerItem.marginRight:			1
*bannerItem.marginTop:				1
*bannerItem.marginBottom:			1

*banner*mommy.buttonLayout:			button_pixmap_only

! Subscribe UI

*subscribeFolder*fontList: -*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*subscribeFolder*subscribe.labelString: Subscribe
*subscribeFolder*unsubscribe.labelString: Unsubscribe
*subscribeFolder*setSubscribe.labelString:    Subscribe
*subscribeFolder*clearSubscribe.labelString:  Unsubscribe
*subscribeFolder*expandAll.labelString:		Expand
*subscribeFolder*collapseAll.labelString:	Collapse All
*subscribeFolder*fetchGroupList.labelString:	Refresh List
*subscribeFolder*stopLoading.labelString:	Stop
*subscribeFolder*getNewGroups.labelString:	Get New
*subscribeFolder*clearNewGroups.labelString:	Clear New
*subscribeFolder*search.labelString:		Search Now
*subscribeFolder*addNewsServer.labelString:	Add Server...
*subscribeFolder*subNewInfoLabel.labelString: This list shows all new newsgroups since you last cleared the list.
*subscribeFolder*searchLabel.labelString:	Search For:
*subscribeFolder*onserverLabel.labelString:	On Server:
*subscribeFolder*serverLabel.labelString:	Server:
*subscribeFolder*newsgroupLabel.labelString:	Newsgroup:
*subscribeFolder*subNewInfoLabel.alignment:	ALIGNMENT_BEGINNING

! The Add server dialog
*serverDialog*fontList:						-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
*serverDialogForm*serverLabel.labelString:	Server Name:
*serverDialogForm*portLabel.labelString:	Server Port:
*serverDialogForm*secureLabel.labelString:	Secure:
*serverDialogForm*secureToggle.labelString:

! Compose Window attachment panel resources
*newComposeFolder*attachItemImage.highlightThickness:      2
*newComposeFolder*attachItemImage.navigationType: NONE

*addressFolderBaseWidget*addressBook.labelString:     Address Book
*addressBook.documentationString: Attach an address book card to the current message

*subjectFormW*subjectLabel.labelString:		Subject:
*PriorityOption.labelString:			Priority:
*optionForm*returnReceipt.labelString:		Request return receipt
*optionForm*encrypted.labelString:		Encrypted
*optionForm*signed.labelString:			Signed
*optionForm*leftMargin:			40
*optionForm*rightMargin:		40	

*TextEncodingOption.labelString:		Use 8-bit instead of MIME-compliant encoding for the message text
*AttachmentEncodingOption.labelString:		Use uuencode instead of MIME for attachments
*MessageActionOption.labelString:		Format:

!!
!! *menuBar
!!
*menuBar.shadowThickness:		1
*menuBar.marginHeight:			0
*menuBar.marginWidth:			0

!!
!! *toolBox
!!
*Navigator*toolBox*Tab0.tipString:		Navigation Toolbar
*Navigator*toolBox*Tab1.tipString:		Location Toolbar
*Navigator*toolBox*Tab2.tipString:		Personal Toolbar

*Editor*toolBox*Tab0.tipString:			Composition Toolbar
*Editor*toolBox*Tab1.tipString:			Formatting Toolbar

*Composition*toolBox*Tab0.tipString:	Message Toolbar
*Composition*toolBox*Tab1.tipString:	Addressing Area
*Composition*subjectFormW.toolBox*Tab0.tipString: Formatting Toolbar

*MailFolder*toolBox*Tab0.tipString:		Message Center Toolbar
*MailFolder*toolBox*Tab1.tipString:		Location Toolbar

*MailThread*toolBox*Tab0.tipString:		Message Toolbar
*MailThread*toolBox*Tab1.tipString:		Location Toolbar

*MailMsg*toolBox*Tab0.tipString:		Message Toolbar
*MailMsg*toolBox*Tab1.tipString:		Location Toolbar

*toolBox*Tab0.tipString:				Navigation Toolbar
*toolBox*Tab1.tipString:				Location Toolbar

*Navigator*toolBox*Tab0.documentationString:		Navigation Toolbar
*Navigator*toolBox*Tab1.documentationString:		Location Toolbar
*Navigator*toolBox*Tab2.documentationString:		Personal Toolbar

*Editor*toolBox*Tab0.documentationString:			Composition Toolbar
*Editor*toolBox*Tab1.documentationString:			Formatting Toolbar

*Composition*toolBox*Tab0.documentationString:	Message Toolbar
*Composition*toolBox*Tab1.documentationString:	Addressing Area
*Composition*subjectFormW.toolBox*Tab0.documentationString: Formatting Toolbar

*MailFolder*toolBox*Tab0.documentationString:		Message Center Toolbar
*MailFolder*toolBox*Tab1.documentationString:		Location Toolbar

*MailThread*toolBox*Tab0.documentationString:		Message Toolbar
*MailThread*toolBox*Tab1.documentationString:		Location Toolbar

*MailMsg*toolBox*Tab0.documentationString:		Message Toolbar
*MailMsg*toolBox*Tab1.documentationString:		Location Toolbar

*toolBox*Tab0.documentationString:				Navigation Toolbar
*toolBox*Tab1.documentationString:				Location Toolbar

!! Number of pixels to move an item before swapping
*toolBox.swapThreshold:					10

!! Maximum number of pixels an item can be dragged (for one mouse motion)
*toolBox.dragThreshold:					10

*toolBox.marginLeft:					0
*toolBox.marginRight:					0
*toolBox.marginTop:						0
*toolBox.marginBottom:					0

!!
!! *toolBar
!!
*toolBarItem.shadowType:				shadow_out
*toolBarItem.shadowThickness:			1
*toolBarItem.marginLeft:				1
*toolBarItem.marginRight:				1
*toolBarItem.marginTop:					1
*toolBarItem.marginBottom:				1

*toolBar*XfeButton.marginBottom:		1
*toolBar*XfeButton.marginLeft:			1
*toolBar*XfeButton.marginRight:			1
*toolBar*XfeButton.marginTop:			1
*toolBar*XfeButton.shadowThickness:		1

*toolBar*XfeCascade.marginBottom:		1
*toolBar*XfeCascade.marginLeft:			1
*toolBar*XfeCascade.marginRight:		1
*toolBar*XfeCascade.marginTop:			1
*toolBar*XfeCascade.shadowThickness:	1

*toolBar*XmSeparator.shadowThickness:	0
*toolBar*XmSeparator.width:				20
*toolBar*XmSeparator.height:			2
*toolBar*XmSeparator.orientation:		horizontal

*toolBar*armOffset:						1
*toolBar*fillOnEnter:					false
*toolBar*raiseForeground:				Blue
*toolBar*fontList:						-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*toolBar.spacing:						0
*toolBar.shadowThickness:				0
*toolBar.marginLeft:					0
*toolBar.marginRight:					0
*toolBar.marginTop:						0
*toolBar.marginBottom:					0


!!
!! Browser Toolbar destinations
!!
!*toolBar*destinations.mapingDelay:                           1
!*toolBar*destinations*whatsNew.labelString:		What's New?
!*toolBar*destinations*whatsCool.labelString:	What's Cool?
!*toolBar*destinations*inetIndex.labelString:	The Internet
!*toolBar*destinations*inetSearch.labelString:	Net Search
!*toolBar*destinations*inetWhite.labelString:	People
!*toolBar*destinations*inetYellow.labelString:	Yellow Pages
!*toolBar*destinations*upgrade.labelString:		Software
!*toolBar*destinations*welcome.labelString:		Welcome
!*toolBar*destinations*newsgroups.labelString:	Groups

!!
!! *dashBoard
!!
*dashBoard.shadowThickness:							1
*dashBoard.shadowType:								shadow_out
*dashBoard.bottomOffset:							0
*dashBoard.leftOffset:								0
*dashBoard.rightOffset:								0
*dashBoard.topOffset:								0
*dashBoard.marginBottom:							2
*dashBoard.marginLeft:								2
*dashBoard.marginRight:								2
*dashBoard.marginTop:								2

!!
!! *dashBoard*securityBar
!!
*dashBoard*securityBar.marginBottom:				0
*dashBoard*securityBar.marginLeft:					0
*dashBoard*securityBar.marginRight:					0
*dashBoard*securityBar.marginTop:					0
*dashBoard*securityBar.buttonLayout:				button_pixmap_only

!!
!! *dashBoard*viewSecurity
!!
*dashBoard*viewSecurity.shadowType:					shadow_in
*dashBoard*viewSecurity.shadowThickness:			1
*dashBoard*viewSecurity.raiseOnEnter:				false
*dashBoard*viewSecurity.buttonType:					button_none
*dashBoard*viewSecurity.marginTop:					1
*dashBoard*viewSecurity.marginBottom:				1

!!
!! *dashBoard*statusBar
!!
*dashBoard*statusBar.shadowType:					shadow_in
*dashBoard*statusBar.shadowThickness:				1
*dashBoard*statusBar.truncateLabel:					false
*dashBoard*statusBar.fontList:						-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
*dashBoard*statusBar.labelAlignment:				alignment_beginning

! initial value for the status bar
*dashBoard*statusBar.labelString:					Netscape

!!
!! *dashBoard*progressBar
!!
*dashBoard*progressBar.shadowType:					shadow_in
*dashBoard*progressBar.shadowThickness:				1
*dashBoard*progressBar.fontList:					-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
*dashBoard*progressBar.width:						100

!! The color of the progress bar
*dashBoard*progressBar.barColor:					Gray60

!! The about the cylon moves on each tick
*dashBoard*progressBar.cylonOffset:					2

!! The interval in msec between cylon ticks
*dashBoard*progressBar.cylonInterval:				100

!! The cylon width (percent of total)
*dashBoard*progressBar.cylonWidth:					20

!!
!! *dockedTaskBar
!!
*dockedTaskBar.shadowType:								shadow_out
*dockedTaskBar.shadowThickness:							1
*dockedTaskBar.spacing:									0
*dockedTaskBar.buttonLayout:							button_pixmap_only
*dockedTaskBar*fontList:								*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*dockedTaskBar*openOrBringUpBrowser.labelString:		Navigator
*dockedTaskBar*openInboxAndGetNewMessages.labelString:	Inbox
*dockedTaskBar*openNewsgroups.labelString:				Newsgroups
*dockedTaskBar*openAddrBook.labelString:				AddressBook
*dockedTaskBar*openEditor.labelString:					Composer

*dockedTaskBar*openOrBringUpBrowser.tipString:			Open a browser window
*dockedTaskBar*openInboxAndGetNewMessages.tipString:	Open the mail window and get new messages
*dockedTaskBar*openNewsgroups.tipString:				Open the list of newsgroups
*dockedTaskBar*openAddrBook.tipString:				Open the address book 
*dockedTaskBar*openEditor.tipString:					Open the web page editor

*openInboxAndGetNewMessages.documentationString:		Open the mail window and get new messages

*dockedTaskBar*XfeButton.marginBottom:				1
*dockedTaskBar*XfeButton.marginLeft:				1
*dockedTaskBar*XfeButton.marginRight:				1
*dockedTaskBar*XfeButton.marginTop:					1
*dockedTaskBar*XfeButton.shadowThickness:			1

!!
!! *floatingTaskBar
!!
*floatingTaskBar.shadowType:								shadow_out
*floatingTaskBar.shadowThickness:							1
*floatingTaskBar.spacing:									0
*floatingTaskBar*fontList:								*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*

*floatingTaskBar*openOrBringUpBrowser.labelString:			Navigator
*floatingTaskBar*openInboxAndGetNewMessages.labelString:	Inbox	
*floatingTaskBar*openNewsgroups.labelString:				Newsgroups
*floatingTaskBar*openAddrBook.labelString:				AddressBook
*floatingTaskBar*openEditor.labelString:					Composer

*floatingTaskBar*openOrBringUpBrowser.tipString:			Open a browser window
*floatingTaskBar*openInboxAndGetNewMessages.tipString:	Open the mail window and get new messages
*floatingTaskBar*openNewsgroups.tipString:				Open the list of newsgroups
*floatingTaskBar*openAddrBook.tipString:				Open the address book 
*floatingTaskBar*openEditor.tipString:					Open the web page editor

*openInboxAndGetNewMessages.documentationString:		Open the mail window and get new messages

*floatingTaskBar*XfeButton.marginBottom:			2
*floatingTaskBar*XfeButton.marginLeft:				2
*floatingTaskBar*XfeButton.marginRight:				2
*floatingTaskBar*XfeButton.marginTop:				2
*floatingTaskBar*XfeButton.shadowThickness:			1


!!
!! *taskBarContextMenu
!!
*taskBarContextMenu*floatingTaskBarAlwaysOnTop.labelString:		Always On Top
*taskBarContextMenu*floatingTaskBarClose.labelString:			Close

*floatingTaskBarVerticalCmdString:								Vertical
*floatingTaskBarHorizontalCmdString:							Horizontal

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! buttons for compose/post  message pulldown on the toolbar
*toolBar*composeMessagePlain.labelString: 	in Plain Text	
*toolBar*composeMessageHTML.labelString: 	in HTML	

*toolBar*composeArticlePlain.labelString: 	in Plain Text	
*toolBar*composeArticleHTML.labelString: 	in HTML	

! buttons specific to the folder frame.
*toolBar*getNewMessages.labelString:	Get Msg
*toolBar*composeMessage.labelString:	New Msg
*composeMessage.tipString:		New message
*toolBar*newFolder.labelString:		New Folder
*toolBar*addNewsgroup.labelString:	Subscribe
*toolBar*deleteFolder.labelString:	Delete
*toolBar*deleteAny.labelString:		Delete
*toolBar*deleteAny.tipString:     Delete the selected message
*toolBar*deleteAny.documentationString: Delete the selected message

*unsubscribeNewsgroupCmdString: Unsubscribe
!
*getNewMessages.tipString:	Get messages
*getNewMessages.documentationString:	Get new mail and newsgroup messages
*getNewMessages.labelString:	Get New Messages
*getNewMessages.mnemonic:	M

*newFolder.tipString:		New mail folder
*addNewsgroup.tipString:	Add a newsgroup
*deleteFolder.tipString:	Delete mail folder

! buttons specific to the thread/message frame.
*toolBar*composeArticle.labelString: New Msg
*toolBar*replyToNewsgroup.labelString: Reply
*toolBar*replyToSender.labelString:	Reply
*toolBar*nextMessage.labelString:	Next
*toolBar*nextUnreadMessage.labelString:	Next Unread Message
*toolBar*nextUnreadThread.labelString:	Next Unread Thread
*toolBar*nextFlaggedMessage.labelString:	 Next Flagged Message
*toolBar*nextCategory.labelString:	Next Category
*toolBar*nextUnreadCategory.labelString:	Next Unread Category
*toolBar*nextUnreadCollection.labelString:	Next Unread Collection
*toolBar*forwardMessage.labelString:	Forward
*toolBar*deleteMessage.labelString:	Delete
*toolBar*previousUnreadMessage.labelString: Previous
*toolBar*previousMessage.labelString:	Previous
*previousMessage.tipString: Previous message
*toolBar*moveMessage.labelString: File
*toolBar*copyMessage.labelString: File
*toolBar*composeArticle.tipString: New message to this newsgroup
*toolBar*replyToNewsgroup.tipString: Reply to the message
*toolBar*nextMessage.tipString:	Next unread message


*toolBar*moveMessage.tipString: File the selected message
*toolBar*copyMessage.tipString: File the selected message
*toolBar*moveMessage.documentationString: File the selected message to a folder
*toolBar*copyMessage.documentationString: Copy the selected message to a folder

! buttons specific to the browser frame.
*toolBar*back.labelString:	Back
*toolBar*forward.labelString:	Forward
*toolBar*home.labelString:	Home
*toolBar*search.labelString:	Search
*toolBar*destinations.labelString:	Netscape
*toolBar*guide.labelString:	Guide
*toolBar*myshopping.labelString:			Shop
*toolBar*showImages.labelString:	Images
*toolBar*loadImages.labelString:	Load Images
*toolBar*print.labelString:	Print
*print.tipString:                   Print this page
*MailThread*print.tipString:        Print the selected message
*MailMsg*print.tipString:           Print the selected message
*toolBar*reload.labelString:	Reload

! buttons specific to the compose frame.
*toolBar*sendMessageNow.labelString:	Send
*toolBar*quote.labelString:		Quote
*toolBar*addresseePicker.labelString:	Address
*toolBar*saveDraft.labelString:		Save
*toolBar*viewAddresses.labelString:	Address
*toolBar*viewDirectories.labelString:	Directory
!
*sendMessageNow.tipString:	Send this message
*saveDraft.tipString:		Save this message as a draft
*quote.tipString:		Quote the previous document
*viewDirectories.tipString:	Look up an address
*viewSecurity.tipString:        Show security information
!
*addressBook.tipString:
!
*quote.documentationString:	      Paste text from the original page in quoted form
*viewDirectories.documentationString: Look up an address in an LDAP directory
!
! buttons specific to the Addressbook frame. documentationString
*toolBar*abEditEntry.labelString:     Properties
*toolBar*abDelete.labelString:   Delete
*toolBar*searchAddress.labelString:       Directory
*toolBar*abCall.labelString:       Call
!
*addToAddressBook.tipString: Create a new entry
*abNewList.tipString:        Create a new mailing list 
*abEditEntry.tipString:     Edit the selected entry
*abDelete.tipString:   Delete the selected entry
*abCall.tipString:          Start conference
*searchAddress.tipString:       Look up an address
!

*abEditEntry.documentationString:     \
View and edit properties of entry's address book card
*viewProperties.documentationString:  \
View and edit properties of entry's address book card
*displayHTMLDomainsDialog.documentationString: \
Edit the list of domains that can receive HTML messages
*abVCard.documentationString:    	  Create and edit my address book card

*abDelete.documentationString:   Delete the selected entry from the address book

*searchAddress.documentationString:       Look up an address in an LDAP directory

!*AddressBook*toggleNavigationToolbar.documentationString: 
!
*toBtn.documentationString:           Compose a message to the selected entry
*ccBtn.documentationString:           Compose a message and copy it to the selected entry
*bccBtn.documentationString:          Compose a message and blind-carbon copy it to the selected entry
!
! buttons used everywhere (it seems.)
*toolBar*viewSecurity.labelString:	Security
*toolBar*stopLoading.labelString:	Stop

*changeDocumentEncoding.documentationString: Indicate Documentation Encoding


*MailFolder.width:	280
*MailFolder.height:	400
!
*abCardProperties*strip.topOffset: 3
*abCardProperties*strip.leftOffset: 15
*abCardProperties*strip.bottomOffset: 3
*abCardProperties*strip.rightOffset: 15

!
! For the mail message download dialog
!
Netscape*MessageDownload*label.alignment: ALIGNMENT_BEGINNING
Netscape*MessageDownload*stopButtonForm*stopLoading.labelString: Cancel

Netscape*NewsDownload*fontList:				-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*
Netscape*NewsDownload_popup.title:			Netscape: Download Headers

Netscape*NewsDownload*allToggle.labelString: Download all headers
Netscape*NewsDownload*numMessagesToggle.labelString: Download
Netscape*NewsDownload*numMessagesCaption.labelString: headers
Netscape*NewsDownload*markOthersRead.labelString: Mark remaining headers as read.

!
! For the news group property dialog
!
*NewsgroupProps*name_label.labelString:	Name:
*NewsgroupProps*location_label.labelString: Location:
*NewsgroupProps*unread_label.labelString: Unread Messages:
*NewsgroupProps*total_label.labelString: Total Messages:
*NewsgroupProps*space_label.labelString: Total Space Used:
*NewsgroupProps*html_toggle.labelString: Can receive HTML messages

!
! For the mail folder property dialog
!
*MailFolderProps*name_label.labelString:	Name:
*MailFolderProps*name_value.columns: 20
*MailFolderProps*location_label.labelString: Location:
*MailFolderProps*unread_label.labelString: Unread Messages:
*MailFolderProps*total_label.labelString: Total Messages:
*MailFolderProps*wasted_label.labelString: Disk Space Wasted:
*MailFolderProps*space_label.labelString: Total Space Used:
*MailFolderProps*sharePrivilegesLabel.labelString: Share this and \
other folders with network users\n\
and display and set access privileges

!
! For the news server property dialog
!
*NewsServerProps*name_label.labelString: Name:
*NewsServerProps*port_label.labelString: Port #:
*NewsServerProps*security_label.labelString: Security:
*NewsServerProps*desc_label.labelString: Description:
*NewsServerProps*prompt_toggle.labelString: Always ask me for my user name and password
*NewsServerProps*anonymous_toggle.labelString: \
Only ask me for my user name and password\n\
when necessary
*NewsServerProps*html_toggle.labelString: Can receive HTML messages

!
! For the splash screen
!
Netscape*splashShell*background:	Black
Netscape*splashShell*foreground:	White
Netscape*splashShell*fontList:	-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-*

!
! Special for HTMLCompose
!
Netscape*composeViewEditFormWidget.scrollerForm.pane.scroller.spacing:	0
Netscape*composeViewEditFormWidget.scrollerForm.pane*spacing:			0
Netscape*composeViewEditFormWidget.scrollerForm.pane*marginWidth:		0
Netscape*composeViewEditFormWidget.scrollerForm.pane*marginHeight:		0
Netscape*composeViewEditFormWidget.scrollerForm.pane*highlightThickness:	0
Netscape*composeViewEditFormWidget.scrollerForm.pane*traversalOn:		False

!Composition navigation
*Composition*navigationType:		TAB_GROUP
*Composition*XmTextField.highlightThickness:	2
*Composition*XmText.highlightThickness:		2

! Plain Text Compose Popup
*popup*pasteAsQuoted.labelString:			Paste as Quotation
*popup*pasteAsQuoted.mnemonic:			Q
*popup*quoteOriginalText.labelString:			Quote Original Text

!
! Special for SpellHandler...
!
*spellDialog*right_rc.entryAlignment:  ALIGNMENT_CENTER

*spellDialog*replace.labelString:      Replace
*spellDialog*replace_all.labelString:  Replace All
*spellDialog*check.labelString:	      Check
*spellDialog*ignore.labelString:       Ignore
*spellDialog*ignore_all.labelString:   Ignore All
*spellDialog*learn.labelString:        Learn
*spellDialog*stop.labelString:         Stop
*spellDialog*text_label.labelString:   Word:
*spellDialog*list_label.labelString:   Suggestions:

*spellDialog*done.labelString:             Done
*spellDialog*msgFinished.labelString:      [ finished checking ]
*spellDialog*msgNoSuggestions.labelString: [ no suggestions ]
*spellDialog*msgUnRecognized.labelString:  [ unrecognized word ]
*spellDialog*msgCorrect.labelString:       [ correct spelling ]
*spellDialog*msgNull.labelString:          [ ]

*spellDialog*text_label.fontList: -*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
*spellDialog*list_label.fontList: -*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
*spellDialog*right_rc*fontList:   -*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*
*spellDialog*combo_frame*fontList:   -*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*
*spellDialog*langCzech.labelString:                Czech
*spellDialog*langRussian.labelString:              Russian
*spellDialog*langCatalan.labelString:              Catalan
*spellDialog*langHungarian.labelString:            Hungarian
*spellDialog*langFrench.labelString:               French
*spellDialog*langGerman.labelString:               German
*spellDialog*langSwedish.labelString:              Swedish
*spellDialog*langSpanish.labelString:              Spanish
*spellDialog*langItalian.labelString:              Italian
*spellDialog*langDanish.labelString:               Danish
*spellDialog*langDutch.labelString:                Dutch
*spellDialog*langPortugueseBrazilian.labelString:  Portuguese (Brazilian)
*spellDialog*langPortugueseEuropean.labelString:   Portuguese (European)
*spellDialog*langNorwegianBokmal.labelString:      Norwegian (Bokmal)
*spellDialog*langNorwegianNynorsk.labelString:     Norwegian (Nynorsk)
*spellDialog*langNorwegian.labelString:            Norwegian
*spellDialog*langFinnish.labelString:              Finnish
*spellDialog*langGreek.labelString:                Greek
*spellDialog*langEnglishUS.labelString:            English (US)
*spellDialog*langEnglishUK.labelString:            English (UK)
*spellDialog*langEnglish.labelString:              English
*spellDialog*langAfrikaans.labelString:            Afrikaans
*spellDialog*langPolish.labelString:               Polish

!
! tips for SwatchMatrix in colorPicker...
!
*#FFFFFF.tipString: 255 255 255
*#CCCCCC.tipString: 204 204 204
*#999999.tipString: 153 153 153
*#666666.tipString: 102 102 102
*#333333.tipString: 51 51 51
*#000000.tipString: 0 0 0

*#FFCCCC.tipString: 255 204 204
*#FF6666.tipString: 255 102 102
*#FF0000.tipString: 255 0 0
*#CC0000.tipString: 204 0 0
*#990000.tipString: 153 0 0
*#660000.tipString: 102 0 0
*#330000.tipString: 51 0 0

*#FFCC99.tipString: 255 204 153
*#FFCC33.tipString: 255 204 51
*#FF9900.tipString: 255 153 0
*#FF6600.tipString: 255 102 0
*#CC6600.tipString: 204 102 0
*#993300.tipString: 153 51 0
*#663300.tipString: 102 51 0

*#FFFFCC.tipString: 255 255 204
*#FFFF99.tipString: 255 255 153
*#FFFF00.tipString: 255 255 0
*#FFCC00.tipString: 255 204 0
*#999900.tipString: 153 153 0
*#666600.tipString: 102 102 0
*#333300.tipString: 51 51 0

*#99FF99.tipString: 153 255 153
*#66FF99.tipString: 102 255 153
*#33FF33.tipString: 51 255 51
*#33CC00.tipString: 51 204 0
*#009900.tipString: 0 153 0
*#006600.tipString: 0 102 0
*#003300.tipString: 0 51 0

*#CCFFFF.tipString: 204 255 255
*#66FFFF.tipString: 102 255 255
*#33CCFF.tipString: 51 204 255
*#3366FF.tipString: 51 102 255
*#3333FF.tipString: 51 51 255
*#000099.tipString: 0 0 153
*#000066.tipString: 0 0 102

*#FFCCFF.tipString: 255 204 255
*#FF99FF.tipString: 255 153 255
*#CC66CC.tipString: 204 102 204
*#CC33CC.tipString: 204 51 204
*#993399.tipString: 153 51 153
*#663366.tipString: 102 51 102
*#330033.tipString: 51 0 51

*#FFFF99.tipString: 255 255 153
*#FFFF66.tipString: 255 255 102
*#FFCC66.tipString: 255 204 102
*#FFCC33.tipString: 255 204 51
*#CC9933.tipString: 204 153 51
*#996633.tipString: 153 102 51
*#663333.tipString: 102 51 51

*#99FFFF.tipString: 153 255 255
*#33FFFF.tipString: 51 255 255
*#66CCCC.tipString: 102 204 204
*#00CCCC.tipString: 000 204 204
*#339999.tipString: 51 153 153
*#336666.tipString: 51 102 102
*#003333.tipString: 0 51 51

*#CCCCFF.tipString: 204 204 255
*#9999FF.tipString: 153 153 204
*#6666CC.tipString: 102 102 204
*#6633FF.tipString: 102 51 255
*#6600CC.tipString: 102 0 204
*#333399.tipString: 51 51 153
*#330099.tipString: 51 0 153

!
! doc strings for SwatchMatrix in colorPicker...
!
*#FFFFFF.documentationString: RGB Color [ 255 255 255 ][ #FFFFFF ]
*#CCCCCC.documentationString: RGB Color [ 204 204 204 ][ #CCCCCC ]
*#999999.documentationString: RGB Color [ 153 153 153 ][ #999999 ]
*#666666.documentationString: RGB Color [ 102 102 102 ][ #666666 ]
*#333333.documentationString: RGB Color [ 51 51 51 ][ #333333 ]
*#000000.documentationString: RGB Color [ 0 0 0 ][ #000000 ]

*#FFCCCC.documentationString: RGB Color [ 255 204 204 ][ #FFCCCC ]
*#FF6666.documentationString: RGB Color [ 255 102 102 ][ #FF6666 ]
*#FF0000.documentationString: RGB Color [ 255 0 0 ][ #FF0000 ]
*#CC0000.documentationString: RGB Color [ 204 0 0 ][ #CC0000 ]
*#990000.documentationString: RGB Color [ 153 0 0 ][ #990000 ]
*#660000.documentationString: RGB Color [ 102 0 0 ][ #660000 ]
*#330000.documentationString: RGB Color [ 51 0 0 ][ #330000 ]

*#FFCC99.documentationString: RGB Color [ 255 204 153 ][ #FFCC99 ]
*#FFCC33.documentationString: RGB Color [ 255 204 51 ][ #FFCC33 ]
*#FF9900.documentationString: RGB Color [ 255 153 0 ][ #FF9900 ]
*#FF6600.documentationString: RGB Color [ 255 102 0 ][ #FF6600 ]
*#CC6600.documentationString: RGB Color [ 204 102 0 ][ #CC6600 ]
*#993300.documentationString: RGB Color [ 153 51 0 ][ #993300 ]
*#663300.documentationString: RGB Color [ 102 51 0 ][ #663300 ]

*#FFFFCC.documentationString: RGB Color [ 255 255 204 ][ #FFFFCC ]
*#FFFF99.documentationString: RGB Color [ 255 255 153 ][ #FFFF99 ]
*#FFFF00.documentationString: RGB Color [ 255 255 0 ][ #FFFF00 ]
*#FFCC00.documentationString: RGB Color [ 255 204 0 ][ #FFCC00 ]
*#999900.documentationString: RGB Color [ 153 153 0 ][ #999900 ]
*#666600.documentationString: RGB Color [ 102 102 0 ][ #666600 ]
*#333300.documentationString: RGB Color [ 51 51 0 ][ #333300 ]

*#99FF99.documentationString: RGB Color [ 153 255 153 ][ #99FF99 ]
*#66FF99.documentationString: RGB Color [ 102 255 153 ][ #66FF99 ]
*#33FF33.documentationString: RGB Color [ 51 255 51 ][ #33FF33 ]
*#33CC00.documentationString: RGB Color [ 51 204 0 ][ #33CC00 ]
*#009900.documentationString: RGB Color [ 0 153 0 ][ #009900 ]
*#006600.documentationString: RGB Color [ 0 102 0 ][ #006600 ]
*#003300.documentationString: RGB Color [ 0 51 0 ][ #003300 ]

*#CCFFFF.documentationString: RGB Color [ 204 255 255 ][ #CCFFFF ]
*#66FFFF.documentationString: RGB Color [ 102 255 255 ][ #66FFFF ]
*#33CCFF.documentationString: RGB Color [ 51 204 255 ][ #33CCFF ]
*#3366FF.documentationString: RGB Color [ 51 102 255 ][ #3366FF ]
*#3333FF.documentationString: RGB Color [ 51 51 255 ][ #3333FF ]
*#000099.documentationString: RGB Color [ 0 0 153 ][ #000099 ]
*#000066.documentationString: RGB Color [ 0 0 102 ][ #000066 ]

*#FFCCFF.documentationString: RGB Color [ 255 204 255 ][ #FFCCFF ]
*#FF99FF.documentationString: RGB Color [ 255 153 255 ][ #FF99FF ]
*#CC66CC.documentationString: RGB Color [ 204 102 204 ][ #CC66CC ]
*#CC33CC.documentationString: RGB Color [ 204 51 204 ][ #CC33CC ]
*#993399.documentationString: RGB Color [ 153 51 153 ][ #993399 ]
*#663366.documentationString: RGB Color [ 102 51 102 ][ #663366 ]
*#330033.documentationString: RGB Color [ 51 0 51 ][ #330033 ]

*#FFFF99.documentationString: RGB Color [ 255 255 153 ][ #FFFF99 ]
*#FFFF66.documentationString: RGB Color [ 255 255 102 ][ #FFFF66 ]
*#FFCC66.documentationString: RGB Color [ 255 204 102 ][ #FFCC66 ]
*#FFCC33.documentationString: RGB Color [ 255 204 51 ][ #FFCC33 ]
*#CC9933.documentationString: RGB Color [ 204 153 51 ][ #CC9933 ]
*#996633.documentationString: RGB Color [ 153 102 51 ][ #996633 ]
*#663333.documentationString: RGB Color [ 102 51 51 ][ #663333 ]

*#99FFFF.documentationString: RGB Color [ 153 255 255 ][ #99FFFF ]
*#33FFFF.documentationString: RGB Color [ 51 255 255 ][ #33FFFF ]
*#66CCCC.documentationString: RGB Color [ 102 204 204 ][ #66CCCC ]
*#00CCCC.documentationString: RGB Color [ 000 204 204 ][ #00CCCC ]
*#339999.documentationString: RGB Color [ 51 153 153 ][ #339999 ]
*#336666.documentationString: RGB Color [ 51 102 102 ][ #336666 ]
*#003333.documentationString: RGB Color [ 0 51 51 ][ #003333 ]

*#CCCCFF.documentationString: RGB Color [ 204 204 255 ][ #CCCCFF ]
*#9999FF.documentationString: RGB Color [ 153 153 204 ][ #9999FF ]
*#6666CC.documentationString: RGB Color [ 102 102 204 ][ #6666CC ]
*#6633FF.documentationString: RGB Color [ 102 51 255 ][ #6633FF ]
*#6600CC.documentationString: RGB Color [ 102 0 204 ][ #6600CC ]
*#333399.documentationString: RGB Color [ 51 51 153 ][ #333399 ]
*#330099.documentationString: RGB Color [ 51 0 153 ][ #330099 ]

*selector*background:			gray70
*selector*shadowThickness:		1
*selector.orientation:			vertical

*selector*ToolBar.buttonLayout:			button_label_on_top

*selector.leftAttachment:			attach_form
*selector.rightAttachment:			attach_none
*selector.topAttachment:			attach_form
*selector.bottomAttachment:			attach_form


*selector.leftOffset:				10
*selector.rightOffset:				10
*selector.topOffset:				10 
*selector.bottomOffset:				10

!*selector.usePreferredWidth:		false
*selector.usePreferredHeight:		false

*selector.clipShadowThickness:		1
*selector.clipShadowType:			shadow_in


!*selector.marginLeft:					0
!*selector.marginRight:					0
!*selector.marginTop:					0
!*selector.marginBottom:				0

!*selector.marginLeft:				0
!*selector.marginRight:				0
!*selector.marginTop:				0
!*selector.marginBottom:				0

!*selector.spacing:					10

*selector*ToolBar.radioBehavior:				true


!*selector*XfeButton.buttonType:			button_toggle

*selector*XfeButton.buttonTrigger:			button_trigger_either
*selector*XfeButton.marginLeft:			4
*selector*XfeButton.marginRight:			4
*selector*XfeButton.marginTop:				4
*selector*XfeButton.marginBottom:			4

*selector*XfeButton.raiseOnEnter:			true
*selector*XfeButton.shadowThickness:		0
!*selector*XfeButton.fillOnEnter:			true
*selector*XfeButton.armOffset:				0

*selector*XfeButton.transparentCursor:		cross
!*selector*XfeButton.cursor:				hand2



!Netscape*AddressOutlinerPopup*fontList:\
-*-helvetica-medium-r-*-*-*-120-*-*-*-*-iso8859-*,\
-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*=BOLD,\
-*-helvetica-medium-o-*-*-*-120-*-*-*-*-iso8859-*=ITALIC

Netscape*AddressOutlinerPopup*fontList:\
-*-helvetica-medium-r-*-*-*-100-*-*-*-*-iso8859-*,\
-*-helvetica-bold-r-*-*-*-100-*-*-*-*-iso8859-*=BOLD,\
-*-helvetica-medium-o-*-*-*-100-*-*-*-*-iso8859-*=ITALIC



! This table maps the host's locale names to MIME charsets
!
*localeCharset*C:		iso-8859-1
*localeCharset*chinese:		gb2312
*localeCharset*de_DE:		iso-8859-1
*localeCharset*fr_FR.iso8859:	iso-8859-1
*localeCharset*ja_JP.mscode:	x-sjis
*localeCharset*ja_JP.ujis:	x-euc-jp
*localeCharset*japanese:	x-euc-jp
*localeCharset*ko_KR.euc:	euc-kr
*localeCharset*korean:		euc-kr
*localeCharset*zh_CN.ugb:	gb2312
*localeCharset*zh_TW.big5:	big5


! English strings are built into the binary
!*strings.6796:A communications error occurred.\n\
 (TCP Error: %s)\n\
\n\
Try connecting again.

!*strings.6795:Netscape is unable to connect to the server at\n\
the location you have specified. The server may\n\
be down or busy.\n\
\n\
Try connecting again later.

!*strings.6794:A communications error occurred.\n\
 (TCP Error: %s)\n\
\n\
Try connecting again.

!*strings.6793:Netscape is out of memory.\n\
\n\
Try quitting some other applications or closing\n\
some windows.

!*strings.6791:This Location (URL) is not recognized:\n\
  %.200s\n\
\n\
Check the Location and try again.

!*strings.6789:Unable to use FTP passive mode

!*strings.6788:Netscape is unable to set the FTP transfer mode with\n\
this server. You will not be able to download files.\n\
\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6787:Netscape is unable to send the change directory (cd)\n\
command, to the FTP server. You cannot view another\n\
directory.\n\
\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6786:Netscape is unable to send a port command to the FTP\n\
server to establish a data connection.\n\
\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6785:Netscape is unable to find the file or directory\n\
named %.200s.\n\
\n\
Check the name and try again.

!*strings.6784:A News error occurred: Invalid NNTP connection\n\
\n\
Try connecting again.

!*strings.6783:An error occurred with the News server.\n\
\n\
If you are unable to connect again, contact the\n\
administrator for this server.

!*strings.6782:There was no response. The server could be down\n\
or is not responding.\n\
\n\
If you are unable to connect again later, contact\n\
the server's administrator.

!*strings.6781:Netscape is unable to locate the server %.200s.\n\
\n\
Please check the server name and try again.

!*strings.6780:The server has disconnected.\n\
The server may have gone down or there may be a\n\
network problem.\n\
\n\
Try connecting again.

!*strings.6779:The Newsgroup item is unavailable. It may have expired.\n\
\n\
Try retrieving another item.

!*strings.6778:Netscape is unable to open your News file (newsrc).\n\
\n\
Please verify that your Mail and News preferences are\n\
correct and try again.

!*strings.6777:Netscape is unable to open the file \n\
%.200s.\n\
\n\
Check the file name and try again.

!*strings.6776:(no name specified)

!*strings.6775:Aborted by user

!*strings.6764:A network error occurred while Netscape\n\
was sending data.\n\
(Network Error: %s)\n\
\n\
Try connecting again.

!*strings.6771:An error occurred while sending mail:\n\
Netscape was unable to connect to the SMTP server.\n\
The server may be down or may be incorrectly configured.\n\
\n\
Please verify that your Mail preferences are correct\n\
and try again.

!*strings.6770:An error occurred while sending mail.\n\
The mail server responded:\n\
  %s\n\
Please verify that your email address is correct\n\
in your Mail preferences and try again.

!*strings.6769:An error occurred while sending mail.\n\
The mail server responded:\n\
  %s\n\
Please check the message recipients and try again.

!*strings.6768:An (SMTP) error occurred while sending mail.\n\
Server responded: %s

!*strings.6767:An error occurred while sending mail.\n\
The mail server responded:\n\
  %s.\n\
Please check the message and try again.

!*strings.6766:An error occurred while sending mail: SMTP server error.\n\
The server responded:\n\
  %s\n\
Contact your mail administrator for assistance.

!*strings.6760:A network error occurred:\n\
unable to connect to server (TCP Error: %s)\n\
The server may be down or unreachable.\n\
\n\
Try connecting again later.

!*strings.6759:There was no response. The server could be down\n\
or is not responding.\n\
\n\
If you are unable to connect again later, contact\n\
the server's administrator.

!*strings.6758:Netscape's network connection was refused by the server \n\
%.200s.\n\
The server may not be accepting connections or\n\
may be busy.\n\
\n\
Try connecting again later.

!*strings.6757:Netscape was unable to create a network socket connection.\n\
There may be insufficient system resources or the network\n\
may be down.  (Reason: %s)\n\
\n\
Try connecting again later or try restarting Netscape.

!*strings.6755:Netscape is unable to complete a socket connection\n\
with this server. There may be insufficient system\n\
resources.\n\
\n\
Try restarting Netscape.

!*strings.6754:Netscape is unable to connect to your proxy server.\n\
The server may be down or may be incorrectly configured.\n\
\n\
Please verify that your Proxy preferences are correct\n\
and try again, or contact the server's administrator.

!*strings.6753:Netscape is unable to locate your proxy server.\n\
The server may be down or may be incorrectly configured.\n\
\n\
Please verify that your Proxy preferences are correct\n\
and try again, or contact the server's administrator.

!*strings.6749:The document contained no data.\n\
Try again later, or contact the server's administrator.

!*strings.6748:A network error occurred while Netscape\n\
was receiving data.\n\
(Network Error: %s)\n\
\n\
Try connecting again.

!*strings.6747:Netscape is unable to open the temporary file\n\
%.200s.\n\
\n\
Check your `Temporary Directory' setting and try again.

!*strings.6765:An error occurred sending mail:\n\
the return mail address was invalid.\n\
\n\
Please verify that your email address is correct\n\
in your Mail preferences and try again.

!*strings.6750:The disk is full. Netscape is cancelling the file\n\
transfer and removing the file.\n\
\n\
Please remove some files and try again.

!*strings.6740:An authorization error occurred:\n\
\n\
%s\n\
\n\
Please try entering your name and/or password again.

!*strings.6734:No sender was specified.\n\
Please fill in your email address in the\n\
Mail and Newsgroup preferences.

!*strings.6733:No recipients were specified.\n\
Please enter a recipient in a To: line,\n\
or a newsgroup in a Group: line..

!*strings.6732:No subject was specified.

!*strings.6731:Error writing temporary file.

!*strings.6725:This is a multi-part message in MIME format.

!*strings.6722:Printing stopped.  A problem occurred while receiving\n\
the document.  Transmission may have been interrupted\n\
or there may be insufficient space to write the file.\n\
\n\
Try again. Check that space is available in the\n\
temporary directory or restart Netscape.

!*strings.6721:Your signature exceeds the recommended four lines.

!*strings.6720:Your signature exceeds the recommended 79 columns.\n\
For most readers, the lines will appear truncated, or\n\
will be wrapped unattractively.  \n\
\n\
Please edit it to keep the lines shorter than 80 characters.

!*strings.6719:A network error occurred:\n\
    unable to connect to server\n\
The server may be down or unreachable.\n\
\n\
Try connecting again later.

!*strings.6718:Unable to load the requested help topic

!*strings.6699:This copy of Netscape has expired.\n\
This pre-release copy of Netscape Navigator has expired\n\
and can only be used to download a newer version of Navigator.

!*strings.6698:This trial or pre-release copy of Netscape Navigator has expired\n\
and can only be used to purchase or download a newer version of Navigator.

!*strings.6697:No WAIS proxy is configured.\n\
\n\
Check your Proxy preferences and try again.

!*strings.6696:A News (NNTP) error occurred:\n\
 %.100s

!*strings.6695:A News error occurred. The scan of all newsgroups is incomplete.\n\
 \n\
Try to View All Newsgroups again.

!*strings.6694:Netscape could not find a News file (newsrc)\n\
and is creating one for you.

!*strings.6693:No NNTP server is configured.\n\
\n\
Check your Mail and News preferences and try again.

!*strings.6692:A communications error occurred.\n\
Please try again.

!*strings.6691:Netscape was unable to connect to the secure news server\n\
because of a proxy error

!*strings.6689:An error occurred with the POP3 mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6688:Netscape is unable to use the mail server because\n\
you have not provided a username.  Please provide\n\
one in the preferences and try again

!*strings.6687:Error getting mail password.

!*strings.6686:An error occurred while sending your user name to the mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6685:An error occurred while sending your password to the mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6684:There are no new messages on the server.

!*strings.6683:An error occurred while listing messages on the POP3 mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6682:An error occurred while querying the POP3 mail server for\n\
the last processed message.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6681:An error occurred while getting messages from the POP3 mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6680:An error occurred while removing messages from the POP3 mail server.\n\
You should contact the administrator for this server\n\
or try again later.

!*strings.6679:There isn't enough room on the local disk to download\n\
your mail from the POP3 mail server.  Please make room and\n\
try again.  (The `Empty Trash' and `Compact This Folder'\n\
commands may recover some space.)

!*strings.6678:An error occurred while saving mail messages.

!*strings.6675:Could not post the file %.80s\n\
because\n\
%.200s.\n\
\n\
You may not have permission to write to\n\
this directory.\n\
Check the permissions and try again.

!*strings.6674:This is a pre-release copy of Netscape Navigator that\n\
will expire at %s.\n\
To obtain a newer pre-release version or the latest full\n\
release of Netscape Navigator (which will not expire) \n\
choose Software Updates from the Help menu.

!*strings.6673:Could not delete file:\n\
	%s

!*strings.6672:Could not remove directory:\n\
	%s

!*strings.6671:Cannot create directory because a file or\n\
directory of that name already exists: \n\
	%s

!*strings.6670:Could not create directory:\n\
	%s

!*strings.6669:Object is not a directory:\n\
     %s

!*strings.6668:Authorization failed

!*strings.6667:This trial copy of Netscape has expired.\n\
\n\
To purchase a regular copy of Netscape Navigator\n\
(which will not expire) choose Software Updates from the Help menu.

!*strings.6666:This trial copy of Netscape Navigator \n\
will expire at %s.\n\
\n\
To purchase a regular copy of Netscape Navigator\n\
(which will not expire) choose Software Updates from the Help menu.

!*strings.6665:There was an attempt to redirect a url request,\n\
but the attempt was not allowed by the client.

!*strings.6664:Corruption was detected in the compressed GZip file that was requested

!*strings.6599:Can't move or copy messages to the folder they're already in.

!*strings.6598:Cannot copy messages into the 'Unsent Messages' folder:\n\
That folder is only for storing messages\n\
to be sent later.

!*strings.6597:Cannot copy messages into the `Drafts' folder:\n\
That folder is only for holding drafts of messages which have\n\
not yet been sent.

!*strings.6596:Couldn't create the folder! Your hard disk may be full\n\
or the folder pathname may be too long.

!*strings.6595:A folder with that name already exists.

!*strings.6594:Can't delete a folder without first deleting the messages in it.

!*strings.6593:Can't delete a folder without first deleting the messages in it.

!*strings.6592:Couldn't create default inbox folder!

!*strings.6591:Couldn't create a mail folder directory.  Mail will not work!

!*strings.6590:No mail server has been specified. Please enter your mail \n\
server in the preferences (select Preferences from the Edit menu).

!*strings.6586:Message cancelled.

!*strings.6585:Couldn't open Sent Mail file. \n\
Please verify that your Mail preferences are correct.

!*strings.6584:Couldn't find the folder.

!*strings.6583:Couldn't find the summary file.

!*strings.6582:Couldn't open temporary folder file for output.

!*strings.6581:The specified message doesn't exist in that folder.\n\
It may have been deleted or moved into another folder.

!*strings.6580:A newsrc file exists but is unparsable.

!*strings.6579:Your email address has not been specified.\n\
Before sending mail or news messages, you must specify a\n\
return address in Mail and News Preferences.

!*strings.6577:The return email address set in Preferences is: %s\n\
\n\
This appears to be incomplete (it contains no `@').  Examples of\n\
correct email addresses are `fred@xyz.com' and `sue@xyz.gov.au'.

!*strings.6576:The return email address set in Preferences is: %s\n\
\n\
This appears to be incomplete (it contains no `.').  Examples of\n\
correct email addresses are `fred@xyz.com' and `sue@xyz.gov.au'.

!*strings.6575:No outgoing mail (SMTP) server has been specified in Mail and News Preferences.

!*strings.6574:Are you sure you want to cancel this message?

!*strings.6573:This message does not appear to be from you.\n\
You may only cancel your own posts, not those made by others.

!*strings.6572:Unable to cancel message!

!*strings.6571:Message not cancelled.

!*strings.6570:Error!\n\
News server responded: %.512s\n

!*strings.6569:%.300s does not appear to be a mail file.\n\
Attempt to read it anyway?

!*strings.6568:%.300s does not appear to be a mail file.\n\
Attempt to write it anyway?

!*strings.6567:Error saving newsrc file!

!*strings.6566:Error writing mail file!

!*strings.6565:At least one of your mail folders is wasting a lot\n\
of disk space.  If you compact your Mail folders now,\n\
you can recover %ld Kbytes of disk space. Compacting\n\
folders might take a while.\n\
\n\
Compress folders now?

!*strings.6564:Not found.

!*strings.6563:You haven't typed anything, and there is no attachment.\n\
Send anyway?

!*strings.6562:You have included the same document twice: first as a quoted\n\
document (meaning: with '>' at the beginning of each line), and\n\
then as an attachment (meaning: as a second part of the message,\n\
included after your new text).\n\
\n\
Send it anyway?

!*strings.6561:Delivery failed for 1 message.\n\
\n\
This message has been left in the Unsent Messages folder.\n\
Before it can be delivered, the error must be\n\
corrected.

!*strings.6560:Delivery failed for %d messages.\n\
\n\
These messages have been left in the Unsent Messages folder.\n\
Before they can be delivered, the errors must be\n\
corrected.

!*strings.6559:This message has no subject.  Send anyway?

!*strings.6558:It will not be possible to send this message encrypted to all of the\n\
addressees.  Send it anyway?

!*strings.6557:Can only delete mail folders.

!*strings.6556:Can't copy messages because the mail folder is in use.\n\
Please wait until other copy operations are \n\
complete and try again.\n

!*strings.6555:Can't delete message folder '%s' because you are viewing\n\
its contents. Please close those windows and try again.

!*strings.6554:The complete list of newsgroups was not retrieved for\n\
this news server. Operations will not proceed normally\n\
until all newsgroups have been retrieved.\n\
\n\
Click on the 'All' tab to continue retrieving\n\
newsgroups.

!*strings.6553:This message cannot be moved while Communicator is offline.\n\
It has not been downloaded for offline reading.\n\
Select Go Online from the File menu, then try again.

!*strings.6552:The IMAP message copy failed.

!*strings.6551:The IMAP message move failed.\n\
The copy succeeded but a source message was not deleted.

!*strings.6550:A problem has occurred uploading an offline change.\n\
 Continue uploading remaining offline changes (OK) \n\
 or try again later (Cancel)

!*strings.6549:You cannot move your Inbox Folder.

!*strings.6548:Could not find the summary information\n\
 for the %s IMAP folder.

!*strings.6547:You cannot undo or redo a folder action while\n\
 the folder is loading.  Wait until the folder has\n\
 finished loading, then try again.

!*strings.6546:The targeted destination folder does not allow subfolders.

!*strings.6545:The selected parent folder does not allow subfolders.\n\
 Try selecting the server folder and typing\n\
 'parent/newFolder' to create a new hierarchy.

!*strings.6544:The targeted destination folder cannot hold messages.

!*strings.6543:This mail server cannot undo folder deletes, delete anyway?

!*strings.6542:Cannot copy messages into the 'Outbox' folder:\n\
That folder is only for storing messages\n\
to be sent later.

!*strings.6541:Delivery failed for 1 message.\n\
\n\
This message has been left in the Outbox folder.\n\
Before it can be delivered, the error must be\n\
corrected.

!*strings.6540:Delivery failed for %d messages.\n\
\n\
These messages have been left in the Outbox folder.\n\
Before they can be delivered, the errors must be\n\
corrected.

!*strings.6539:You can't move a mail folder into a newsgroup.

!*strings.6538:You can't move a newsgroup into a mail folder.

!*strings.6537:Mail Server Problem: The UID's for the messages in this\n\
       folder are not increasing.  Contact your system administrator.

!*strings.6536:This mail server is not an IMAP4 mail server.

!*strings.6535:<TITLE>Go Online to View This Message</TITLE>\n\
The body of this message has not been downloaded from \n\
the server for reading offline. To read this message, \n\
you must reconnect to the network, choose Offline from \n\
the File menu and then select Work Online.

!*strings.6534:Compaction failed.

!*strings.6533:At least 30 new IMAP folders have been found.\n\
\n\
Press <OK> to continue or <cancel> to change\n\
the IMAP server directory.

!*strings.6532:Enter IMAP server directory name.

!*strings.6531:Posting to newsgroups on different hosts is not supported.

!*strings.6529:This IMAP folder is out of date.  Open it again for a more complete search.

!*strings.6528:Your new mail directory preference\n\
will take effect the next time\n\
you restart Communicator.

!*strings.6527:Netscape is unable to save your message as draft.\n\
Please verify that your Mail preferences are correct\n\
and try again.

!*strings.6526:Netscape is unable to save your message as template.\n\
Please verify that your Mail preferences are correct\n\
and try again.

!*strings.6525:Your SMTP mail server could not start a secure connection.\n\
You have requested to send mail ONLY in secure mode and therefore the connection has been aborted. Please check your preferences.

!*strings.6524:Your Send operation was successful, but copying the message\n\
to your Sent folder failed. Would you like to return to the compose\n\
window?

!*strings.6523:The %s character is reserved on imap server. Please choose another name.

!*strings.-1192:An I/O error occurred during security authorization.\n\
Please try your connection again

!*strings.-1191:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1190:The security library has received bad data.\n\
You will probably be unable to connect to this site securely.

!*strings.-1189:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1188:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1187:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1186:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1185:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1184:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1183:The security library has encountered an improperly formatted\n\
DER-encoded message.

!*strings.-1182:The server's certificate has an invalid signature.\n\
You will not be able to connect to this site securely.

!*strings.-1181:This operation cannot be performed because a required\n\
certificate has expired.  Click on the `Security' icon\n\
for more information about certificates.

!*strings.-1180:This operation cannot be performed because a required\n\
certificate has been revoked.  Click on the `Security'\n\
icon for more information about certificates.

!*strings.-1179:The certificate issuer for this server is not recognized by\n\
Netscape. The security certificate may or may not be valid.\n\
\n\
Netscape refuses to connect to this server.

!*strings.-1178:The server's public key is invalid.\n\
You will not be able to connect to this site securely.

!*strings.-1177:The security password entered is incorrect.

!*strings.-1176:You did not enter your new password correctly.  Please try again.

!*strings.-1175:The security library has experienced an error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1174:The security library has experienced a database error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1173:The security library has experienced an out of memory error.\n\
Please try to reconnect.

!*strings.-1172:The certificate issuer for this server has been marked as\n\
not trusted by the user.  Netscape refuses to connect to this\n\
server.

!*strings.-1171:The certificate for this server has been marked as not\n\
trusted by the user.  Netscape refuses to connect to this\n\
server.

!*strings.-1170:The Certificate that you are trying to download\n\
already exists in your database.

!*strings.-1169:You are trying to download a certificate whose name\n\
is the same as one that already exists in your database.\n\
If you want to download the new certificate you should\n\
delete the old one first.

!*strings.-1168:Error adding certificate to your database

!*strings.-1167:Error refiling the key for this certificate

!*strings.-1166:The Private Key for this certificate can\n\
not be found in your key database

!*strings.-1165:This certificate is valid.

!*strings.-1164:This certificate is not valid.

!*strings.-1163:No Response

!*strings.-1162:The certificate authority that issued this site's\n\
certificate has expired.\n\
Check your system date and time.

!*strings.-1161:The certificate revocation list for this certificate authority\n\
that issued this site's certificate has expired.\n\
Reload a new certificate revocation list or check your system data and time.

!*strings.-1160:The certificate revocation list for this certificate authority\n\
that issued this site's certificate has an invalid signature.\n\
Reload a new certificate revocation list.

!*strings.-1159:The certificate revocation list you are trying to load has\n\
an invalid format.

!*strings.-1158:Extension value is invalid.

!*strings.-1157:Extension not found.

!*strings.-1156:Issuer certificate is invalid.

!*strings.-1155:Certificate path length constraint is invalid.

!*strings.-1154:Certificate usages is invalid.

!*strings.-1153:**Internal ONLY module**

!*strings.-1152:The system tried to use a key which does not support\n\
the requested operation.

!*strings.-1151:Certificate contains unknown critical extension.

!*strings.-1150:The certificate revocation list you are trying to load is not\n\
later than the current one.

!*strings.-1149:This message cannot be encrypted or signed because you do not\n\
yet have an email certificate.  Click on the `Security' icon for more\n\
information about certificates.

!*strings.-1148:This message cannot be encrypted because you do not have\n\
certificates for each of the recipients.  Clicking on the\n\
`Security' icon will give you more information.\n\
\n\
Turn off encryption and send the message anyway?

!*strings.-1147:The data cannot be decrypted because you are not a recipient;\n\
either it was not intended for you, or a matching certificate or\n\
Private Key cannot be found in your local database.

!*strings.-1146:The data cannot be decrypted because the key encryption\n\
algorithm it used does not match that of your certificate.

!*strings.-1145:Signature verification failed due to no signer found,\n\
too many signers found, or improper or corrupted data.

!*strings.-1144:An unsupported or unknown key algorithm was encountered;\n\
the current operation cannot be completed.

!*strings.-1143:The data cannot be decrypted because it was encrypted using an\n\
algorithm or key size which is not allowed by this configuration.

!*strings.-1134:No Compromised Key List for this site's certificate has been found.\n\
You must load the Compromised Key List before continuing.

!*strings.-1133:The Compromised Key List for this site's certificate has expired.\n\
Reload a new Compromised Key List.

!*strings.-1132:The Compromised Key List for this site's certificate has an invalid signature.\n\
Reload a new Compromised Key List.

!*strings.-1131:The key for this site's certificate has been revoked.\n\
You will be unable to access this site securely.

!*strings.-1130:The Compromised Key List you are trying to load has\n\
an invalid format.

!*strings.-1129:The security library is out of random data.

!*strings.-1128:The security library could not find a security module which can\n\
perform the requested operation.

!*strings.-1127:The security card or token does not exist, needs to be initialized\n\
or has been removed.

!*strings.-1126:The security library has experienced a database error.\n\
You will probably be unable to connect to this site securely.

!*strings.-1125:No slot or token was selected.

!*strings.-1124:A certificate with the same name already exists.

!*strings.-1123:A key with the same name already exists.

!*strings.-1122:An error occurred while creating safe object

!*strings.-1121:An error occurred while creating safe object

!*strings.-1120:Couldn't remove the principal

!*strings.-1119:Couldn't delete the privilege

!*strings.-1118:This principal doesn't have a certificate

!*strings.-1117:The operation cannot be performed because the required\n\
algorithm is not allowed by this configuration.

!*strings.-1116:Unable to export certificates.  An error occurred attempting to\n\
export the certificates.

!*strings.-1115:An error occurred attempting to import the certificates.

!*strings.-1114:Unable to import certificates.  The file specified is either\n\
corrupt or is not a valid file.

!*strings.-1113:Unable to import certificates.  Either the integrity password\n\
is incorrect or the data in the file specified has been tampered\n\
with or corrupted in some manner.

!*strings.-1112:Unable to import certificates.  The algorithm used to generate the\n\
integrity information for this file is not supported in the application.

!*strings.-1111:Unable to import certificates.  Communicator only supports password\n\
integrity and password privacy modes for importing certificates.

!*strings.-1110:Unable to import certificates.  The file containing the certificates\n\
is corrupt.  Required information is either missing or invalid.

!*strings.-1109:Unable to import certificates.  The algorithm used to encrypt the\n\
contents is not supported by Communicator.

!*strings.-1108:Unable to import certificates.  The file is a version not supported by\n\
Communicator.

!*strings.-1107:Unable to import certificates.  The privacy password specified is\n\
incorrect.

!*strings.-1106:Unable to import certificates.  A certificate with the same nickname,\n\
as one being imported already exists in your Communicator database.

!*strings.-1105:The user pressed cancel.

!*strings.-1104:Certificates could not be imported since they already exist on the machine.

!*strings.-1102:The certificate is not approved for the attempted operation.

!*strings.-1101:The certificate is not approved for the attempted application.

!*strings.-1100:The email address in the signing certificate does not match\n\
the email address in the message headers.  If these two\n\
addresses do not belong to the same person, then this could\n\
be an attempt at forgery.

!*strings.-1099:Unable to import certificates.  An error occurred while attempting\n\
to import the Private Key associated with the certificate being imported.

!*strings.-1098:Unable to import certificates.  An error occurred while attempting\n\
to import the certificate chain associated with the certificate\n\
being imported.

!*strings.-1097:Unable to export certificates.  An error occurred while trying to locate\n\
a certificate or a key by its nickname.

!*strings.-1096:Unable to export certificates.  The Private Key associated with a\n\
certificate could not be located or could not be exported from the\n\
key database.

!*strings.-1095:Unable to export certificates.  An error occurred while trying to write\n\
the export file.  Make sure the destination drive is not full and try\n\
exporting again.

!*strings.-1094:Unable to import certificates.  An error occurred while reading the\n\
import file.  Please make sure the file exists and is not corrupt and\n\
then try importing the file again.

!*strings.-1093:Unable to export certificates.  The database which contains\n\
Private Keys has not been initialized.  Either your key database\n\
is corrupt or has been deleted.  There is no key associated with\n\
this certificate.

!*strings.-1092:Unable to generate Public/Private Key Pair.

!*strings.-1091:The password you entered is invalid.  Please pick a different one.

!*strings.-1090:You did not enter your old password correctly.  Please try again.

!*strings.-1089:The Certificate Name you entered is already in use by another certificate.

!*strings.-1088:Server FORTEZZA chain has a non-FORTEZZA Certificate. \n\
You will probably be unable to connect to this site securely.

!*strings.-1087:Unknown

!*strings.-1086:Invalid module name.

!*strings.-1085:Invalid module path/filename

!*strings.-1084:Unable to add module

!*strings.-1083:Unable to delete module

!*strings.-1082:The Compromised Key List you are trying to load is not\n\
later than the current one.

!*strings.-1081:The CKL you are trying to load has a different issuer\n\
than your current CKL.  You must first delete your\n\
current CKL.

!*strings.-1080:The Compromised Key List for this site's certificate\n\
is not yet valid.  Reload a new Compromised Key List.

!*strings.-1079:The certificate revocation list for this site's\n\
certificate is not yet valid. Reload a new certificate\n\
revocation list.

!*strings.23000:<head>%-styleinfo-%</head><body bgcolor="#bbbbbb"><div><form name=theform action=internal-dialog-handler method=post><input type="hidden" %-cont-%

!*strings.23001:name="handle" value="%0%"><input type="hidden" name="xxxbuttonxxx"><font size=2>

!*strings.23002:</font></form></div></body>%0%

!*strings.23008:<HTML><HEAD>%-styleinfo-%<TITLE>%0%</TITLE><SCRIPT LANGUAGE="JavaScript">\n\
var dlgstring ='

!*strings.23009:';\n\
var butstring ='

!*strings.23010:';\n\
function drawdlg(win){\n\
captureEvents(Event.MOUSEDOWN);\n\
with(win.frames[0]) {\n\
document.write(parent.dlgstring);document.close();\n\
}\n\
with(win.frames[1]) {\n\
butstring='<html><body bgcolor="#bbbbbb"><form>'%-cont-%

!*strings.23011:+butstring+'</form></body></html>';document.write(parent.butstring);document.close();\n\
}\n\
return false;\n\
}\n\
function clicker(but,win)\n\
{\n\
with(win.frames[0].document.forms[0]) {\n\
xxxbuttonxxx.value=but.value;\n\
xxxbuttonxxx.name='button';\n\
%-cont-%

!*strings.23012:submit();\n\
}\n\
}\n\
function onMouseDown(e)\n\
{\n\
if ( e.which == 3 )\n\
return false;\n\
return true;\n\
}\n\
</SCRIPT></HEAD><FRAMESET ROWS="*,50"ONLOAD="drawdlg(window)" BORDER=0>\n\
%-cont-%

!*strings.23013:<FRAME SRC="about:blank" MARGINWIDTH=5 MARGINHEIGHT=3 NORESIZE BORDER=NO>\n\
<FRAME SRC="about:blank" MARGINWIDTH=5 MARGINHEIGHT=0 NORESIZE SCROLLING=NO BORDER=NO>\n\
</FRAMESET></HTML>\n

!*strings.23014:<div align=right><input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80></div>

!*strings.23015:<div align=right><input type="button" name="button" value="%ok%" onclick="parent.clicker(this,window.parent)" width=80></div>

!*strings.23016:<div align=right><input type="button" name="button" value="%continue%" onclick="parent.clicker(this,window.parent)" width=80></div>

!*strings.23017:<div align=right><input type="button" value="%ok%" width=80 onclick="parent.clicker(this,window.parent)">&nbsp;&nbsp;<input type="button" value="%cancel%" width=80 onclick="parent.clicker(this,window.parent)"></div>

!*strings.23018:<div align=right><input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;<input type="button" name="button" value="%continue%" onclick="parent.clicker(this,window.parent)" width=80></div>

!*strings.23019:<head>%-styleinfo-%</head><body bgcolor="#bbbbbb"><form name=theform action=internal-panel-handler method=post><input type="hidden" %-cont-%

!*strings.23020:name="handle" value="%0%"><input type="hidden" name="xxxbuttonxxx"><font size=2>

!*strings.23026:<div align=right><input type="button" name="button" value="%next%" onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;<input %-cont-%

!*strings.23027:type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80></div>%0%

!*strings.23028:<div align=right><input type="button" name="button" value="%back%" onclick="parent.clicker(this,window.parent)" width=80><input type="button" name="button" value="%next%" %-cont-%

!*strings.23029:onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;<input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80></div>%0%

!*strings.23030:<dig align=right><input type="button" name="button" value="%back%" onclick="parent.clicker(this,window.parent)" width=80>%-cont-%

!*strings.23031:<input type="button" name="button" value="%finished%" onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;<input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80></div>%0%

!*strings.23032:%0%

!*strings.23033:<title>%0%</title><b>%1%</b><hr>%2%<hr>%3%

!*strings.23034:%0%%1%%2%

!*strings.23035:%sec-banner-begin%%0%%sec-banner-end%<b><div><font size=4>%1% is a site that uses encryption to protect transmitted information. %-cont-%

!*strings.23036:However, Netscape does not recognize the authority who signed its Certificate.</font></b></div><p><div>Although Netscape does not recognize the %-cont-%

!*strings.23037:signer of this Certificate, you may decide to accept it anyway so that you can connect to and exchange information with this site.<p>This %-cont-%

!*strings.23038:assistant will help you decide whether or not you wish to accept this Certificate and to what extent.%2%</div>

!*strings.23044:%sec-banner-begin%%0%%sec-banner-end%<div>Here is the Certificate that is being presented:</div><hr><table><tr><td valign=top><font %-cont-%

!*strings.23045:size=2>Certificate for: <br>Signed by: <br>Encryption: </font></td><td valign=top><font size=2>%1%<br>%2%<br>%3% Grade (%4% with %5%-bit secret %-cont-%

!*strings.23046:key)</font></td><td valign=bottom><input type="submit" name="button" value="%moreinfo%"></td></tr></table><hr><div>The signer of the %-cont-%

!*strings.23047:Certificate promises you that the holder of this Certificate is who they say they are.  The encryption level is an indication of how difficult it %-cont-%

!*strings.23048:would be for someone to eavesdrop on any information exchanged between you and this web site.%6%</div>

!*strings.23049:%sec-banner-begin%%0%%sec-banner-end%<div>Are you willing to accept this certificate for the purposes of receiving encrypted %-cont-%

!*strings.23050:information from this web site?<p>This means that you will be able to browse through the site and receive documents from it and that all of %-cont-%

!*strings.23051:these documents are protected from observation by a third party by encryption.<p><input type=radio name=accept value=session%1%>Accept this %-cont-%

!*strings.23052:certificate for this session<br><input type=radio name=accept value=cancel%2%>Do not accept this certificate and do not connect<br><input type=radio name=accept %-cont-%

!*strings.23053:value=forever%3%>Accept this certificate forever (until it expires)</div><br>%4%

!*strings.23064:%sec-banner-begin%%0%%sec-banner-end%<div>By accepting this certificate you are ensuring that all information you exchange with this site %-cont-%

!*strings.23065:will be encrypted.  However, encryption will not protect you from fraud.<p>To protect yourself from fraud, do not send information %-cont-%

!*strings.23066:(especially personal information, credit card numbers, or passwords) to this site if you have any doubt about the site's integrity.<p>For your %-cont-%

!*strings.23067:own protection, Netscape can remind you of this at the appropriate time.<p><center><input type=checkbox name=postwarn value=yes %1%>Warn me %-cont-%

!*strings.23068:before I send information to this site</center><p></div>%2%

!*strings.23069:%sec-banner-begin%%0%%sec-banner-end%<b><div>You have finished examining the certificate presented by:<br>%1%</b><p>You have %-cont-%

!*strings.23070:decided to refuse this ID. If, in the future, you change your mind about this decision, just visit this site again and this assistant will %-cont-%

!*strings.23071:reappear.<p>Click on the Finish button to return to the document you were viewing before you attempted to connect to this site.</div>%2%

!*strings.23072:%sec-banner-begin%%0%%sec-banner-end%<b><div>You have finished examining the certificate presented by:<br>%1%</b></div><p><div>You have %-cont-%

!*strings.23073:decided to accept this certificate and have asked that Netscape Communicator warn you before you send information to this site.<p>If you %-cont-%

!*strings.23074:change your mind, open Security Info from the Communicator menu and edit Site Certificates.<p>Click on the Finish button to begin receiving documents.%2%

!*strings.23080:%sec-banner-begin%%0%%sec-banner-end%<b><div>You have finished examining the certificate presented by:<br>%1%</div></b><p><div>You have %-cont-%

!*strings.23081:decided to accept this certificate and have decided not to have Netscape Communicator warn you before you send information to this site.</div><p><div>If %-cont-%

!*strings.23082:you change your mind, open Security Info from the Communicator Menu edit Site Certificates.<p>Click on the Finish button to begin %-cont-%

!*strings.23083:receiving documents.</div>%2%

!*strings.23084:%sec-banner-begin%%0%%sec-banner-end%<div>The certificate that the site '%1%' has presented does not contain the correct site %-cont-%

!*strings.23085:name. It is possible, though unlikely, that someone may be trying to intercept your communication with this site.  If you suspect the %-cont-%

!*strings.23086:certificate shown below does not belong to the site you are connecting with, please cancel the connection and notify the site administrator. <p>%-cont-%

!*strings.23087:Here is the Certificate that is being presented:</div><hr><table><tr><td valign=top><font size=2>Certificate for: <br>Signed by: <br>Encryption: %-cont-%

!*strings.23088:</font></td><td valign=top><font size=2>%2%<br>%3%<br>%4% Grade (%5% with %6%-bit secret key)</font></td><td valign=bottom><input %-cont-%

!*strings.23089:type="submit" name="button" value="%moreinfo%"></td></tr></table><hr>%7%

!*strings.23100:%sec-banner-begin%%0%%sec-banner-end%Please enter your new password.  The safest passwords are a combination of letters %-cont-%

!*strings.23101:and numbers, are at least 8 characters long, and contain no words from a dictionary.<p>Password: <input type=password name=password1><p>Type in %-cont-%

!*strings.23102:your password, again, for verification:<p>Retype Password: <input type=password name=password2><p><b>Do not forget your password!  Your %-cont-%

!*strings.23103:password cannot be recovered. If you forget it, you will have to obtain new Certificates.</b>

!*strings.23109:%sec-banner-begin%%0%%sec-banner-end%You did not enter your password correctly.  Please try again:<p>Password: <input %-cont-%

!*strings.23110:type=password name=password1><p>Type in your password, again, for verification:<p>Retype Password: <input type=password name=password2><p>%-cont-%

!*strings.23111:<b>Do not forget your password!  Your password cannot be recovered. If you forget it, you will have to obtain new Certificates.</b> 

!*strings.23112:%sec-banner-begin%%0%%sec-banner-end%It is strongly recommended that you protect your Private Key with a %-cont-%

!*strings.23113:Communicator password.  If you do not want a password, leave the password field blank.<P>The safest passwords are at least 8 characters long, include %-cont-%

!*strings.23114:both letters and numbers, and contain no words from a dictionary.<P><table><tr><td>Password:</td><td><input type=password name=password1></td>%-cont-%

!*strings.23115:</td></tr><tr><td>Type it again to confirm:</td><td><input type=password name=password2></td><td valign=bottom></td></tr></table><B>Important: %-cont-%

!*strings.23116:Your password cannot be recovered.  If you forget it, you will lose all of your certificates.</B><P>If you wish to change your password or other security %-cont-%

!*strings.23117:preferences, choose Security Info from the Communicator menu.

!*strings.23128:%sec-banner-begin%%0%%sec-banner-end%You have elected to operate without a password.<p>If you decide that you %-cont-%

!*strings.23129:would like to have a password to protect your Private Keys and Certificates, you can set up a password in Security Preferences.

!*strings.23130:%sec-banner-begin%%0%%sec-banner-end%Change the password for the %1%.<p>Enter your old password: <input %-cont-%

!*strings.23131:type=password name=password value=%2%><P><P>Enter your new password.  Leave the password fields blank if you don't want a password.<p><table><tr><td>%-cont-%

!*strings.23132:New Password:</td><td><input type=password name=password1></td></tr><tr><td>Type it again to confirm:</td><td><input type=password name=password2>%-cont-%

!*strings.23133:</td></tr></table><p><B>Important: Your password cannot be recovered.  If you forget it, you will lose all of your certificates.</B>

!*strings.23140:%sec-banner-begin%%0%%sec-banner-end%Your attempt to change your password failed.<p>This may be because your %-cont-%

!*strings.23141:key database is inaccessible (which can happen if you were already running a Communicator when you started this one), or because of some other %-cont-%

!*strings.23142:error.<p>It may indicate that your key database file has been corrupted, in which case you should try to get it from of a backup, if possible. As %-cont-%

!*strings.23143:a last resort, you may need to delete your key database, after which you will have to obtain new personal Certificates.

!*strings.23194:<table border=0 cellpadding=0 cellspacing=0 width="100%%"><td><input type="button" value="%moreinfo%" width=80 onclick="parent.clicker(this,window.parent)"></td>%-cont-%

!*strings.23195:<td align="right" nowrap><input type="button" value="%ok%" width=80 onclick="parent.clicker(this,window.parent)">&nbsp;&nbsp;%-cont-%

!*strings.23196:<input type="button" value="%cancel%" width=80 onclick="parent.clicker(this,window.parent)"></td></table>

!*strings.23199:<div align=right><input type="button" name="button" value="%finished%" onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;%-cont-%

!*strings.23200:<input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80></div>%0%

!*strings.23211:%sec-banner-begin%%0%%sec-banner-end%This function is not implemented:<br>%1%<br>Certificate name:<br>%2%

!*strings.23212:%0%%1%

!*strings.23213:<b><FONT SIZE=4>WARNING: If you delete this Certificate you will not be able to read any E-mail that has been encrypted with it.</FONT></b><p>Are you sure that you want to delete this Personal Certificate?<p>%0%

!*strings.23214:Are you sure that you want to delete this Site Certificate?<p>%0%

!*strings.23215:Are you sure that you want to delete this Certificate Authority?<p>%0%

!*strings.23216:%0%<hr>This Certificate belongs to an SSL server site.<br><input type=radio name=allow value=yes %1%>Allow connections to this site<br>%-cont-%

!*strings.23217:<input type=radio name=allow value=no %2%>Do not allow connections to this site<hr><input type=checkbox name=postwarn value=yes %3%>Warn %-cont-%

!*strings.23218:before sending data to this site

!*strings.23224:%0%<hr><div>This Certificate belongs to a Certifying Authority<br> %-cont-%

!*strings.23225:%1%<br>%2%<br>%3%<hr><input %-cont-%

!*strings.23226:type=checkbox name=postwarn value=yes %4%>Warn before sending data to sites certified by this authority</div>

!*strings.23232:%sec-banner-begin%%0%%sec-banner-end%<b>Warning: You %-cont-%

!*strings.23233:are about to send encrypted information to the site %1%.</b><p>It is safer not to send information (particularly personal information, credit %-cont-%

!*strings.23234:card numbers, or passwords) to this site if you are in doubt about its Certificate or integrity.<br>Here is the Certificate for this site:<hr>%-cont-%

!*strings.23235:<table><tr><td valign=top><font size=2>Certificate for: <br>Signed by: <br>Encryption: </font></td><td valign=top><font size=2>%2%<br>%3%<br>%-cont-%

!*strings.23236:%4% Grade (%5% with %6%-bit secret key)</font></td><td valign=bottom><font size=2><input type="submit" name="button" value="%moreinfo%%-cont-%

!*strings.23237:"></font></td></tr></table><hr><input type=radio name=action value=sendandwarn checked>Send this information and warn again next %-cont-%

!*strings.23238:time<br><input type=radio name=action value=send>Send this information and do not warn again<br><input type=radio name=action value=dontsend>Do not send information<br>%7%

!*strings.23239:%sec-banner-begin%%0%%sec-banner-end%<div>You are about to %-cont-%

!*strings.23240:go through the process of accepting a Certificate Authority. This has serious implications on the security of future encryptions using %-cont-%

!*strings.23241:Netscape. This assistant will help you decide whether or not you wish to accept this Certificate Authority.</div>

!*strings.23252:%sec-banner-begin%%0%%sec-banner-end%<div>A Certificate %-cont-%

!*strings.23253:Authority certifies the identity of sites on the internet. By accepting this Certificate Authority, you will allow Netscape Communicator to connect %-cont-%

!*strings.23254:to and receive information from any site that this authority certifies without prompting or warning you.</div><p><div>If you choose to refuse this %-cont-%

!*strings.23255:Certificate Authority, you will be prompted before you connect to or receive information from any site that this authority certifies.</div> 

!*strings.23261:%sec-banner-begin%%0%%sec-banner-end%<div>Here is the certificate for this Certificate Authority. Examine it carefully. The %-cont-%

!*strings.23262:Certificate Fingerprint can be used to verify that this Authority is who they say they are. To do this, compare the Fingerprint against the %-cont-%

!*strings.23263:Fingerprint published by this authority in other places.</div><hr><table><tr><td valign=top><font size=2>Certificate for: <br>Signed by: </font></td>%-cont-%

!*strings.23264:<td valign=top><font size=2>%1%<br>%2%</font></td><td valign=bottom><font size=2><input type="submit" name="button" value="%moreinfo%%-cont-%

!*strings.23265:"></font></td></tr></table><hr>

!*strings.23266:%sec-banner-begin%%0%%sec-banner-end%<div>Are you willing to accept this Certificate Authority for the purposes of certifying %-cont-%

!*strings.23267:other internet sites, email users, or software developers?<p> %1%%2%%3%</div>

!*strings.23275:%sec-banner-begin%%0%%sec-banner-end%<div>By accepting this Certificate Authority, you have told Netscape Communicator to connect to %-cont-%

!*strings.23276:to connect to and receive information from any site that it certifies  without warning you or prompting you.<p>Netscape Communicator can, however, warn you before %-cont-%

!*strings.23277:you send information to such a site.</div><p><div><input type=checkbox name=postwarn value=yes %1%>Warn me before sending information to sites %-cont-%

!*strings.23278:certified by this Certificate Authority</div>

!*strings.23279:%sec-banner-begin%%0%%sec-banner-end%<div>You have accepted this Certificate Authority.  Please enter a short name to identify this %-cont-%

!*strings.23280:Certificate Authority, for example <b>Netscape Corporate CA</b>. <p>Name: <font size=4><input type=text %-cont-%

!*strings.23281:name=nickname></font></div>

!*strings.23282:%sec-banner-begin%%0%%sec-banner-end%By rejecting this Certificate Authority, you have told Netscape Communicator not to connect %-cont-%

!*strings.23283:to and receive information from any site that it certifies without prompting you.

!*strings.23294:%0%

!*strings.23295:%sec-banner-begin%%0%%sec-banner-end%The site '%1%' has requested client authentication.<p>Here is the %-cont-%

!*strings.23296:site's certificate:<hr><table><tr><td valign=top><font size=2>Certificate for: <br>Signed by: <br>Encryption: </font></td><td valign=top><font %-cont-%

!*strings.23297:size=2>%2%<br>%3%<br>%4% Grade (%5% with %6%-bit secret key)</font></td><td valign=bottom><input type="submit" name="button" value="%moreinfo%%-cont-%

!*strings.23298:"></td></tr></table><hr>Select Your Certificate:<select name=cert>%7%</select>%8%

!*strings.23304:%sec-banner-begin%%0%%sec-banner-end%The site '%1%' has requested client authentication, but you do not have a Personal %-cont-%

!*strings.23305:Certificate to authenticate yourself.  The site may choose not to give you access without one.%2%

!*strings.23306:%sec-banner-begin%%0%%sec-banner-end%<B>All of the files that you have requested were encrypted.</B><p> This means that the %-cont-%

!*strings.23307:files that make up the document are sent to you encrypted for privacy while in transit.<p> For more details on the encryption of this %-cont-%

!*strings.23308:document, open Document Information.<p> <center><input type="submit" name="button" value="%ok%"><input type="submit" name="button" %-cont-%

!*strings.23309:value="%showdocinfo%"></center>%1%

!*strings.23315:<img src=about:security?banner-mixed>%0%<br clear=all><p><B>Some of the files that you have requested were encrypted.</B><p> Some of these files %-cont-%

!*strings.23316:are sent to you encrypted for privacy while in transit. Others are not encrypted and can be observed by a third party while in transit.<p>To %-cont-%

!*strings.23317:find out exactly which files were encrypted and which were not, open Document Information.<p> <center><input type="submit" name="button" %-cont-%

!*strings.23318:value="%ok%"><input type="submit" name="button" value="%showdocinfo%"></center>%1%

!*strings.23319:<img src=about:security?banner-insecure>%0%<br clear=all><p><B>None of the files that you have requested are encrypted.</B><p>Unencrypted files can %-cont-%

!*strings.23320:be observed by a third party while in transit.<p> <center><input type="submit" name="button" value="%ok%"></center>%1%

!*strings.23336:RC2 encryption in CBC mode with a 40-bit key

!*strings.23337:RC2 encryption in CBC mode with a 64-bit key

!*strings.23338:RC2 encryption in CBC mode with a 128-bit key

!*strings.23339:DES encryption in CBC mode with a 56-bit key

!*strings.23340:DES EDE3 encryption in CBC mode with a 168-bit key

!*strings.23341:RC5 encryption in CBC mode with a 40-bit key

!*strings.23342:RC5 encryption in CBC mode with a 64-bit key

!*strings.23343:RC5 encryption in CBC mode with a 128-bit key

!*strings.23351:No valid encryption policy file was found for this English language \n\
version of Communicator.  All encryption and decryption will be disabled.

!*strings.23352:  (No ciphers are permitted)

!*strings.23353:  (When permitted)

!*strings.23354:%sec-banner-begin%%0%%sec-banner-end%<h3>Select ciphers to enable for S/MIME %1%</h3><ul>%2%</ul>%3%

!*strings.23355:%sec-banner-begin%%0%%sec-banner-end%<h3>Select ciphers to enable for SSL v2 %1%</h3><ul>%2%</ul>%3%

!*strings.23356:%sec-banner-begin%%0%%sec-banner-end%<h3>Select ciphers to enable for SSL v3 %1%</h3><ul>%2%</ul>%3%

!*strings.23392:%sec-banner-begin%%0%%sec-banner-end%When you click OK, Communicator will generate a Private Key for your %-cont-%

!*strings.23393:Certificate.  This may take a few minutes.<P><B>Important: If you interrupt this process, you will have to reapply for the Certificate.</B>%1% %2% %3%<P>

!*strings.23394:Key Generation Info

!*strings.23401:%sec-banner-begin%%0%%sec-banner-end%%1% is a site that uses encryption to protect transmitted information.  However the %-cont-%

!*strings.23402:digital Certificate that identifies this site has expired.  This may be because the certificate has actually expired, or because the date on %-cont-%

!*strings.23403:your computer is wrong.<p>The certificate expires on %2%.<p>Your computer's date is set to %3%.  If this date is incorrect, then you %-cont-%

!*strings.23404:should reset the date on your computer.<p>You may continue or cancel this connection.%4%

!*strings.23410:%sec-banner-begin%%0%%sec-banner-end%%1% is a site that uses encryption to protect transmitted information.  However the %-cont-%

!*strings.23411:digital Certificate that identifies this site is not yet valid.  This may be because the certificate was installed too soon by the site %-cont-%

!*strings.23412:administrator, or because the date on your computer is wrong.<p>The certificate is valid beginning %2%.<p>Your computer's date is set to %-cont-%

!*strings.23413:%3%.  If this date is incorrect, then you should reset the date on your computer.<p>You may continue or cancel this connection.%4%

!*strings.23419:%sec-banner-begin%%0%%sec-banner-end%%1% is a site that uses encryption to protect transmitted information.  However one of %-cont-%

!*strings.23420:the Certificate Authorities that identifies this site has expired.  This may be because a certificate has actually expired, or because the date %-cont-%

!*strings.23421:on your computer is wrong. Press the More Info button to see details of the expired certificate.<hr><table cellspacing=0 cellpadding=0><tr><td %-cont-%

!*strings.23422:valign=top><font size=2>Certificate Authority: <br>Expiration Date: </font></td><td valign=top><font size=2>%2%<br>%3%</font></td><td %-cont-%

!*strings.23423:valign=center align=right><input type="submit" name="button" value="%moreinfo%"></td></tr></table><hr>Your computer's date is set %-cont-%

!*strings.23424:to %4%.  If this date is incorrect, then you should reset the date on your computer.<p>You may continue or cancel this connection.

!*strings.23430:%sec-banner-begin%%0%%sec-banner-end%%1% is a site that uses encryption to protect transmitted information.  However one of %-cont-%

!*strings.23431:the Certificate Authorities that identifies this site is not yet valid.  This may be because a certificate was install too soon by the site %-cont-%

!*strings.23432:administrator, or because the date on your computer is wrong. Press the More Info button to see details of the expired certificate.<hr><table %-cont-%

!*strings.23433:cellspacing=0 cellpadding=0><tr><td valign=top><font size=2>Certificate Authority: <br>Certificate Valid On: </font></td><td valign=top><font %-cont-%

!*strings.23434:size=2>%2%<br>%3%</font></td><td valign=center align=right><input type="submit" name="button" value="%moreinfo%"></td></tr></table>%-cont-%

!*strings.23435:<hr>Your computer's date is set to %4%.  If this date is incorrect, then you should reset the date on your computer.<p>You may continue or cancel %-cont-%

!*strings.23436:this connection.

!*strings.23492:Cancel

!*strings.23493:OK

!*strings.23494:Continue

!*strings.23495:Next&gt;

!*strings.23496:&lt;Back

!*strings.23497:Finish

!*strings.23498:More Info...

!*strings.23499:Show Certificate

!*strings.23500:Show Order

!*strings.23501:Show Document Info

!*strings.23507:Next>

!*strings.23508:<Back

!*strings.23509:Save As...

!*strings.23516:Alert

!*strings.23517:View A Certificate

!*strings.23518:Certificate Name Check

!*strings.23519:Certificate Is Expired

!*strings.23520:Certificate Is Not Yet Good

!*strings.23521:Certificate Authority Is Expired

!*strings.23522:Certificate Authority Is Not Yet Good

!*strings.23523:Encryption Information

!*strings.23534:View A Personal Certificate

!*strings.23535:Delete A Personal Certificate

!*strings.23536:Delete A Site Certificate

!*strings.23537:Delete A Certificate Authority

!*strings.23538:Edit A Site Certificate

!*strings.23539:Edit A Certification Authority

!*strings.23540:No User Certificate

!*strings.23541:Select A Certificate

!*strings.23542:Security Information

!*strings.23543:Generate A Private Key

!*strings.23544:New Site Certificate

!*strings.23545:New Certificate Authority

!*strings.23552:Setting Up Your Communicator Password

!*strings.23553:Change Your Communicator Password

!*strings.23554:Enable Your Communicator Password

!*strings.23555:Password Error

!*strings.23556:Configure Ciphers

!*strings.23557:%sec-banner-begin%%0%%sec-banner-end%The certificate that you have selected has expired and may %-cont-%

!*strings.23558:be rejected by the server.  You may press Continue to send it anyway, or Cancel to abort this connection.

!*strings.23569:%sec-banner-begin%%0%%sec-banner-end%<table><tr><td>The certificate that you have selected has expired and may %-cont-%

!*strings.23570:be rejected by the server.  You may press %continue% to send it anyway, or %cancel% to abort this connection.  To renew your %-cont-%

!*strings.23571:certificate press the %renew% button.</td><td><input type=submit name=button value=%renew%></td></tr></table>

!*strings.23577:Renew

!*strings.23578:%sec-banner-begin%%0%%sec-banner-end%The certificate that you have selected is not yet valid and may be rejected by the server.  You may press Continue to send it anyway, or Cancel to abort this connection.

!*strings.23579:Your Certificate Is Expired

!*strings.23580:Ask every time

!*strings.23581:Let Communicator choose automatically

!*strings.23582:1024 (High Grade)

!*strings.23583: 768 (Medium Grade)

!*strings.23584: 512 (Low Grade)

!*strings.23640:View Certificate Policy

!*strings.23641:Check Certificate Status

!*strings.23642:RC4 encryption with a 128-bit key

!*strings.23643:RC2 encryption with a 128-bit key

!*strings.23644:Triple DES encryption with a 168-bit key

!*strings.23645:DES encryption with a 56-bit key

!*strings.23646:RC4 encryption with a 40-bit key

!*strings.23647:RC2 encryption with a 40-bit key

!*strings.23653:RC4 encryption with a 128-bit key and an MD5 MAC

!*strings.23654:Triple DES encryption with a 168-bit key and a SHA-1 MAC

!*strings.23655:DES encryption with a 56-bit key and a SHA-1 MAC

!*strings.23656:RC4 encryption with a 40-bit key and an MD5 MAC

!*strings.23657:RC2 encryption with a 40-bit key and an MD5 MAC

!*strings.23658:No encryption with an MD5 MAC

!*strings.23659:RC4 encryption with a 56-bit key and a SHA-1 MAC

!*strings.23660:DES encryption in CBC mode with a 56-bit key and a SHA-1 MAC

!*strings.23709:<h3>CRL List:</h3><table><tr><td><select name=crl size=10>%0%</select></td><td valign="middle">%-cont-%

!*strings.23710:<input type="submit" name="button" value="%new%"></input><br>%-cont-%

!*strings.23711:<input type="submit" name="button" value="%reload%"></input><br>%-cont-%

!*strings.23712:<input type="submit" name="button" value="%moreinfo%"></input><br>%-cont-%

!*strings.23713:<input type="submit" name="button" value="%delete%"></input><br>%-cont-%

!*strings.23714:</td></tr></table>

!*strings.23715:New/Edit ...

!*strings.23716:Reload

!*strings.23717:Delete

!*strings.23718:FIPS 140-1 compliant triple DES encryption and SHA-1 MAC

!*strings.23719:FIPS 140-1 compliant DES encryption and SHA-1 MAC

!*strings.23727:Edit Security Module

!*strings.23728:Create a New Security Module

!*strings.23734:FORTEZZA encryption with a 80-bit key and an SHA-1 MAC

!*strings.23735:FORTEZZA authentication with RC4 128-bit key and an SHA-1 MAC

!*strings.23736:No encryption with FORTEZZA authentication and an SHA-1 MAC

!*strings.23742:Please enter the password or the pin for\n\
%s.

!*strings.23743:%sec-banner-begin%%0%%sec-banner-end%The %1% has not been initialized with a User PIN or Password.  In order %-cont-%

!*strings.23744:to initialize this card, you must enter the Administration or Site Security Password.  If you do not know this password, please hit <B>cancel</B>, and %-cont-%

!*strings.23745:take this card back to your issuer to be initialized.<p>Enter adminstration Password for the %2%:<input type=password name=ssopassword>.

!*strings.23751:%sec-banner-begin%%0%%sec-banner-end%The administration password you entered for the %1% was incorrect.  %-cont-%

!*strings.23752:Many cards disable themselves after too many incorrect password attempts.  If you do not know this password, please hit <B>cancel</B>, and take this card %-cont-%

!*strings.23753:back to your issuer to be initialized.<p>Enter adminstration Password for the %2%:<input type=password name=ssopassword>.

!*strings.23754:%sec-banner-begin%%0%%sec-banner-end%The %1% could not be initialized because of the following error:<p> %2%

!*strings.23755:Edit Defaults...

!*strings.23756:Login

!*strings.23757:Logout

!*strings.23758:%0%%1%%2%%3%%4%%5%

!*strings.23759:Security Info

!*strings.23760:Set Password...

!*strings.23761:Slot or Token does not require a login.

!*strings.23762:Slot or Token is already logged in.

!*strings.23763:<p>Select the card or database you wish to generate your key in:<SELECT name="tokenName">

!*strings.23764:Token %s is write protected, certs and keys cannot be deleted

!*strings.23766:Slot failed to Initialize.

!*strings.23767:User has manually disabled this slot.

!*strings.23768:Token failed startup tests.

!*strings.23769:Permanent Token not present.

!*strings.23780:Java Security

!*strings.23781:Java Security (Delete Privilege)

!*strings.23782:Java Security (Edit Privileges)

!*strings.23783:Are you sure that you want to delete all the privileges for all applets and scripts from <b>%0%</b>?

!*strings.23784:Allow applets and scripts from <b> %0% </b> to have the following access %-cont-%

!*strings.23785:<table><tr><td colspan=3>Always:</td></tr> <tr><td><select name=target size=3> %1% </select></td> %-cont-%

!*strings.23786:<td></td><td> <input type="submit" name="button" value="%delete%"></input>%-cont-%

!*strings.23787:<input type="submit" name="button" value="%moreinfo%"></input></td></tr></table>%-cont-%

!*strings.23788:<table><tr><td colspan=3>For this session only:</td></tr> <tr><td><select name=target size=3> %2% </select></td> %-cont-%

!*strings.23789:<td></td><td> <input type="submit" name="button" value="%delete%"></input>%-cont-%

!*strings.23790:<input type="submit" name="button" value="%moreinfo%"></input></td></tr></table>%-cont-%

!*strings.23791:<table><tr><td colspan=3>Never:</td></tr> <tr><td><select name=target size=3> %3% </select></td> %-cont-%

!*strings.23792:<td></td><td> <input type="submit" name="button" value="%delete%"></input>%-cont-%

!*strings.23793:<input type="submit" name="button" value="%moreinfo%"></input></td></tr></table>

!*strings.23804:Are you sure that you want to delete the <b>%0%</b> privileges for all applets and scripts from <b>%1%</b>?

!*strings.23805:<b> %0% </b> is a <b> %1% </b> access.<br> <ul>It consists of:<br><select name=details size=6> %2% </select></ul>

!*strings.23806:<table BORDER=0><tr><td VALIGN=top><font SIZE=2><b>Danger <SPACER TYPE=horizontal SIZE=7></B><br></td> %-cont-%

!*strings.23807:<td "100%%"><font SIZE=2>A Java applet or JavaScript script from <b>%0%</b> is requesting unusual access to your computer or network. %-cont-%

!*strings.23808:You should not grant this access unless you trust that vendor or distributor.</td></tr><tr><td valign=top colspan=2><center> <input type="submit" name="button" value="%3%"></input> %-cont-%

!*strings.23809:</center><spacer type=vertical size=20></td></tr> <tr><td></td><td><font size=2>The access requested is <b>%1%</b> and consists of:</td></tr> %-cont-%

!*strings.23810:<tr><td coldspan=2><center><table> <td><select multiple name=target size=4>%2%</select></td> <td><input type="submit" name="button" value="%moreinfo%"> </input></td></table></center></td></tr></table> %-cont-%

!*strings.23811:<br>Do you wish to grant the requested access? <br><spacer type=horizontal size=5><input type=radio name=perm value=yes> Yes, grant this access to all applets and scripts from <b>%0%</b> for this session %-cont-%

!*strings.23812:<br><spacer type=horizontal size=5><input type=radio name=perm value=no checked> No, deny this access (This may mean the applet or script cannot work properly) %-cont-%

!*strings.23813:<br><input type=checkbox name=remember> Remember this decision for all applets and scripts from <b>%0%</b><br></td></table>

!*strings.23824:<table BORDER=0><tr><td VALIGN=top><font SIZE=2><b>Danger <SPACER TYPE=horizontal SIZE=7></B><br></td> %-cont-%

!*strings.23825:<td "100%%"><font SIZE=2>A Java applet or JavaScript script on the server "<b>%0%</b>" is requesting unusual access to your computer or network. %-cont-%

!*strings.23826:It is <b>not digitally signed</b>. Be aware that it may have been tampered with and may cause harm to your computer. </td></tr> <tr><td></td><td><font size=2>The access requested is <b>%1%</b> and consists of:</td></tr> %-cont-%

!*strings.23827:<tr><td coldspan=2><center><table> <td><select multiple name=target size=4>%2%</select></td> <td><input type="submit" name="button" value="%moreinfo%"> </input></td></table></center></td></tr></table> %-cont-%

!*strings.23828:<br>Do you wish to grant the requested access? <br><spacer type=horizontal size=5><input type=radio name=perm value=yes> Yes, grant this access to all applets and scripts on the "<b>%0%</b>" server for this session %-cont-%

!*strings.23829:<br><spacer type=horizontal size=5><input type=radio name=perm value=no checked> No, deny this access (This may mean the applet or script cannot work properly) %-cont-%

!*strings.23830:<br><input type=checkbox name=remember> Remember this decision for all applets and scripts on the "<b>%0%</b>" server <br></td></table>

!*strings.23841:<b>Security Module Name:</b> <input name="name"><br><b>Security Module File:</b> <input name="library"><br>

!*strings.23842:You must specify a PKCS #11 Version 2.0 library to load\n

!*strings.23843:<b>Slot Description:</b> %0%<br><b>Manufacturer:</b> %1%<br><b>Version Number:</b> %2%<br><b>Firmware Version:</b> %3%<br>%-cont-%

!*strings.23844:%4%<b>Token Name:</b> %5%<br><b>Token Manufacturer:</b>%6%<br><b>Token Model:</b> %7%<br><b>Token Serial Number:</b>%8%<br>%-cont-%

!*strings.23845:<b>Token Version:</b> %9%<br><b>Token Firmware Version:</b> %10%<br><b>Login Type:</b> %11%<br><b>State:</b>%12%%13%%14%

!*strings.23846:Token/Slot Information

!*strings.23847:Login Required

!*strings.23848:Public (no login required)

!*strings.23849:Ready

!*strings.23850:<font color=red>Not Logged In</font>

!*strings.23851:<font color=red>Uninitialized</font>

!*strings.23852:<font color=red>Not Present</font>

!*strings.23853:<font color=red>Disabled(

!*strings.23854:)</font>

!*strings.23860: Initialize Token

!*strings.23861: Change Password 

!*strings.23862:   Set Password  

!*strings.23863:   No Password   

!*strings.23864:%sec-banner-begin%%0%%sec-banner-end%You are downloading the e-mail certificate of another user.  After accepting %-cont-%

!*strings.23865:this certificate you will be able to send encrypted e-mail to this user. Press the More Info button to see details of the e-mail certificate. %-cont-%

!*strings.23866:<hr><table cellspacing=0 cellpadding=0><tr><td valign=top><table cellspacing=0 cellpadding=0><tr><td><font size=2>Certificate For:%-cont-%

!*strings.23867:</font></td><td><font size=2>%1%</font></td></tr><tr><td><font size=2>Email Address:</font></td><td><font size=2>%2%</font></td></tr><tr><td>%-cont-%

!*strings.23868:<font size=2>Certified By:</font></td><td><font size=2>%3%</font></td></tr></table></td><td valign=center align=right><input type="submit" name="button" value="%moreinfo%"></td></tr></table><hr>

!*strings.23874:Download an E-Mail Certificate

!*strings.23875:Accept this Certificate Authority for Certifying network sites

!*strings.23876:Accept this Certificate Authority for Certifying e-mail users

!*strings.23877:Accept this Certificate Authority for Certifying software developers

!*strings.23878:%0%<p>%1%

!*strings.23879:Select A Certificate

!*strings.23880:Please select a certificate to edit:<p>

!*strings.23881:Please select a certificate to delete:<p>

!*strings.23882:Please select a certificate to view:<p>

!*strings.23883:Please select a certificate to verify:<p>

!*strings.23884:Delete An E-mail Certificate

!*strings.23885:Are you sure that you want to delete this E-mail Certificate?<p>%0%

!*strings.23937:Netscape Communications Corp    

!*strings.23938:Communicator Internal Crypto Svc

!*strings.23939:Communicator Generic Crypto Svcs

!*strings.23940:Communicator Certificate DB     

!*strings.23946:Communicator Internal Cryptographic Services Version 4.0        

!*strings.23947:Communicator User Private Key and Certificate Services          

!*strings.23953:Netscape Internal FIPS-140-1 Cryptographic Services             

!*strings.23954:Netscape FIPS-140-1 User Private Key Services                   

!*strings.23955:Verification of the selected certificate failed for the following reasons:<p>%0%

!*strings.23956:Verify A Certificate

!*strings.23962:The Certificate has been successfully verified.

!*strings.23963:Certificate has expired

!*strings.23964:Not certified for %s

!*strings.23965:Certificate not trusted

!*strings.23966:Unable to find Certificate Authority

!*strings.23967:Certificate signature is invalid

!*strings.23968:Certificate Revocation List is invalid

!*strings.23969:Certificate has been revoked

!*strings.23970:Not a valid Certificate Authority

!*strings.23971:Internal Error

!*strings.23972:Digital Signing

!*strings.23973:Encryption

!*strings.23974:Certificate Signing

!*strings.23975:Unknown Usage

!*strings.23976:E-Mail Certification

!*strings.23977:Internet Site Certification

!*strings.23978:Software Developer Certification

!*strings.23979:E-Mail

!*strings.23980:Internet Site

!*strings.23981:Software Developer

!*strings.23987:%0%

!*strings.23988:This will replace the Netscape internal module with the Netscape FIPS-140-1 cryptographic module.\n\
\n\
The FIPS-140-1 cryptographic module limits security 

!*strings.23989:functions to those approved by the United States Federal Government's internal standards.\n\
\n\
Do you wish to delete the internal module, anyway?

!*strings.23995:This will replace the FIPS-140-1 cryptographic module with the Netscape internal module.\n\
\n\
This means that Communicator will no longer be FIPS-140-1 compliant (security 

!*strings.23996:functions to those approved by the United States Federal Government's internal standards).\n\
\n\
Do you wish to delete the FIPS-140-1 module, anyway?

!*strings.23997:Search

!*strings.23998:Search Directory for Certificates

!*strings.24004:<div align=right><input type="button" name="button" value="%fetch%" onclick="parent.clicker(this,window.parent)" width=80>&nbsp;&nbsp;<input type="button" name="button" value="%cancel%" onclick="parent.clicker(this,window.parent)" width=80>%0%

!*strings.24005:Communicator will search network Directories for the Security Certificates that are used to send other people encrypted mail messages.<p>Enter the exact E-mail %-cont-%

!*strings.24006:addresses of the people you are looking for and press Search. <table border=0 cellspacing=0 cellpadding=5><tr><td><b>Directory:</b></td><td><select name=dirmenu>%0%%-cont-%

!*strings.24007:</select></td></tr>%-cont-%

!*strings.24008:<tr><td><b>E-mail Addresses:</b></td><td><input type=text name=searchfor size=50></td></tr></table>

!*strings.24014:All Directories

!*strings.24015:Search Results

!*strings.24016:Press the <b>%ok%</b> button to save the Certificates that were found, or <b>%cancel%</b> to discard them.<p>Certificates for the following E-Mail users were found in the directory:<br> %0%<p>%1%%2%

!*strings.24017:Certificates for the following E-Mail users were not found in the directory:<br>

!*strings.24018:Send Your E-Mail Certificate To A Directory

!*strings.24019:Select the Directory to send your Certificate to:<p><select name=dirmenu>%0%</select><br>%-cont-%

!*strings.24020:Communicator will send your Security Certificate to a network Directory so that other user's can easily find it to send you encrypted messages.

!*strings.24021:%0%%1%%2%%3%%4%

!*strings.24022:Communicator will search a Directory for the Security Certificates that are needed to send this encrypted message. %-cont-%

!*strings.24023:<input type=hidden name=searchfor value="%0%"><table border=0 cellspacing=0 cellpadding=5><tr><td><b>Select a Directory:</b></td><td><select name=dirmenu>%1%%-cont-%

!*strings.24024:</select></td></tr><tr><td valign=top><b>Searching For:</b></td><td>%2%</td></tr></table>

!*strings.24075:Sending to Directory

!*strings.24076:Searching Directory

!*strings.24077:Enter Password for Directory

!*strings.24078:An error occurred when communicating with the Directory

!*strings.24079:%sec-banner-begin%%0%%sec-banner-end%Communicator is about to generate a Private Key for you.  It will be used along with the Certificate you are now %-cont-%

!*strings.24080:now requesting to identify you to WebSites and via Email.  You Private Key never leaves your computer, and if you choose, will be protected by a Communicator password.<P>%-cont-%

!*strings.24081:Passwords are particularly important if you are in an environment where other people have access to your computer, either physically or over a network.  %-cont-%

!*strings.24082:Do not give others your password, because that would allow them to use your Certificate to impersonate you.<P>%-cont-%

!*strings.24083:Communicator uses a complex mathematical operation to generate your private key.  It may take up to severeal minutes to complete.  If you interrupt %-cont-%

!*strings.24084:Communicator during this process, it will not create your key, and you will have to reapply for your Certificate.

!*strings.24090:%sec-banner-begin%%0%%sec-banner-end%Passwords are particularly important if you are in an environment where other %-cont-%

!*strings.24091:people have access to your computer, either physically or over a network.  Do not give others your password, because that would allow them to use your %-cont-%

!*strings.24092:Certificate to impersonate you.<P>The safest passwords are at least 8 characters long, include both letters, and number or symbols, and contain no words found in a dictionary.

!*strings.24098:Select a Card or Database

!*strings.24099:Select the card or database you wish to import certificates to: <BR> <SELECT NAME="tokenName" SIZE=10>%0%</SELECT>

!*strings.24100:Not a valid FORTEZZA Certificate Authority

!*strings.24101:Certificate does not have a Recognized Public Key

!*strings.24102:Save this file encrypted [ok] or unencrypted [cancel]

!*strings.24103:Successive login failures may disable this card or database. Password is invalid. Retry?\n\
    %s\n

!*strings.24104:No Compromised Key List for the certificate has been found.\n\
You must load the Compromised Key List before continuing.

!*strings.24105:The Compromised Key List for the certificate has expired.\n\
Reload a new Compromised Key List.

!*strings.24106:The Compromised Key List for the certificate has an invalid signature.\n\
Reload a new Compromised Key List.

!*strings.24107:The key for the certificate has been revoked.

!*strings.24108:The Compromised Key List has an invalid format.

!*strings.24109:Netscape is unable to communicate securely with this site\n\
because the domain to which you are attempting to connect\n\
does not match the domain name in the server's certificate.

!*strings.24160:Digital Signature

!*strings.24161:The site '%0%' has requested that you sign the following message:<br><pre><dl><dd><tt>%1%</dl></tt></pre><br><b>If you agree to sign this message press %ok%, otherwise press %cancel%.</b>

!*strings.24200:The site '%0%' has requested that you sign the following message:<br><pre><dl><dd><tt>%1%</dl></tt></pre><br>Please select a certificate %-cont-%

!*strings.24201:to use for signing:<br><SELECT NAME=certname>%2%</SELECT><br><b>If you agree to sign this message press %ok%, otherwise press %cancel%.</b>

!*strings.24202:View/Edit A Personal Certificate

!*strings.24203:%0%<hr><div><b>This email user's certificate does not have a trusted issuer.</b> <br>You may decide to directly trust this certificate to permit the %-cont-%

!*strings.24204:exchange of signed and encrypted e-mail with this user. <p>%-cont-%

!*strings.24205:To be safe, before deciding to trust this certificate, you should contact the e-mail user and verify that the certificate fingerprint %-cont-%

!*strings.24206: listed above is the same as the one he or she has.<p><input type=radio name=dirtrust value=no %1%>Do not trust this certificate.<br> %-cont-%

!*strings.24207:<input type=radio name=dirtrust value=yes %2%>Trust this certificate even though it does not have a trusted issuer.</div>

!*strings.24213:<font face="Impress BT, Verdana, Arial, Helvetica, sans-serif" point-size=16>

!*strings.24214:<STYLE TYPE="text/css"> DIV { FONT-FAMILY: "Prima Sans BT", Verdana, Arial, Helvetica, Lucida; FONT-SIZE: 10pt;} TD { FONT-FAMILY: "PrimaSans BT", Verdana, Arial, Helvetica, Lucida; %-cont-%

!*strings.24215:FONT-SIZE: 10pt;} BODY { FONT-FAMILY: "Prima Sans BT", Verdana, Arial, Helvetica, Lucida; FONT-SIZE: 10 pt;} %-cont-%

!*strings.24216:H1, H2, H3 { font-weight: 700;} H1 { FONT-SIZE: 16PT; } H2 {FONT-SIZE: 14PT;} </STYLE>

!*strings.24500:

!*strings.24501:View

!*strings.24502:Edit

!*strings.24503:Verify

!*strings.24504:Delete

!*strings.24505:Export

!*strings.24506:Delete Expired

!*strings.24507:Remove

!*strings.24508:Get a Certificate...

!*strings.24509:Get Certificates...

!*strings.24510:Import a Certificate...

!*strings.24511:View Certificate

!*strings.24512:Edit Privileges

!*strings.24513:View/Edit

!*strings.24514:Add

!*strings.24515:Logout All

!*strings.24516:OK

!*strings.24517:Cancel

!*strings.24518:Help

!*strings.24519:Search Directory

!*strings.24520:Send Certificate To Directory

!*strings.24521:Open Page Info

!*strings.24522:Security Info

!*strings.24523:Passwords

!*strings.24524:Navigator

!*strings.24525:Messenger

!*strings.24526:Java/JavaScript

!*strings.24527:Certificates

!*strings.24528:Yours

!*strings.24529:People

!*strings.24530:Web Sites

!*strings.24531:Software Developers

!*strings.24532:Signers

!*strings.24533:Cryptographic Modules

!*strings.24534:Security Info

!*strings.24535:Passwords

!*strings.24536:Navigator

!*strings.24537:Messenger

!*strings.24538:Java/JavaScript

!*strings.24539:Certificates

!*strings.24540:Your Certificates

!*strings.24541:Other People's Certificates

!*strings.24542:Web Sites' Certificates

!*strings.24543:Software Developers' Certificates

!*strings.24544:Certificate Signers' Certificates

!*strings.24545:Cryptographic Modules

!*strings.24546:Entering an encrypted site

!*strings.24547:Leaving an encrypted site

!*strings.24548:Viewing a page with an encrypted/unencrypted mix

!*strings.24549:Sending unencrypted information to a Site

!*strings.24550:<B>Certificate to identify you to a web site:</B>

!*strings.24551:Ask Every Time

!*strings.24552:Select Automatically

!*strings.24553:<B>Advanced Security (SSL) Configuration:</B>

!*strings.24554:Enable SSL (Secure Sockets Layer) v2

!*strings.24555:Configure SSL v2

!*strings.24556:Enable SSL (Secure Sockets Layer) v3

!*strings.24557:Configure SSL v3

!*strings.24558:<B>Certificate for your Signed and Encrypted Messages:</B>

!*strings.24559:<B>(You have no email certificates.)</B>

!*strings.24560:Select S/MIME Ciphers

!*strings.24561:Change Password

!*strings.24562:Set Password

!*strings.24563:<B>Communicator will ask for this Password:</B>

!*strings.24564:The first time your certificate is needed

!*strings.24565:Every time your certificate is needed

!*strings.24566:After

!*strings.24567:minutes of inactivity

!*strings.24568:Encrypting Message

!*strings.24569:Signing Message

!*strings.24570:Encrypted Message

!*strings.24571:Signed Message

!*strings.24572:This message <B>can be encrypted</B> when it is sent.

!*strings.24573:Sending an encrypted message is like sending your correspondence in an envelope rather than a postcard; it makes it difficult for other people to read your message.

!*strings.24574:Encrypt this message.

!*strings.24575:Sending an unencrypted message is like sending your correspondence in a postcard instead of an envelope. Other people may be able to read your message.

!*strings.24576:You must have at least one recipient entered for this message.

!*strings.24577:This message <B>cannot be encrypted</B> when it is sent because

!*strings.24578: has no Security Certificate.

!*strings.24579: has an expired Security Certificate.

!*strings.24580: has a revoked Security Certificate.

!*strings.24581: in Alias has no Security Certificate.

!*strings.24582: is a Newsgroup.

!*strings.24583: has an invalid Security Certificate.

!*strings.24584: has a Security Certificate that is marked as Untrusted.

!*strings.24585: has a Security Certificate Issuer that is marked as Untrusted.

!*strings.24586: has an unknown Security Certificate  Issuer.

!*strings.24587:: unknown certificate error.

!*strings.24588:To obtain valid Security Certificates from a Directory, press <I>Get Certificates.</I> Otherwise the recipients must first obtain a Certificate for themselves and then 

!*strings.24589:send it to you in a signed email message. This new Security Certificate will automatically be remembered once it is received. <P>Newsgroups cannot receive encrypted messages.

!*strings.24590:This message <B>can be signed</B> when it is sent.

!*strings.24591:This message <B>cannot be signed</B> when it is sent.

!*strings.24592:This is because you do not have a valid Security Certificate. When you include your Security Certificate in a message, you 

!*strings.24593:also digitally sign that message. This makes it possible to verify that the message actually came from you.

!*strings.24594:When you digitally sign a message, you also include your Security Certificate in that message. This makes it possible to verify that the message actually came from you.

!*strings.24595:In some places this digital signature may be considered as legally binding as your own written signature.

!*strings.24596:Include my Security Certificate in this message and use a digital signature to sign this message 

!*strings.24597:This message <B>was encrypted</B> when it was sent. <P>This means that it was hard for other people to eavesdrop on your message while it was being sent.

!*strings.24598:This message <B>was not encrypted</B> when it was sent. <P>This means that it was possible for other people to view your message while it was being sent.

!*strings.24599:You cannot read this message because you do not have the Security Certificate necessary to decrypt it. This could be because your 

!*strings.24600:Security Certificate is on a different computer or it could be because the message was encrypted with someone else's Security Certificate.

!*strings.24601:The algorithm used was 

!*strings.24602:This message <B>was digitally signed</B> by 

!*strings.24603:This message included the Security Certificate for 

!*strings.24604: on 

!*strings.24605:, and was signed on 

!*strings.24606:To check the Certificate, press the ``View/Edit'' button. <P>This Certificate has automatically been added to your list of 

!*strings.24607:People's Certificates to make it possible for you to send secure mail to this person.

!*strings.24608:This message <B>was not digitally signed</B>. <P>It is impossible to verify that this message actually came from the sender.

!*strings.24609:<B>The Certificate that was used to digitally sign this message is invalid</B>. <P>It is impossible to prove that this message actually came from the sender.

!*strings.24610:<B>This message cannot be decrypted.</B> 

!*strings.24611:The error was: 

!*strings.24612:Warning! In the time since the sender sent you this message and you received it, the message appears to have been altered. Some 

!*strings.24613:or all of the content of this message has been changed. You should contact the message sender and/or your system administrator.

!*strings.24614:This message appears to have been sent from the email address <TT><B>

!*strings.24615:</B></TT>, but the certificate which was used to sign this message belongs to the email address <TT><B>

!*strings.24616:</B></TT>. If these two email addresses don't belong to the same  person, this could be an attempt at forgery.

!*strings.24617:Usenet News Security

!*strings.24618:The connection to this news server <B>is encrypted</B>. This means that the messages you read are encrypted as they 

!*strings.24619:are sent to you. This makes it difficult for other people to read the messages while you are reading them. 

!*strings.24620:The connection to this news server <B>is not encrypted</B>. <P>This means that other people may be able to read these messages while you are reading them.

!*strings.24621:Encryption

!*strings.24622:Verification

!*strings.24623:This page <B>was not encrypted</B>. This means it was possible for other people to view this page when it was loaded. It 

!*strings.24624:also means that you cannot check the identity of the web site. For complete details on all the files on this page, click <B>Open Page info</B>.

!*strings.24625:This page <B>was encrypted</B>. This means it was difficult for other people to view this page when it was loaded.<P>

!*strings.24626:You can examine your copy of the certificate for this page and check the identity of the web site. To see the certificate 

!*strings.24627:for this web site, click <B>View Certificate</B>. For complete details on all the files on this page and their certificates, click <B>Open Page Info</B>.

!*strings.24628:This page <B>was not encrypted</B>, but some of the files it contains were encrypted. This means it was difficult for 

!*strings.24629:other people to view the encrypted files when the page was loaded. It also means that you cannot check the 

!*strings.24630:identity of the web site for the page.<P>For complete details on all the files on this page, click <B>Open Page Info</B>.

!*strings.24631:This page <B>was encrypted</B>. This means it was difficult for other people to view this page when it was loaded. You can 

!*strings.24632:examine your copy of the certificate for this page and the identity of the web site. To see the certificate for 

!*strings.24633:this web site, click <B>View Certificate</B>.<P>However, some of the files on this page <B>were not 

!*strings.24634:encrypted</B>. This means that it was possible for other people to view those files when they were loaded. For complete 

!*strings.24635:details on all the files on this page and their certificates, click <B>Open Page Info</B>.

!*strings.24636:Take a look at the page's Certificate.

!*strings.24637:Make sure that this is the site you think it is. This page comes from the site: 

!*strings.24638:The following elements are missing from this window: 

!*strings.24639:. This means that you may be missing important information.

!*strings.24640:the menubar

!*strings.24641:the toolbar

!*strings.24642:the personal toolbar

!*strings.24643:the location bar

!*strings.24644:the status bar

!*strings.24645:This window was created by a Java Application (from 

!*strings.24646:). This application has some control over this window and may influence what you see.

!*strings.24647:This window was created by a JavaScript Application (from 

!*strings.24648:). This application has some control over this window and may influence what you see.

!*strings.24649:<B><H2>There is no Security Info for this window.</H2></B>

!*strings.24650:Security Info is available for Browser, Messenger Message, and News Article windows. 

!*strings.24651:<P>If you wish to change Security settings or preferences, use the tabs on the left to switch between different areas.

!*strings.24652:This is an explanation of Security Certificates.<P> <B>Certificate:</B> A file that identifies a person or organization. Communicator uses certificates to 

!*strings.24653:encrypt information. You can use a certificate to check the identity of the certificate's owner. You should trust a certificate only if you trust the person or organization that issued it. 

!*strings.24654:<P>Your own certificates allow you to receive encrypted information. Communicator also keeps track of certificates from other people, web sites, applets, and scripts. 

!*strings.24655:<P><UL><B>Yours</B> lists your own certificates. <P><B>People</B> lists certificates from other people or organizations. 

!*strings.24656:<P><B>Web Sites</B> lists certificates from web sites. <P><B>Signers</B> lists certificates from certificate signers (``Certificate Authorities''.) 

!*strings.24657:<P><B>Software Developers</B> lists certificates that accompany signed Java applets and JavaScript scripts.</UL>

!*strings.24658:You can use any of these certificates to identify yourself to other people and to web sites. Communicator uses your certificates 

!*strings.24659:to decrypt information sent to you. Your certificates are signed by the organization that issued them. <P><B>These are your certificates:</B>

!*strings.24660:You should make a copy of your certificates and keep them in a safe place. If you ever lose your certificates, you will be unable 

!*strings.24661:to read encrypted mail you have received, and you may have problems identifying yourself to web sites.

!*strings.24662:Other people have used these certificates to identify themselves to you. Communicator can send encrypted 

!*strings.24663:messages to anyone for whom you have a certificate. <P><B>These are certificates from other people:</B>

!*strings.24664:To get certificates from a network Directory press <I>Search Directory</I>.<p>

!*strings.24665:<B>These are certificates that you have accepted from web sites:</B>

!*strings.24666:<B>These certificates identify the certificate signers that you accept:</B>

!*strings.24667:<B>These settings allow you to control Navigator security settings.</B> <P>Navigator security warnings can let you know before you do something that might be unsafe. <P><B>Show a warning before:

!*strings.24668:<B>These settings allow you to control Messenger security settings.</B> <P>Messenger Security warnings can let you know before you do something that might be unsafe.

!*strings.24669:<B>Sending Signed/Encrypted Mail:</B>

!*strings.24670:Encrypt mail messages, when it is possible

!*strings.24671:Sign mail messages, when it is possible

!*strings.24672:Sign news messages, when it is possible

!*strings.24673:This certificate is included with every email message you <B>sign</B>. When other people receive it, it makes it possible for them to send you encrypted mail.

!*strings.24674:Other people could also obtain your certificate from a Directory:

!*strings.24675:If you had one, this certificate would be included with every email message you <B>signed</B>. When other people received it, 

!*strings.24676:it would make it possible for them to send you encrypted mail. (To get a certificate, see the ``Yours'' tab on the left.)

!*strings.24677:<B>Advanced S/MIME Configuration:</B>

!*strings.24678:Cipher Preferences: 

!*strings.24679:<B>These settings allow you to control access by Java applets and JavaScript scripts.</B> <P>No applet or script is allowed to access your computer or network without 

!*strings.24680:your permission. You have explicitly granted or forbidden access for all applets and scripts from the following vendors, distributors, or web sites.

!*strings.24681:<B>Your Communicator password will be used to protect your certificates.</B> <P>If you are in an environment where other 

!*strings.24682:people have access to your computer (either physically or over the network) you should have a Communicator password. <P>

!*strings.24683:<B>Cryptographic Modules:</B>

!*strings.24684:View/Edit CRL's

!*strings.24685:To view or edit Certificate Revocation Lists press <I>View/Edit CRL's</I>.<p>

!*strings.24686:To check the Certificate or edit Certificate Trust Information, press the ``View/Edit'' button. <P>This Certificate has automatically been added to your list of 

!*strings.24687:<B>Certificate to use for Proxy Authentication:</B>

!*strings.24688:No Proxy Authentication

!*strings.24689:

!*strings.25000:

!*strings.25001:sa_view_button_label

!*strings.25002:sa_edit_button_label

!*strings.25003:sa_verify_button_label

!*strings.25004:sa_delete_button_label

!*strings.25005:sa_export_button_label

!*strings.25006:sa_expired_button_label

!*strings.25007:sa_remove_button_label

!*strings.25008:sa_get_cert_button_label

!*strings.25009:sa_get_certs_button_label

!*strings.25010:sa_import_button_label

!*strings.25011:sa_view_cert_button_label

!*strings.25012:sa_edit_privs_button_label

!*strings.25013:sa_view_edit_button_label

!*strings.25014:sa_add_button_label

!*strings.25015:sa_logout_all_button_label

!*strings.25016:sa_ok_button_label

!*strings.25017:sa_cancel_button_label

!*strings.25018:sa_help_button_label

!*strings.25019:sa_search_dir_button_label

!*strings.25020:sa_send_cert_button_label

!*strings.25021:sa_page_info_label

!*strings.25022:sa_secinfo_index_label

!*strings.25023:sa_passwords_index_label

!*strings.25024:sa_navigator_index_label

!*strings.25025:sa_messenger_index_label

!*strings.25026:sa_applets_index_label

!*strings.25027:sa_certs_intro_index_label

!*strings.25028:sa_yours_index_label

!*strings.25029:sa_people_index_label

!*strings.25030:sa_sites_index_label

!*strings.25031:sa_developers_index_label

!*strings.25032:sa_signers_index_label

!*strings.25033:sa_modules_index_label

!*strings.25034:sa_secinfo_title_label

!*strings.25035:sa_passwords_title_label

!*strings.25036:sa_navigator_title_label

!*strings.25037:sa_messenger_title_label

!*strings.25038:sa_applets_title_label

!*strings.25039:sa_certs_intro_title_label

!*strings.25040:sa_yours_title_label

!*strings.25041:sa_people_title_label

!*strings.25042:sa_sites_title_label

!*strings.25043:sa_developers_title_label

!*strings.25044:sa_signers_title_label

!*strings.25045:sa_modules_title_label

!*strings.25046:sa_enter_secure_label

!*strings.25047:sa_leave_secure_label

!*strings.25048:sa_mixed_secure_label

!*strings.25049:sa_send_clear_label

!*strings.25050:sa_ssl_cert_label

!*strings.25051:sa_ask_sa_every_time_label

!*strings.25052:sa_select_auto_label

!*strings.25053:sa_ssl_config_label

!*strings.25054:sa_ssl2_enable_label

!*strings.25055:sa_ssl2_config_label

!*strings.25056:sa_ssl3_enable_label

!*strings.25057:sa_ssl3_config_label

!*strings.25058:sa_smime_cert_label

!*strings.25059:sa_smime_no_certs_blurb

!*strings.25060:sa_smime_config_label

!*strings.25061:sa_change_password_label

!*strings.25062:sa_set_password_label

!*strings.25063:sa_ask_for_password_label

!*strings.25064:sa_once_per_session_label

!*strings.25065:sa_every_time_label

!*strings.25066:sa_after_label

!*strings.25067:sa_minutes_label

!*strings.25068:sa_compose_encrypt_subtitle

!*strings.25069:sa_compose_sign_subtitle

!*strings.25070:sa_message_encrypt_subtitle

!*strings.25071:sa_message_sign_subtitle

!*strings.25072:sa_can_encrypt

!*strings.25073:sa_send_encrypt_desc

!*strings.25074:sa_encrypt_this_checkbox_label

!*strings.25075:sa_send_clear_warn_desc

!*strings.25076:sa_no_recipients_desc

!*strings.25077:sa_cannot_encrypt_head

!*strings.25078:sa_cert_missing_tail

!*strings.25079:sa_cert_has_exp_tail

!*strings.25080:sa_cert_has_revoke_tail

!*strings.25081:sa_cert_no_alias_tail

!*strings.25082:sa_cert_newsgroup_tail

!*strings.25083:sa_cert_invalid_tail

!*strings.25084:sa_cert_untrusted_tail

!*strings.25085:sa_cert_issuer_untrusted_tail

!*strings.25086:sa_cert_issuer_unknown_tail

!*strings.25087:sa_cert_unknown_error_tail

!*strings.25088:sa_how_to_get_their_cert_1

!*strings.25089:sa_how_to_get_their_cert_2

!*strings.25090:sa_can_be_signed

!*strings.25091:sa_cannot_be_signed

!*strings.25092:sa_cannot_sign_desc_1

!*strings.25093:sa_cannot_sign_desc_2

!*strings.25094:sa_can_sign_desc

!*strings.25095:sa_sign_disclaimer

!*strings.25096:sa_sign_this_checkbox_label

!*strings.25097:sa_was_encrypted

!*strings.25098:sa_was_not_encrypted

!*strings.25099:sa_was_encrypted_for_other_1

!*strings.25100:sa_was_encrypted_for_other_2

!*strings.25101:sa_encryption_algorithm_was

!*strings.25102:sa_was_signed_head

!*strings.25103:sa_included_cert_desc_head

!*strings.25104:sa_was_signed_at

!*strings.25105:sa_included_cert_desc_signed_at

!*strings.25106:sa_was_signed_desc_tail_1

!*strings.25107:sa_was_signed_desc_tail_2

!*strings.25108:sa_was_not_signed

!*strings.25109:sa_sig_invalid

!*strings.25110:sa_encryption_invalid

!*strings.25111:sa_sign_error_intro

!*strings.25112:sa_sig_tampered_1

!*strings.25113:sa_sig_tampered_2

!*strings.25114:sa_addr_mismatch_part1

!*strings.25115:sa_addr_mismatch_part2

!*strings.25116:sa_addr_mismatch_part3

!*strings.25117:sa_news_encrypt_subtitle

!*strings.25118:sa_news_encrypted_1

!*strings.25119:sa_news_encrypted_2

!*strings.25120:sa_news_not_encrypted

!*strings.25121:sa_nav_encryption_subtitle

!*strings.25122:sa_nav_verification_subtitle

!*strings.25123:sa_nav_no_encrypt_desc_1

!*strings.25124:sa_nav_no_encrypt_desc_2

!*strings.25125:sa_nav_encrypt_desc_1

!*strings.25126:sa_nav_encrypt_desc_2

!*strings.25127:sa_nav_encrypt_desc_3

!*strings.25128:sa_nav_no_encrypt_mix_desc_1

!*strings.25129:sa_nav_no_encrypt_mix_desc_2

!*strings.25130:sa_nav_no_encrypt_mix_desc_3

!*strings.25131:sa_nav_encrypt_mix_desc_1

!*strings.25132:sa_nav_encrypt_mix_desc_2

!*strings.25133:sa_nav_encrypt_mix_desc_3

!*strings.25134:sa_nav_encrypt_mix_desc_4

!*strings.25135:sa_nav_encrypt_mix_desc_5

!*strings.25136:sa_nav_verify_cert_desc

!*strings.25137:sa_nav_verify_domain_desc

!*strings.25138:sa_nav_verify_missing_desc_1

!*strings.25139:sa_nav_verify_missing_desc_2

!*strings.25140:sa_nav_info_menubar_name

!*strings.25141:sa_nav_info_toolbar_name

!*strings.25142:sa_nav_info_personalbar_name

!*strings.25143:sa_nav_info_location_name

!*strings.25144:sa_nav_info_status_name

!*strings.25145:sa_nav_verify_java_desc_1

!*strings.25146:sa_nav_verify_java_desc_2

!*strings.25147:sa_nav_verify_js_desc_1

!*strings.25148:sa_nav_verify_js_desc_2

!*strings.25149:sa_not_me_subtitle

!*strings.25150:sa_not_me_desc_1

!*strings.25151:sa_not_me_desc_2

!*strings.25152:sa_certs_intro_string_1

!*strings.25153:sa_certs_intro_string_2

!*strings.25154:sa_certs_intro_string_3

!*strings.25155:sa_certs_intro_string_4

!*strings.25156:sa_certs_intro_string_5

!*strings.25157:sa_certs_intro_string_6

!*strings.25158:sa_your_certs_desc_1

!*strings.25159:sa_your_certs_desc_2

!*strings.25160:sa_your_certs_desc_tail_1

!*strings.25161:sa_your_certs_desc_tail_2

!*strings.25162:sa_people_certs_desc_1

!*strings.25163:sa_people_certs_desc_2

!*strings.25164:sa_get_certs_desc

!*strings.25165:sa_site_certs_desc

!*strings.25166:sa_signers_certs_desc

!*strings.25167:sa_ssl_desc

!*strings.25168:sa_smime_desc

!*strings.25169:sa_smime_pref_desc

!*strings.25170:sa_encrypt_always_checkbox_label

!*strings.25171:sa_sign_mail_always_checkbox_label

!*strings.25172:sa_sign_news_always_checkbox_label

!*strings.25173:sa_smime_cert_desc

!*strings.25174:sa_smime_send_cert_desc

!*strings.25175:sa_smime_no_cert_desc_1

!*strings.25176:sa_smime_no_cert_desc_2

!*strings.25177:sa_smime_cipher_heading

!*strings.25178:sa_smime_cipher_desc

!*strings.25179:sa_applets_desc_1

!*strings.25180:sa_applets_desc_2

!*strings.25181:sa_password_desc_1

!*strings.25182:sa_password_desc_2

!*strings.25183:sa_modules_desc

!*strings.25184:sa_view_crl_button_label

!*strings.25185:sa_signers_view_crl_desc

!*strings.25186:sa_was_signed_alt_desc_tail_1

!*strings.25187:sa_proxy_cert_label

!*strings.25188:sa_no_proxy_auth_label

!*strings.25189:

!*strings.25500:FORTEZZA SKIPJACK encryption with an 80-bit key

!*strings.25511:<b>Security Module Name:</b> %0%<input type="%1%" name="name" value=%2%><br><b>Security Module File:</b> %3%<input type="%4%"name="library" value=%5%><br>%-cont-%

!*strings.25512:<b>Manufacturer:</b> %6%<br><b>Description:</b>%8%<br><b>PKCS #11 Version:</b> %7%<br><b>Library Version: </b> %9%<br><center><table><tr>%-cont-%

!*strings.25513:<td width=10></td><td align=top><select name=slots size=10 onChange="setpass(this)">%10%</select></td><td valign=top><table border=0 cellspacing=0 cellpadding=0><td width=10></td>%-cont-%

!*strings.25514:<td height=30 valign=top align=center> <input type="submit" name="button" value="%moreinfo%"width=174></input></td></tr>%-cont-%

!*strings.25515:<tr><td width=10></td><td height=30 valign=middle align=center><input type="submit" name="button" value="%config%"width=174></input></td></tr>%-cont-%

!*strings.25516:<tr><td width=10></td><td height=30 valign=middle align=center> <input type="submit" name="button" value="%login%"width=174></input></td></tr>%-cont-%

!*strings.25517:<tr><td width=10></td><td height=30 valign=middle align=center> <input type="submit" name="button" value="%logout%"width=174></input></td></tr>%-cont-%

!*strings.25518:<tr><td width=10></td><td height=30 valign=middle align=center> <input type="submit" name="button" value="Change Password"width=174></input></td></tr></table>%-cont-%

!*strings.25519:</td></tr></table></center><script>var login_status = %11%function setpass(select){%-cont-%

!*strings.25520:for(var i=0;i<select.options.length;i++) {   if (select.options[i].selected) {    document.forms[0].elements[9].value = login_status[i];    return;   } }%-cont-%

!*strings.25521:  document.forms[0].elements[9].value = "No Token Selected"; }\n\
function initarray() {  var numargs = initarray.arguments.length;  var a; a = new Array(numargs); %-cont-%

!*strings.25522:  for ( var i = 0; i < numargs; i++ ) {    a[i] = initarray.arguments[i];  } return a; }</script>

!*strings.25531: Config

!*strings.25542: <P><B>Module Name:</B> %0% <BR><B>Slot Description:</B> %1% <BR><B>Token Name: </B> %2% <BR><B>Remarks: </B>%3%<P><HR> %-cont-%

!*strings.25543: <P> <DT><INPUT TYPE=Radio %4% NAME="enabledisable" VALUE="disable"> <B> Disable this token. </B> %-cont-%

!*strings.25544: <FORM><P> <DL> <DT><INPUT TYPE=Radio %5% NAME="enabledisable" VALUE="enable"> <B>Enable this token and turn on the following functions: </B> %6% </FORM>

!*strings.25555: <P><B>Module Name:</B> %0% <BR><B>Slot Description:</B> %1% <BR><B>Token Name: </B> %2% <P><HR> %-cont-%

!*strings.25556: <FORM> <P> <FONT COLOR="FF0000" SIZE=+1> %3%<BR>%4%<BR>%5% </FONT></FORM>

!*strings.25557: Configure Slot

!*strings.25568:Module Name: 

!*strings.25569:File: 

!*strings.25570:RSA PKCS encryption

!*strings.25571:External security module successfully deleted

!*strings.25572:Internal security module successfully deleted

!*strings.25573:A new security module has been installed

!*strings.25574:Are you sure you want to install this security module?

!*strings.25575:Are you sure you want to delete this security module?

!*strings.25576:Enter a nickname for the certificate:

!*strings.25587:View/Edit CRL's

!*strings.25588:<h3 align=center>%0%</h3><b>URL:</b>%1%<br><b>Last Update:</b>%2%<br><b>Next Update:</b>%3% %4%<br><b>Signed by:</b><ul>%5%</ul><br><center><select name=bogus size=8>%6%</select></center>

!*strings.25589:Enter the URL of the new CRL/CKL to load:

!*strings.25590:<h3 align=center>%0%</h3>Enter the URL of the Certificate Revocation List.<br><br><b>URL:</b><input name=url size=70 type=text value="%1%">

!*strings.25591:No CRL was selected. Please select a CRL from the list.

!*strings.25592:Selected CRL does not have a valid URL to load from.\n\
Use 'New/Edit...' to set the URL.

!*strings.25593:<font color=red>Expired</font>

!*strings.25594:You did not enter a URL: No new CRL loaded.

!*strings.25595:Edit CRL

!*strings.25596:CRL

!*strings.25597:<font color=red>Not Yet Valid</font>

!*strings.-5288:Netscape is unable to communicate securely with this site\n\
because the server does not support high-grade encryption.

!*strings.-5287:Netscape is unable to communicate securely with this site\n\
because the server requires the use of high-grade encryption.\n\
\n\
This version of Netscape does not support high-grade\n\
encryption, probably due to U.S. export restrictions.

!*strings.-5286:Netscape and this server cannot communicate securely\n\
because they have no common encryption algorithm(s).

!*strings.-5285:Netscape is unable to find the certificate or key necessary\n\
for authentication.

!*strings.-5284:Netscape is unable to communicate securely with this site\n\
because the server's certificate was rejected.

!*strings.-5282:The server has encountered bad data from the client.

!*strings.-5281:Netscape has encountered bad data from the server.

!*strings.-5280:Netscape has encountered an unsupported type of certificate.\n\
\n\
A newer version of Netscape may solve this problem.

!*strings.-5279:The server is using an unsupported version of the security\n\
protocol.\n\
\n\
A newer version of Netscape may solve this problem.

!*strings.-5277:Client authentication failed due to mismatch between private\n\
key found in client key database and public key found in client\n\
certificate database.

!*strings.-5276:Netscape is unable to communicate securely with this site\n\
because the domain to which you are attempting to connect\n\
does not match the domain name in the server's certificate.

!*strings.-5274:This site only supports SSL version 2.  You can enable\n\
support for SSL version 2 by selecting Security Info from\n\
the Communicator menu and opening the Navigator section.

!*strings.-5273:SSL has received a record with an incorrect Message\n\
Authentication Code.  This could indicate a network error,\n\
a bad server implementation, or a security violation.

!*strings.-5272:SSL has received an error from the server indicating an\n\
incorrect Message Authentication Code.  This could indicate\n\
a network error, a bad server implementation, or a\n\
security violation.

!*strings.-5271:The server cannot verify your certificate.

!*strings.-5270:The server has rejected your certificate as revoked.

!*strings.-5269:The server has rejected your certificate as expired.

!*strings.-5268:You cannot connect to an encrypted website because SSL\n\
has been disabled.  You can enable SSL by selecting\n\
Security Info from the Communicator menu and opening the\n\
Navigator section.

!*strings.-5267:The server is in another FORTEZZA domain,\n\
you cannot connect to it.

!*strings.7032:Broken pipe

!*strings.7111:Connection refused

!*strings.7022:Invalid argument

!*strings.7005:I/O error

!*strings.7012:Not enough memory

!*strings.7009:Bad file number

!*strings.7011:Operation would block

!*strings.7106:Socket is already connected

!*strings.7110:Connection timed out

!*strings.7115:operation now in progress

!*strings.7114:EALREADY

!*strings.7098:Address already in use

!*strings.7004:interrupted system call

!*strings.7013:Permission denied

!*strings.7099:Can't assign requested address

!*strings.7100:Network is down

!*strings.7101:Network is unreachable

!*strings.7102:Network dropped connection because of reset

!*strings.7103:Connection aborted

!*strings.7104:Connection reset by peer

!*strings.7107:Socket is not connected

!*strings.7112:Host is down

!*strings.7113:No route to host

!*strings.21001: (unrecognized)

!*strings.21002: (autoselect)

!*strings.21003: (default)

!*strings.21004: (not found)

!*strings.21010:%s image %dx%d pixels

!*strings.21011:Images are %d bits deep with %d cells allocated.

!*strings.21012:Images are monochrome.

!*strings.21013:Images are %d bit greyscale.

!*strings.21014:Images are %d bit truecolor.

!*strings.21020:This is a searchable index. Enter search keywords: 

!*strings.21031:Main Hotlist

!*strings.21032:<!-- This is an automatically generated file.\n\
    It will be read and overwritten.\n\
    Do Not Edit! -->\n

!*strings.21033:---End of History List---\n

!*strings.21034:Save History List

!*strings.21040:Connect: Looking up host: %.256s...

!*strings.21041:Connect: Contacting host: %.256s...

!*strings.21042:Error: Could not make connection non-blocking.

!*strings.21043:Unable to locate host %.256s.

!*strings.21044:Unable to locate host %.256s.

!*strings.21045:Reading file...

!*strings.21046:Reading file...Error Zero Length

!*strings.21047:Reading directory...

!*strings.21048:Reading file...Done

!*strings.21049:Reading directory...Done

!*strings.21050:Receiving FTP file

!*strings.21051:Receiving FTP directory

!*strings.21052:Receiving data.

!*strings.21053:Transferring data from %.256s

!*strings.21054:Connect: Host %.256s contacted. Waiting for reply...

!*strings.21055:Connect: Trying again (HTTP 0.9)...

!*strings.21056:Connect: Host contacted. Waiting for reply (Gopher)

!*strings.21057:Mail sent successfully

!*strings.21058:Receiving newsgroups...

!*strings.21059:Receiving newsgroups...

!*strings.21060:Receiving articles...

!*strings.21061:Receiving articles...

!*strings.21062:Reading newsgroup list

!*strings.21063:Reading newsgroup overview information

!*strings.21064:Sorting articles...

!*strings.21065:Starting Java...

!*strings.21066:Starting Java...done

!*strings.21101:Unable to invoke external viewer

!*strings.21102:Proxy is requiring an authentication scheme that is not supported.

!*strings.21103:Out of memory error in HTTP Load routine!

!*strings.21104:Unknown status reply from server: %d!

!*strings.21105:Warning! Non-critical application error: NET_TotalNumberOfProcessingURLs < 0

!*strings.21106:Warning! Non-critical application error: NET_TotalNumberOfOpenConnections < 0

!*strings.21107:URN's not internally supported, use an HTTP proxy server: 

!*strings.21108:reentrant call to Interrupt window

!*strings.21109:Bad message number

!*strings.21110:Article number out of range

!*strings.21111:Could not load mailbox

!*strings.21113:SMTP Error sending mail. Server responded: %.256s

!*strings.21114:Warning: unrecognized character set: `

!*strings.21115:Alert! did not find a converter or decoder

!*strings.21116:Cannot add the result of a form submission to the hotlist

!*strings.21117:Warning: an HTTP proxy host was specified\n\
(%.2048s), but that host is unknown.\n\
\n\
This means that external hosts will be unreachable.\n\
Perhaps there is a problem with your name server?\n\
Consult your system administrator.

!*strings.21118:Warning: a SOCKS host was specified (%.2048s)\n\
but that host is unknown.\n\
\n\
This means that external hosts will be unreachable.\n\
\n\
Perhaps there is a problem with your name server?\n

!*strings.21119:If your site must use a non-root name server, you will\n\
need to set the $SOCKS_NS environment variable to\n\
point at the appropriate name server.  It may (or\n\
may not) be necessary to set this variable, or the\n\
SOCKS host preference, to the IP address of the host\n\
in question rather than its name.\n\
\n

!*strings.21120:Consult your system administrator.

!*strings.21121:Warning: the following hosts are unknown:\n\
\n

!*strings.21122:Warning: the host %.256s is unknown.\n

!*strings.21123:\n\
This means that some or all hosts will be unreachable.\n\
\n\
Perhaps there is a problem with your name server?\n

!*strings.21124:On SunOS 4 systems, there are two %s executables,\n\
one for sites using DNS, and one for sites using YP/NIS.\n\
This is the DNS executable.  Perhaps you need to use\n\
the other one?\n\
\n

!*strings.21125:On SunOS 4 systems, there are two %s executables,\n\
one for sites using DNS, and one for sites using YP/NIS.\n\
This is the YP/NIS executable.  Perhaps you need to use\n\
the other one?\n\
\n

!*strings.21130:Warning: this is an executable `%.1024s' script!\n\
\n\
You are about to execute arbitrary system commands\n\
on your local machine.  This is a security risk.\n\
Unless you completely understand this script, it\n\
is strongly recommended you not do this.\n\
\n\
Execute the script?

!*strings.21131:Warning: this is an executable `%.1024s' script!\n\
\n\
You may be about to execute arbitrary system commands\n\
on your local machine.  This is a security risk.\n\
Unless you completely understand this script, it\n\
is strongly recommended you not do this.\n\
\n\
Execute the script?

!*strings.21133:Authorization failed.  Retry?

!*strings.21134:Proxy authorization failed.  Retry?

!*strings.21135:Repost form data?

!*strings.21136:Before viewing all newsgroups, Netscape saves\n\
a copy of the newsgroup list.\n\
\n\
On a modem or slow connection, this may take a\n\
few minutes. You can choose New Window from the\n\
File menu to continue browsing.  Proceed?

!*strings.21137:This form is being submitted via e-mail.\n\
Submitting the form via e-mail will reveal\n\
your e-mail address to the recipient, and\n\
will send the form data without encrypting\n

!*strings.21139:it for privacy.  You may not want to submit\n\
sensitive or private information via this\n\
form.  You may continue or cancel this\n\
submission.  

!*strings.21151:message: invalid specifier `%c'\n

!*strings.21152:Implement more temp name

!*strings.21153:Implement more XPStats

!*strings.21160:Please enter a username for news server access

!*strings.21161:Enter password for user %s:

!*strings.21204:<TITLE>Error!</TITLE>\n\
<H1>Error!</H1> newsgroup server responded: <b>%.256s</b><p>\n

!*strings.21205:<b><p>Perhaps the article has expired</b><p>\n

!*strings.21218:<TITLE>FTP Error</TITLE>\n\
<H1>FTP Error</H1>\n\
<h2>Could not login to FTP server</h2>\n\
<PRE>

!*strings.21219:<TITLE>FTP Error</TITLE>\n\
<H1>FTP Error</H1>\n\
<h2>FTP Transfer failed:</h2>\n\
<PRE>

!*strings.21220:<TITLE>Gopher Index %.256s</TITLE><H1>%.256s <BR>Gopher Search</H1>\n\
This is a searchable Gopher index.\n\
Use the search function of your browser to enter search terms.\n\
<ISINDEX>

!*strings.21221:<TITLE>CSO Search of %.256s</TITLE><H1>%.256s CSO Search</H1>\n\
A CSO database usually contains a phonebook or directory.\n\
Use the search function of your browser to enter search terms.\n\
<ISINDEX>

!*strings.21222:<TITLE>Missing Post reply data</TITLE>\n\
<H1>Data Missing</H1>\n\
This document resulted from a POST operation and has expired from the\n\
cache.  If you wish you can repost the form data to recreate the\n\
document by pressing the <b>reload</b> button.\n

!*strings.21250:RSA Public Key Cryptography

!*strings.21251:International

!*strings.21252:This is an insecure document that is not encrypted and offers no security\n\
protection.

!*strings.21253:<h3>No new newsgroups</h3>

!*strings.21256:Enter username for %.200s at %.200s:

!*strings.21257:Type in a newsgroup to add to the list:

!*strings.21260:This is a secure document that uses a medium-grade encryption key suited\n\
for U.S. export

!*strings.21261:This is a secure document that uses a high-grade encryption key for U.S.\n\
domestic use only

!*strings.21270:Bookmarks have changed on disk and are being reloaded.

!*strings.21271:The address book has changed on disk and is being reloaded.

!*strings.21272:Bookmarks have changed on disk.  Discard your unsaved changes\n\
and reload?

!*strings.21273:The address book has changed on disk.  Discard your unsaved changes\n\
and reload?

!*strings.21274:Error saving bookmarks file!

!*strings.21275:Error saving address book file!

!*strings.21276:This is a searchable index. Enter search keywords: 

!*strings.21277:Reset

!*strings.21278:Submit Query

!*strings.21279:<H3>No info while document is loading</H3>\n

!*strings.21280:<LI>Encoding: 

!*strings.21281:<b>Form %d:</b><UL>

!*strings.21282:%ld hours ago

!*strings.21283:%ld days ago

!*strings.21284:There are %ld aliases to %s

!*strings.21285:There is 1 alias to %s

!*strings.21286:There are no aliases to %s

!*strings.21287:Nicknames may only have letters and numbers\n\
in them.  The nickname has not been changed.

!*strings.21288:An entry with this nickname already exists.\n\
The nickname has not been changed.

!*strings.21289:This item has %d alias(es). These aliases \n\
will be removed, as well.

!*strings.21290:Some of the items you are about to remove \n\
have one or more aliases. The aliases will \n\
be removed, as well.

!*strings.21291:<!-- This is an automatically generated file.

!*strings.21292:It will be read and overwritten.

!*strings.21293:Do Not Edit! -->

!*strings.21294:New Folder

!*strings.21295:New Bookmark

!*strings.21296:Not Found

!*strings.21297:Open bookmarks file

!*strings.21298:Import bookmarks file

!*strings.21299:Save bookmarks file

!*strings.21300:Less than one hour ago

!*strings.21301:The global history database is currently closed

!*strings.21302:Unknown

!*strings.21303:The global history database is currently empty

!*strings.21304:<BR>\n\
<TT>Date:</TT> %s<P>

!*strings.21305:\n\
<HR>\n\
<TT>Total entries:</TT> %ld<P>

!*strings.21306:Personal Bookmarks

!*strings.21307:<!-- This is an automatically generated file.\n\
It will be read and overwritten.\n\
Do Not Edit! -->\n

!*strings.21308:Loading plug-in

!*strings.21309:at %ld bytes/sec

!*strings.21310:at %.1fK/sec

!*strings.21311:at %.1fM/sec

!*strings.21312:stalled

!*strings.21313:%lu

!*strings.21314:%luK

!*strings.21315:%3.2fM

!*strings.21316:%02ld:%02ld:%02ld remaining

!*strings.21317:%02ld:%02ld remaining

!*strings.21318:%ld sec%s remaining

!*strings.21319:Version: 

!*strings.21320:Serial Number: 

!*strings.21321:Issuer: 

!*strings.21322:Subject: 

!*strings.21323:Version: %s%sSerial Number: %s%sIssuer:  %s%sSubject: %s%sNot Valid Before: %s%sNot Valid After: %s%s

!*strings.21324:Enter Your Communicator Password:

!*strings.21325:A plugin for the mime type %s\n\
was not found.

!*strings.21326:Could not load the plug-in '%s' for the MIME type '%s'.  \n\
\n\
  Make sure enough memory is available and that the plug-in is installed correctly.

!*strings.21327:Unable to start a java applet: Can't find '%s' in your\n\
CLASSPATH. Read the release notes and install '%s'\n\
properly before restarting.\n\
\n\
Current value of CLASSPATH:\n\
%s\n

!*strings.21328:Unable to start a java applet: the version number for your\n\
classes is wrong. The version number found was %d. The correct\n\
version number is %d.\n

!*strings.21329:Java reported the following error on startup:\n\
\n\
%s\n

!*strings.21330:Failed to start the Java debugger.\n

!*strings.21331:The system has been locked to prevent access to restricted sites. Please enter your password if you will be changing these settings:

!*strings.21332:The previously entered password was not correct. Please enter your password if you'll be changing these restrictions settings during this session:

!*strings.21335:Connect: Please enter password for host...

!*strings.21336:Proxy is requiring an authentication scheme that is not supported.

!*strings.21337:Proxy nonces appear to expire immediately.\n\
This is either a problem in the proxy's authentication \n\
implementation, or you have mistyped your password.\n\
Do you want to re-enter your username and password?

!*strings.21338:unidentified proxy server

!*strings.21339:Proxy authentication required for %.250s at %.250s:

!*strings.21340:Connect: Please enter password for proxy...

!*strings.21341:Bad keyword in proxy automatic configuration: %s.

!*strings.21342:Try connecting to the proxy again?

!*strings.21343:Try connecting to SOCKS again?

!*strings.21344:Try connecting to proxy / SOCKS again?

!*strings.21345:Proxy server is unavailable.\n\
\n\
Try connecting to proxy %s again?

!*strings.21346:All proxy servers are unavailable.\n\
\n\
Try connecting to %s again?

!*strings.21347:SOCKS is unavailable.  Try connecting to SOCKS %s again?

!*strings.21348:SOCKS and proxies are unavailable.  Try\n\
connecting to %s again?

!*strings.21349:All proxies are unavailable. Do you wish to temporarily\n\
override proxies by connecting directly until proxies\n\
are available again?

!*strings.21350:SOCKS is unavailable. Do you wish to temporarily\n\
override SOCKS by connecting directly until SOCKS\n\
are available again?

!*strings.21351:Both proxies and SOCKS are unavailable. Do you wish to\n\
temporarily override them by connecting directly until they\n\
are available again?

!*strings.21352:All proxies are still down.\n\
Continue with direct connections?

!*strings.21353:SOCKS is still down.\n\
\n\
Continue with direct connections?

!*strings.21354:SOCKS and proxies are still down.\n\
\n\
Continue with direct connections?

!*strings.21355:No proxy automatic configuration file was received.\n\
\n\
No proxies will be used.

!*strings.21356:The automatic configuration file is empty:\n\
\n\
    %s\n\
\n\
Use the configuration from the previous session instead?

!*strings.21357:The automatic configuration file has errors:\n\
\n\
        %s\n\
\n\
Use the configuration from the previous session instead?

!*strings.21358:The proxy automatic configuration file has errors:\n\
\n\
        %s\n\
\n\
No proxies will be used.

!*strings.21359:The automatic configuration file is not of the correct type:\n\
\n\
        %s\n\
\n\
Expected MIME type of application/x-javascript-config or application/x-ns-proxy-autoconfig.\n\
\n\
Use the configuration from the previous session instead?

!*strings.21360:The proxy automatic configuration file could not be loaded.\n\
\n\
Check the proxy automatic configuration URL in preferences.\n\
\n\
No proxies will be used.

!*strings.21361:The automatic configuration file could not be loaded.\n\
\n\
Use the configuration from the previous session instead?

!*strings.21362:The backup proxy automatic configuration file had errors.\n\
\n\
No proxies will be used.

!*strings.21363:Proxy automatic configuration load was cancelled.\n\
\n\
No proxies will be used.

!*strings.21364:Warning:\n\
\n\
Server sent an unrequested proxy automatic\n\
configuration file to Netscape:\n\
\n\
        %s\n\
\n\
Configuration file will be ignored.

!*strings.21365:Receiving proxy auto-configuration file...

!*strings.21366:Cache cleanup: removing %d files...

!*strings.21367:The database selected is valid, but cannot\n\
be validated as the correct database because\n\
it is missing a name entry.  Do you wish to\n\
use this database anyway?

!*strings.21368:The database selected is named:\n\
%.900s\n\
The database requested was named:\n\
%.900s\n\
Do you wish to use this database anyway?

!*strings.21369:The page currently loading has requested an external\n\
cache.  Using a read-only external cache can improve\n\
network file retrieval time.\n\
\n\
If you do not have the external cache requested,\n\
select "Cancel" in the file selection box.

!*strings.21370:The proxy automatic configuration file is not of the correct type:\n\
\n\
        %s\n\
\n\
Expected the MIME type of application/x-ns-proxy-autoconfig.\n\
\n\
No proxies will be used.

!*strings.21371:Reading segment...Done

!*strings.21372:<TITLE>Directory listing of %.1024s</TITLE>\n

!*strings.21373:<H1>Directory listing of %.1024s</H1>\n\
<PRE>

!*strings.21374:">Up to higher level directory</A><BR>

!*strings.21375:Could not login to FTP server

!*strings.21376:Error: Could not make connection non-blocking.

!*strings.21377:Posting file %.256s...

!*strings.21378:<TITLE>Directory of %.512s</TITLE>\n\
 <H2>Current directory is %.512s</H2>\n\
 <PRE>

!*strings.21379:%d URL's waiting for an open socket (limit %d)\n

!*strings.21380:%d URL's waiting for fewer active URL's\n

!*strings.21381:%d Connections Open\n

!*strings.21382:%d Active URL's\n

!*strings.21383:\n\
\n\
Using previously cached copy instead

!*strings.21384:Server returned no data

!*strings.21385:>\n\
<HR><H3>Transfer interrupted!</H3>\n

!*strings.21386:\n\
\n\
Transfer interrupted!\n

!*strings.21387:Mail: Reading folder %s...

!*strings.21388:Mail: Reading message...

!*strings.21389:Mail: Emptying trash...

!*strings.21390:Mail: Compacting folder %s...

!*strings.21391:Mail: Delivering queued messages...

!*strings.21392:Mail: Reading message...Done

!*strings.21393:Mail: Reading folder...Done

!*strings.21394:Mail: Emptying trash...Done

!*strings.21395:Mail: Compacting folder...Done

!*strings.21396:Mail: Delivering queued messages...Done

!*strings.21398:Connect: News server contacted. Waiting for reply...

!*strings.21399:Please enter a password for news server access

!*strings.21400:Message sent; waiting for reply...

!*strings.21401:No Answer

!*strings.21402:The POP3 mail server (%s) does not\n\
 support UIDL, which Netscape Mail needs to implement\n\
 the ``Leave on Server'' and ``Maximum Message Size''\n\
 options.\n\
\n\
 To download your mail, turn off these options in the\n\
 Mail Server panel of Preferences.

!*strings.21403:Receiving: message %lu of %lu

!*strings.21404:The POP3 mail server (%s) does not\n\
support the TOP command.\n\
\n\
Without server support for this, we cannot implement\n\
the ``Maximum Message Size'' preference.  This option\n\
has been disabled, and messages will be downloaded\n\
regardless of their size.

!*strings.21405:Could not log in to the mail server.\n\
The server responded:\n\
\n\
  %s\n\
\n\
Please enter a new password for user %.100s@%.100s:

!*strings.21406:Connect: Host contacted, sending login information...

!*strings.21407:Assembling message...

!*strings.21408:Assembling message...Done

!*strings.21409:Loading attachment...

!*strings.21410:Loading attachments...

!*strings.21411:Delivering mail...

!*strings.21412:Delivering mail...

!*strings.21413:Delivering mail...Done

!*strings.21414:Delivering news...

!*strings.21415:Delivering news...Done

!*strings.21416:Queuing for later delivery...

!*strings.21417:Writing to Sent Mail file...

!*strings.21418:Queued for later delivery.

!*strings.21419:Message Composition

!*strings.21421:Loading summary file...

!*strings.21422:loaded %ld of %ld messages

!*strings.21423:Add Folder

!*strings.21424:Add Folder...

!*strings.21425:Enter the new name for your folder:

!*strings.21426:Save Message As

!*strings.21427:Save Messages As

!*strings.21428:Get New Messages

!*strings.21429:Send Unsent Messages

!*strings.21430:New Folder...

!*strings.21431:Compact This Folder

!*strings.21432:Compact All Folders

!*strings.21433:Open News Server...

!*strings.21434:Empty Trash Folder

!*strings.21435:Print...

!*strings.21436:Undo

!*strings.21437:Redo

!*strings.21438:Delete Selected Messages

!*strings.21439:Delete Message

!*strings.21440:Delete Folder

!*strings.21441:Cancel Message

!*strings.21442:Delete Newsgroup Server

!*strings.21443:Subscribe

!*strings.21444:Unsubscribe

!*strings.21445:Select Thread

!*strings.21446:Select Flagged Messages

!*strings.21447:Select All Messages

!*strings.21448:Deselect All Messages

!*strings.21449:Flag Message

!*strings.21450:Unflag Message

!*strings.21451:Again

!*strings.21452:By Thread

!*strings.21453:By Date

!*strings.21454:By Sender

!*strings.21455:By Subject

!*strings.21456:By Order Received

!*strings.21457:Unscramble (Rot13)

!*strings.21458:Add from Newest Messages

!*strings.21459:Add from Oldest Messages

!*strings.21460:Get More Messages

!*strings.21461:Get All Messages

!*strings.21462:Address Book

!*strings.21463:View Address Book Entry

!*strings.21464:Add to Address Book

!*strings.21465:New Newsgroup Message

!*strings.21466:to Newsgroup

!*strings.21467:to Sender and Newsgroup

!*strings.21468:New Message

!*strings.21469:Reply

!*strings.21470:to Sender and All Recipients

!*strings.21471:Forward Selected Messages

!*strings.21472:Forward As Attachment

!*strings.21473:Mark Selected as Read

!*strings.21474:Mark as Read

!*strings.21475:Mark Selected as Unread

!*strings.21476:Mark as Unread

!*strings.21477:Unflag All Messages

!*strings.21478:Copy Selected Messages

!*strings.21479:Copy

!*strings.21480:Move Selected Messages

!*strings.21481:Move

!*strings.21482:Save Selected Messages As...

!*strings.21483:Save As...

!*strings.21484:Move Selected Messages To...

!*strings.21485:Move This Message To...

!*strings.21486:First Message

!*strings.21487:Message

!*strings.21488:Message

!*strings.21489:Last Message

!*strings.21490:First Unread Message

!*strings.21491:Unread Message

!*strings.21492:Unread Message

!*strings.21493:Last Unread

!*strings.21494:First Flagged Message

!*strings.21495:Flagged Message

!*strings.21496:Flagged Message

!*strings.21497:Last Flagged

!*strings.21498:Back

!*strings.21499:Forward

!*strings.21500:Mark Thread as Read

!*strings.21501:Mark All Read

!*strings.21502:Mark Selected Threads Read

!*strings.21505:Show All Messages

!*strings.21506:Show Only Unread Messages

!*strings.21507:All

!*strings.21508:Include Original Text

!*strings.21509:From

!*strings.21510:Reply To

!*strings.21511:Mail To

!*strings.21512:Mail CC

!*strings.21513:Mail BCC

!*strings.21514:File CC

!*strings.21515:Newsgroups

!*strings.21516:Followups To

!*strings.21517:Subject

!*strings.21518:Attachment

!*strings.21519:Send Formatted Text

!*strings.21520:Queue For Later Delivery

!*strings.21521:Attach As Text

!*strings.21522:Flag Messages

!*strings.21523:Unflag Messages

!*strings.21524:Ascending

!*strings.21525:<P><CENTER>\n\
<TABLE BORDER CELLSPACING=5 CELLPADDING=10 WIDTH="80%%">\n\
<TR><TD ALIGN=CENTER><FONT SIZE="+1">Truncated!</FONT><HR>\n

!*strings.21526:<B>This message exceeded the Maximum Message Size set in Preferences,\n\
so we have only downloaded the first few lines from the mail server.<P>Click <A HREF="

!*strings.21527:">here</A> to download the rest of the message.</B></TD></TR></TABLE></CENTER>\n

!*strings.21528:(no headers)

!*strings.21529:(unspecified)

!*strings.21530:Macintosh File

!*strings.21531:The directory %s does not exist.  Mail will not\n\
work without it.\n\
\n\
Create it now?

!*strings.21532:Save decoded file as:

!*strings.21533:The file %s has been changed by some other program!\n\
Overwrite it?

!*strings.21534:Open News Server

!*strings.21535:news.announce.newusers

!*strings.21536:news.newusers.questions

!*strings.21537:news.answers

!*strings.21538:Mail: Compacting folder %s...

!*strings.21539:Mail: Compacting folder %s...Done

!*strings.21540:Can't open %s. You may not have permission to write to this file.\n\
Check the permissions and try again.

!*strings.21541:Save attachment as:

!*strings.21542:%lu byte%s

!*strings.21543:

!*strings.21544:s

!*strings.21545:%s of %s (%s, %s)

!*strings.21546:%s of %s (%s)

!*strings.21547:%s of %s

!*strings.21548:%s read (%s)

!*strings.21549:%s read

!*strings.21550:Mail: Message sent; waiting for reply...

!*strings.21551:<TITLE>Information about the Netscape global history</TITLE>\n\
<h2>Global history entries</h2>\n\
<HR>

!*strings.21552:%d%%

!*strings.21553:%s image %dx%d pixels

!*strings.21554:Couldn't find image of correct URL, size, background, etc.\n\
in cache:\n\
%s\n

!*strings.21555:%d-bit pseudocolor

!*strings.21556:1-bit monochrome

!*strings.21557:%d-bit greyscale

!*strings.21558:%d-bit RGB true color.

!*strings.21559:Decoded&nbsp;size&nbsp;(bytes):

!*strings.21560:%u&nbsp;x&nbsp;%u

!*strings.21561: (scaled from %u&nbsp;x&nbsp;%u)

!*strings.21562:Image&nbsp;dimensions:

!*strings.21563:Color:

!*strings.21564:%d colors

!*strings.21565:(none)

!*strings.21566:Colormap:

!*strings.21567:yes, backdrop visible through transparency

!*strings.21568:yes, solid color background <tt>#%02x%02x%02x</tt>

!*strings.21569:no

!*strings.21570:Transparency:

!*strings.21571:Comment:

!*strings.21572:Unknown

!*strings.21573:Compressing image cache:\n\
removing %s\n

!*strings.21574:Add Newsgroup...

!*strings.21575:Find Again

!*strings.21576:Send

!*strings.21577:Send Later

!*strings.21578:Attach...

!*strings.21579:Attachments Inline

!*strings.21580:Attachments as Links

!*strings.21581:Forward Quoted

!*strings.21582:Are you sure you want to remove the news server %s\n\
and all of the newsgroups in it?

!*strings.21583:All Fields

!*strings.21584:The `Unsent Messages' folder contains a message which is not\n\
scheduled for delivery!

!*strings.21585:The `Unsent Messages' folder contains %d messages which are not\n\
scheduled for delivery!

!*strings.21586:\n\
\n\
This probably means that some program other than\n\
Netscape has added messages to this folder.\n

!*strings.21587:The `Unsent Messages' folder is special; it is only for storing\n\
messages to be sent later.

!*strings.21588:\n\
Therefore, you can't use it as your `Sent' folder.\n\
\n\
Please verify that your outgoing messages destination is correct\n\
in your Mail and News preferences.

!*strings.21589:An error occurred delivering unsent messages.\n\
\n\
%s\n\
Continue delivery of any remaining unsent messages?

!*strings.21590:Password for mail user %.100s@%.100s:

!*strings.21591:%sBookmarks for %s%s

!*strings.21592:%sPersonal Bookmarks%s

!*strings.21593:%sAddress book for %s%s

!*strings.21594:%sPersonal Address book%s

!*strings.21595:sock: %d   con_sock: %d   protocol: %d\n

!*strings.21596:URL not found in cache: 

!*strings.21597:Partial cache entry, getting rest from server:\n

!*strings.21598:Checking server to verify cache entry\n\
because force_reload is set:\n

!*strings.21599:Object has expired, reloading:\n

!*strings.21600:Checking server to verify cache entry:\n

!*strings.21601:Checking server to verify cache entry\n\
because last_modified missing:\n

!*strings.21602:Netsite:

!*strings.21603:Location:

!*strings.21604:File&nbsp;MIME&nbsp;Type:

!*strings.21605:Currently Unknown

!*strings.21606:Source:

!*strings.21607:Currently in disk cache

!*strings.21608:Currently in memory cache

!*strings.21609:Not cached

!*strings.21610:<H1>The window is now inactive</H1>

!*strings.21611:Local cache file:

!*strings.21612:none

!*strings.21613:%A, %d-%b-%y %H:%M:%S Local time

!*strings.21614:Last Modified:

!*strings.21615:%A, %d-%b-%y %H:%M:%S GMT

!*strings.21616:Content Length:

!*strings.21617:No date given

!*strings.21618:Expires:

!*strings.21619:Mac Type:

!*strings.21620:Mac Creator:

!*strings.21621:Charset:

!*strings.21622:Status unknown

!*strings.21623:Security:

!*strings.21624:Certificate:

!*strings.21625:Untitled document

!*strings.21626:</b></FONT> has the following structure:<p><ul><li>

!*strings.21627:Page Info

!*strings.21628:about:editfilenew

!*strings.21629:file:///Untitled

!*strings.21630:Brief

!*strings.21631:Normal

!*strings.21632:Deleting '%s' will delete all of the messages it contains.\n\
Are you sure you still want to delete this folder?

!*strings.21633:The proxy automatic configuration file could not be loaded.\n\
\n\
Cannot fail over to using no proxies since your autoconfig url\n\
is locked.\n\
See your local system administrator for help.

!*strings.21634:No proxy automatic configuration file was received.\n\
\n\
Cannot fail over to using no proxies since your autoconfig url\n\
is locked.\n\
See your local system administrator for help.

!*strings.21635:There was a problem receiving your proxy autoconfig\n\
information.  Since your autoconfig URL has been locally\n\
locked, we cannot failover to allowing no proxies.\n\
\n\
See your local system administrator for help.

!*strings.21636:Import Address Book File...

!*strings.21637:Export Address Book File...

!*strings.21638:this bookmark

!*strings.21639:this entry

!*strings.21640:%ld seconds

!*strings.21641:%ld minutes

!*strings.21642:%ld hours %ld minutes

!*strings.21643:Main Bookmarks

!*strings.21644:Address Book

!*strings.21645:Wrap long lines

!*strings.21646:Auto Saving %s

!*strings.21647:Cannot edit non-HTML documents!

!*strings.21648:subject

!*strings.21649:sender

!*strings.21650:body

!*strings.21651:date

!*strings.21652:priority

!*strings.21653:status

!*strings.21654:to

!*strings.21655:CC

!*strings.21656:to or CC

!*strings.21657:name

!*strings.21658:e-mail address

!*strings.21659:phone number

!*strings.21660:organization

!*strings.21661:organizational unit

!*strings.21662:city

!*strings.21663:street address

!*strings.21664:size

!*strings.21665:any text

!*strings.21666:keyword

!*strings.21667:contains

!*strings.21668:doesn't contain

!*strings.21669:is

!*strings.21670:isn't

!*strings.21671:is empty

!*strings.21672:is before

!*strings.21673:is after

!*strings.21674:is higher than

!*strings.21675:is lower than

!*strings.21676:begins with

!*strings.21677:ends with

!*strings.21678:sounds like

!*strings.21679:reserved

!*strings.21680:forward.msg

!*strings.21681:Your SMTP server does not support the return receipt function \n\
so your message will be sent without the return receipt request.

!*strings.21682:age in days

!*strings.21683:is greater than

!*strings.21684:is less than

!*strings.21685:This message cannot be sent because your user name\n\
could not be determined.\n\
\n\
Please check your NIS or YP configuration (if used) and\n\
the USER and LOGNAME environment variables.

!*strings.21686:read

!*strings.21687:replied

!*strings.21688:Rename selected folder

!*strings.21689:Draft

!*strings.21690:Move to folder

!*strings.21691:Change priority

!*strings.21692:Delete

!*strings.21693:Mark read

!*strings.21694:Ignore thread

!*strings.21695:Watch thread

!*strings.21696:forwarded

!*strings.21697:replied and forwarded

!*strings.21698:Too many entries found.  Please enter more search criteria.

!*strings.21700:Read More

!*strings.21701:Unread Thread

!*strings.21702:Next Unread Category

!*strings.21703:Unread Group

!*strings.21704:By Priority

!*strings.21705:Call

!*strings.21706:Type

!*strings.21707:By Name

!*strings.21708:By Nickname

!*strings.21709:By Email Address

!*strings.21710:By Company

!*strings.21711:By City

!*strings.21712:Descending

!*strings.21713:New Card...

!*strings.21714:New List...

!*strings.21715:Card Properties...

!*strings.21716:Searching %s...

!*strings.21717:You must enter a list name.

!*strings.21718:You must enter a first name.

!*strings.21719:Building summary file for %s...

!*strings.21720:All

!*strings.21721:Ignored Threads

!*strings.21722:Watched Threads with Unread

!*strings.21723:Threads with Unread

!*strings.21724:LDAP Directory Entry

!*strings.21725:Failed to open entry for %s due to LDAP error '%s' (0x%02X)

!*strings.21726:Failed to open a connection to '%s' due to LDAP error '%s' (0x%02X)

!*strings.21727:Failed to bind to '%s' due to LDAP error '%s' (0x%02X)

!*strings.21728:Failed to search '%s' due to LDAP error '%s' (0x%02X)

!*strings.21729:Failed to modify entry on '%s' due to LDAP error '%s' (0x%02X)

!*strings.21730:Found %d matches

!*strings.21731:Are you sure you want to unsubscribe from %s?

!*strings.21732:Received %ld of %ld headers

!*strings.21733:No new messages in newsgroup

!*strings.21734:Received %ld of %ld messages

!*strings.21735:Mail: Searching mail folders...

!*strings.21736:Ignore Thread

!*strings.21737:Ignore Threads

!*strings.21738:Watch Thread

!*strings.21739:Watch Threads

!*strings.21740:Name

!*strings.21741:Fax

!*strings.21742:First Name

!*strings.21743:City

!*strings.21744:Photograph

!*strings.21745:Email

!*strings.21746:Manager

!*strings.21747:Organization

!*strings.21748:Object Class

!*strings.21749:Department

!*strings.21750:Mailing Address

!*strings.21751:Administrative Assistant

!*strings.21752:Last Name

!*strings.21753:Street

!*strings.21754:Phone Number

!*strings.21755:Title

!*strings.21756:Car License Plate

!*strings.21757:Business Category

!*strings.21758:Notes

!*strings.21759:Department Number

!*strings.21760:Employee Type

!*strings.21761:ZIP Code

!*strings.21762: (secure)

!*strings.21763:There is no conference address for this person.  Please edit the \n\
entry and try calling them again.

!*strings.21764:The local database for %s couldn't be deleted. \n\
Perhaps you are reading the newsgroup in a message list window. \n\
Unsubscribe anyway?

!*strings.21765:Please enter a conferencing address for this person and try to call again.

!*strings.21766:Please enter an email address for this person and try to call again.

!*strings.21767:Couldn't find any conferencing software.  Install\n\
a compatible conferencing product and try again.

!*strings.21768:The conferencing software is only able to call one person.  Select a single\n\
entry for a person and try again.

!*strings.21769:An entry already exists for %s.  Would you like to replace it?

!*strings.21770:That file name contains illegal characters. Please use a different name.

!*strings.21771:%s is a virtual newsgroup. If you\n\
delete it, the server will stop putting messages in the\n\
newsgroup unless you save your search criteria again.\n\
\n

!*strings.21772:Found %ld articles to retrieve

!*strings.21773:Retrieving %1$ld of %2$ld articles\n\
  in newsgroup %3$s

!*strings.21774:Retrieving article %ld

!*strings.21775:Width = %ld

!*strings.21776:Height = %ld

!*strings.21777:(%ld%% of original %s)

!*strings.21778:(%ld%% of previous %s)

!*strings.21779:width

!*strings.21780:height

!*strings.21781: and 

!*strings.21782: pixels  

!*strings.21783:% of window  

!*strings.21784:State

!*strings.21785:Domestic

!*strings.21786:International

!*strings.21787:Postal

!*strings.21788:Parcel

!*strings.21789:Work

!*strings.21790:Home

!*strings.21791:Preferred

!*strings.21792:Voice

!*strings.21793:Fax

!*strings.21794:Message

!*strings.21795:Cellular

!*strings.21796:Pager

!*strings.21797:BBS

!*strings.21798:Modem

!*strings.21799:Car

!*strings.21800:ISDN

!*strings.21801:Video

!*strings.21802:AOL

!*strings.21803:Applelink

!*strings.21804:AT&T Mail

!*strings.21805:Compuserve

!*strings.21806:eWorld

!*strings.21807:Internet

!*strings.21808:IBM Mail

!*strings.21809:MCI Mail

!*strings.21810:Powershare

!*strings.21811:Prodigy

!*strings.21812:Telex

!*strings.21813:Additional Name

!*strings.21814:Prefix

!*strings.21815:Suffix

!*strings.21816:Time Zone

!*strings.21817:Geographic Position

!*strings.21818:Sound

!*strings.21819:Revision

!*strings.21820:Version

!*strings.21821:Public Key

!*strings.21822:Logo

!*strings.21823:Nickname

!*strings.21824:Home Phone

!*strings.21825:Birthday

!*strings.21826:X400

!*strings.21827:Address

!*strings.21828:Label

!*strings.21829:Mailer

!*strings.21830:Role

!*strings.21831:Update From

!*strings.21832:Conference Software Address

!*strings.21833:HTML Mail

!*strings.21834:Add to Personal Address Book

!*strings.21835:Variable Width

!*strings.21836:Fixed Width

!*strings.21837:Helvetica

!*strings.21838:Arial,Helvetica

!*strings.21839:Times

!*strings.21840:Times New Roman,Times

!*strings.21841:Courier

!*strings.21842:Courier New,Courier

!*strings.21843:This document has %ld characters. The Spelling Checker cannot process more than %ld characters.

!*strings.21844:You cannot paste this much text in a single operation.\n\
Try pasting the text in several smaller segments.

!*strings.21845:Delete From All Lists

!*strings.21846:Adding cards to Netscape address book: %s

!*strings.21847:Updating Mailing Lists in %s

!*strings.21848:Import

!*strings.21849:Copying cards from Netscape address book: %s

!*strings.21850:Export

!*strings.21851:Deleting entries from %s

!*strings.21852:Copying entries to %s

!*strings.21853:Moving entries to %s

!*strings.21854:Deleting '%s' will delete its mailing lists and cards.\n\
Are you sure you still want to delete this address book?

!*strings.21855:Deleting '%s' will remove this directory.\n\
Are you sure you still want to delete this directory?

!*strings.21856:An address book file in your preferences is a developmental database format.\n\
 The format has since changed and we are not supporting \n\
 binary import from this format. \n\
 We're modifying your preferences to use a new file.

!*strings.21857:Directory

!*strings.21858:by %s

!*strings.21859:You must have at least one address book.

!*strings.21860:Change this action to a copy by holding down the ctrl key

!*strings.21861:Change this action to a move by holding down the shift key

!*strings.21862:   

!*strings.21863:Delete From Address Book

!*strings.21864:You already have an address book or directory with this name. \n\
Please enter a different name.

!*strings.21865:Multiple Matches Found

!*strings.21866:No match found

!*strings.21867:All addresses match

!*strings.21868:All addresses have multiple matches

!*strings.21869:No matches found

!*strings.21870:%d multiple matches

!*strings.21871:%s has multiple matches

!*strings.21872:%s matches

!*strings.21873:%d matches found

!*strings.21874:%s doesn't match

!*strings.21875:%d do not match

!*strings.21876:Cellular Phone

!*strings.21877:Pager

!*strings.21880:You must save\n\
%s\n\
to a local file before editing.\n\
Save to a file now?

!*strings.21881:Would you like to add %s to your LDAP preferences?

!*strings.21882:Card for %s

!*strings.21883:Subject

!*strings.21884:Resent-Comments

!*strings.21885:Resent-Date

!*strings.21886:Resent-Sender

!*strings.21887:Resent-From

!*strings.21888:Resent-To

!*strings.21889:Resent-CC

!*strings.21890:Date

!*strings.21891:Sender

!*strings.21892:From

!*strings.21893:Reply-To

!*strings.21894:Organization

!*strings.21895:To

!*strings.21896:CC

!*strings.21897:Newsgroups

!*strings.21898:Followup-To

!*strings.21899:References

!*strings.21900:Name

!*strings.21901:Type

!*strings.21902:Encoding

!*strings.21903:Description

!*strings.21904:Failed to initialize news servers. Perhaps your Newsgroup Directory preference is invalid.\n\
 You will be able to post to newsgroups, but not read them

!*strings.21905:Sender

!*strings.21906:All

!*strings.21907:Messages on %s

!*strings.21908:Can't move a folder into a folder it contains

!*strings.21909:%ld new newsgroups have been created on the %s news server.  To view the list\n\
of new newsgroups, select "Join Newsgroup" and then click on\n\
the "New Newsgroups" tab.

!*strings.21910:Searching newsgroup names...

!*strings.21911:Send Encrypted

!*strings.21912:Send Cryptographically Signed

!*strings.21913:Security

!*strings.21925:Link to Document

!*strings.21926:<B>Document Info:</B>

!*strings.21927:In message %s %s wrote:<P>

!*strings.21928:%s wrote:<P>

!*strings.21929:unspecified type

!*strings.21930:This is a cryptographically signed message in MIME format.

!*strings.21931:Marked %ld messages read

!*strings.21932:Marked %ld messages read...Done

!*strings.21933:Message-ID

!*strings.21934:Resent-Message-ID

!*strings.21935:BCC

!*strings.21936:Can't delete the reserved folder '%s'.

!*strings.21937:Can't search the folder '%s' because it doesn't have a summary file.

!*strings.21938:New

!*strings.21939:Personal Address Book

!*strings.21940:By Status

!*strings.21941:New

!*strings.21942:HTML Mail Question

!*strings.21943:Some of the recipients are not listed as being able to receive HTML\n\
mail.  Would you like to convert the message to plain text or send it\n\
in HTML anyway?\n\
<p>\n\
<table>\n\
<tr><td valign=top>\n\
%-cont-%

!*strings.21944:<input type=radio name=mail value=1 checked>\n\
</td><td valign=top>\n\
Send in Plain Text and HTML\n\
</td></tr><tr><td valign=top>\n\
<input type=radio name=mail value=2>\n\
</td><td valign=top>\n\
%-cont-%

!*strings.21945:Send in Plain Text Only\n\
</td></tr><tr><td valign=top>\n\
<input type=radio name=mail value=3>\n\
</td><td valign=top>\n\
Send in HTML Only\n\
</td></tr>\n\
</table>\n\
<center>\n\
<script>\n\
%-cont-%

!*strings.21946:function Doit(value) {\n\
    document.theform.cmd.value = value;\n\
    document.theform.submit();\n\
}\n\
</script>\n\
<input type=hidden name=cmd value=-1>\n\
%-cont-%

!*strings.21947:<input type=button value="Send" onclick="Doit(0);">\n\
<input type=button value="Don't Send" onclick="Doit(1);">\n\
<input type=button value="Recipients..." onclick="Doit(2);">\n\
%-cont-%

!*strings.21948:<input type=button value="Help" onclick="Doit(3);">\n\
<input type=hidden name=button value=0>\n\
</center>\n

!*strings.21949:

!*strings.21950:

!*strings.21951:

!*strings.21952:

!*strings.21953:

!*strings.21954:<everyone>

!*strings.21955:HTML Recipients

!*strings.21956:The recipients and domains below are not listed as being able to read\n\
HTML messages.  If this listing is incorrect, you may change it below.\n\
%-cont-%

!*strings.21957:<p>\n\
<table>\n\
<tr>\n\
<td>Does not prefer HTML</td>\n\
<td></td>\n\
<td>Prefers HTML</td>\n\
</tr>\n\
<tr>\n\
<td>\n\
<select name=nohtml size=7 multiple\n\
%-cont-%

!*strings.21958:onChange="SelectAllIn(document.theform.html, false);">\n\
%1%\n\
</select>\n\
</td>\n\
<td>\n\
<center>\n\
<input type=button name=add\n\
value="Add &gt; &gt;" onclick="DoAdd();">\n\
%-cont-%

!*strings.21959:<p>\n\
<input type=button name=remove\n\
value="&lt; &lt; Remove" onclick="DoRemove();">\n\
</center>\n\
</td>\n\
<td>\n\
<select name=html size=7 multiple\n\
%-cont-%

!*strings.21960:onChange="SelectAllIn(document.theform.nohtml, false);">\n\
%2%\n\
</select>\n\
</td>\n\
</tr>\n\
</table>\n\
<p>\n\
<center>\n\
%-cont-%

!*strings.21961:<input type=button value=OK onclick="SelectAll(); Doit(0);">\n\
<input type=button value=Cancel onclick="Doit(1);">\n\
<input type=button value=Help onclick="Doit(2);">\n\
%-cont-%

!*strings.21962:<input type=hidden name=cmd value=-1>\n\
<input type=hidden name=button value=0>\n\
</center>\n\
<script>\n\
%0%\n\
</script>\n

!*strings.21963:

!*strings.21964:

!*strings.21965:

!*strings.21966:

!*strings.21967:

!*strings.21968:An Address Book entry with this name and email address already exists.

!*strings.21969:This Address Book entry is already a member of this list.

!*strings.21970:Custom 1

!*strings.21971:Custom 2

!*strings.21972:Custom 3

!*strings.21973:Custom 4

!*strings.21974:Custom 5

!*strings.21975:Mailing lists can only contain entries from the Personal Address Book.\n\
Would you like to add %s to the address book?

!*strings.21976:A mailing list cannot have itself as a member

!*strings.21977:New Card

!*strings.21978:New Personal Card

!*strings.21979:Personal Card for %s

!*strings.21980:CC: %s

!*strings.21981:Bcc: %s

!*strings.21982:To: %s

!*strings.21983:%s can't be saved. Either the disk is full\n\
or the file is locked.\n\
\n\
Try saving on a different disk or try saving\n\
%s with a different name.

!*strings.21984:HEAD call to server failed.\n\
Upload aborted.

!*strings.21985:Unable to open address book database file.

!*strings.21986:A mailing list with this name already exists.

!*strings.21987:Communicator is unable to import this file into the address book.

!*strings.21988:Purging newsgroup %s...

!*strings.21989:Purging newsgroup %s...header %ld

!*strings.21990:Purging newsgroup %s...article %ld

!*strings.21991:Purging newsgroup %s...Done

!*strings.21992:Make sure you specify the entire destination URL.\n\
e.g. http://somemachine/somedirectory/somefile.html\n\
\n\
Try to publish to this URL anyway?

!*strings.21993:Publish destination is invalid.

!*strings.21994:Publish destination contains at least one illegal character.

!*strings.21995:Publish destination must begin with ftp:// or http://

!*strings.21996:Publish destination ends in a slash.

!*strings.21997:Publish destination has no file extension.

!*strings.21998:Source of: 

!*strings.21999:The server 

!*strings.22000:\n\
wishes to set a cookie that will be sent 

!*strings.22001:\n\
to any server in the domain 

!*strings.22002:only back to itself

!*strings.22003:\n\
The name and value of the cookie are:\n

!*strings.22004:\n\
This cookie will persist until 

!*strings.22005:\n\
Do you wish to allow the cookie to be set?

!*strings.22006:Content Length:

!*strings.22007:Real Content Length:

!*strings.22008:Content type:

!*strings.22009:Local filename:

!*strings.22010:Last Modified:

!*strings.22011:Expires:

!*strings.22012:Last accessed:

!*strings.22013:Character set:

!*strings.22014:Secure:

!*strings.22015:Uses relative path:

!*strings.22016:From Netsite Server:

!*strings.22017:Changing the character set may alter some\n\
of the characters in your document.\n\
This change is not undoable.\n\
Are you sure you want to proceed?

!*strings.22018:The following links could become invalid because\n\
they refer to files on your local hard disk(s).\n\
\n\
%s\n\
If you're sure you set up the links properly, click\n\
OK to continue publishing.

!*strings.22019:%s can't be saved because the disk is full or the\n\
file is locked. Try saving on a different disk or try saving\n\
%s with a different name.

!*strings.22020:\n\
\n\
If you continue saving, %s won't be saved with\n\
this page.

!*strings.22021:The file %s associated with this page can't be\n\
saved.  Make sure the file is in the correct location.

!*strings.22022:The file %s associated with this page can't be\n\
saved because there is a problem with the file.

!*strings.22023:There was a problem preparing %s for\n\
publishing. Netscape couldn't create a temporary file.

!*strings.22024:\n\
\n\
Check to see if your hard disk is full.

!*strings.22025:There was a problem preparing %s for publishing.\n\
Netscape couldn't create a temporary file.

!*strings.22026:\n\
\n\
If you continue, %s won't be published with\n\
this page.

!*strings.22027:Netscape couldn't prepare the file %s for\n\
publishing. Make sure the file is in the correct location.

!*strings.22028:The file %s associated with this page can't\n\
be published because there is a problem with the file.

!*strings.22029:There was a problem preparing the message for sending.\n\
Netscape couldn't create a temporary file.

!*strings.22030:There was a problem preparing %s for sending.\n\
Netscape couldn't create a temporary file.

!*strings.22031:Netscape couldn't prepare the file %s for\n\
sending. Make sure the file is in the correct location.

!*strings.22032:The file %s associated with this page can't be\n\
sent because there is a problem with the file.

!*strings.22033:\n\
\n\
If you continue, %s won't be sent with\n\
this page.

!*strings.22034:View Complete Card

!*strings.22035:View Condensed Card

!*strings.22036:By Flag

!*strings.22037:By Unread

!*strings.22038:By Size

!*strings.22039:Netscape was unable to connect to the network because\n\
you are offline.  To reconnect, choose Offline\n\
from the File Menu and then select Work Online.

!*strings.22040: 

!*strings.22041:, 

!*strings.22042:That item can not be moved to the requested location.

!*strings.22043:Enter password to protect data being exported:

!*strings.22044:in %s

!*strings.22045:in selected items

!*strings.22046:in offline mail folders

!*strings.22047:in online mail folders

!*strings.22048:in subscribed newsgroups

!*strings.22049:in searchable newsgroups

!*strings.22050:Default Directory Server

!*strings.22051:Specific Directory Server

!*strings.22052:Hostname or IP Address

!*strings.22053:Conference Software Address

!*strings.22054:Additional Information:

!*strings.22055:HTML Domains

!*strings.22056:<script>\n\
function DeleteSelected() {\n\
  selname = document.theform.selname;\n\
  gone = document.theform.gone;\n\
  var p;\n\
  var i;\n\
  for (i=selname.options.length-1 ; i>=0 ; i--) {\n\
%-cont-%

!*strings.22057:    if (selname.options[i].selected) {\n\
      selname.options[i].selected = 0;\n\
      gone.value = gone.value + "," + selname.options[i].text;\n\
      for (j=i ; j<selname.options.length ; j++) {\n\
%-cont-%

!*strings.22058:        selname.options[j] = selname.options[j+1];\n\
      }\n\
    }\n\
  }\n\
}\n\
%-cont-%

!*strings.22059:function AddNewDomain() {\n\
  selname = document.theform.selname;\n\
  if (document.theform.newDomain.value == "")\n\
    return;\n\
  var i;\n\
%-cont-%

!*strings.22060:  for (i=0; i<selname.options.length; i++) {\n\
    if (selname.options[i].text == document.theform.newDomain.value)\n\
      return;\n\
  }\n\
  newName = new Option(\n\
   document.theform.newDomain.value, document.theform.newDomain.value);\n\
%-cont-%

!*strings.22061:   selname.options[selname.options.length] = newName;\n\
   newlist = document.theform.newdom;\n\
   newlist.value = newlist.value + "," + newName.value;\n\
}\n\
%-cont-%

!*strings.22062:</script>\n\
This is a list of domains that can accept HTML mail.  Anyone whose\n\
e-mail address ends in one of these domains is considered to use a\n\
mail reader which understands HTML, such as Netscape.<p>\n\
%-cont-%

!*strings.22063:You may remove a domain from this list by clicking on it and\n\
choosing Delete. Add a domain by entering the domain name and\n\
clicking Add New Domain.<p>\n\
<select name=selname multiple size=10>\n\
%0%\n\
%-cont-%

!*strings.22064:</select>\n\
<input type=button value=Delete onclick="DeleteSelected();">\n\
<BR><input type="text" name="newDomain"\n\
 SIZE=16 VALUE="" onFocus="this.select()">\n\
%-cont-%

!*strings.22065:<input type=button value="Add New Domain" onclick="AddNewDomain()">\n\
<input type=hidden name=gone value="">\n\
<input type=hidden name=newdom value="">\n

!*strings.22066:The newsgroup %s was accepting HTML because all newsgroups whose name\n\
started with "%s" were marked to accept HTML.  This action will\n\
reverse that; newsgroups whose name start with "%s" will no longer\n\
accept HTML.

!*strings.22067:Folder

!*strings.22068:The newsgroup %s does not appear to exist on the host %s.\n\
Would you like to unsubscribe from it?

!*strings.22079:Show Security Information

!*strings.22080:Encrypted<BR><NOBR>and Signed</NOBR>

!*strings.22081:Signed

!*strings.22082:Encrypted

!*strings.22083:Certificates

!*strings.22084:Invalid Signature

!*strings.22085:Invalid Signature

!*strings.22086:Invalid Encryption

!*strings.22087:Invalid Certificates

!*strings.22088:New Newsgroup

!*strings.22089:Creates a new category in this newsgroup

!*strings.22090:There is no email address for %s.

!*strings.22091:Expired %ld messages

!*strings.22092:Expired %ld messages...Done

!*strings.22093:Trash

!*strings.22094:Inbox

!*strings.22095:Unsent Messages

!*strings.22096:Drafts

!*strings.22097:Sent

!*strings.22098:New Folder

!*strings.22099:Rename Folder

!*strings.22100:Manage Mail Account

!*strings.22101:Netscape is unable to manage your mail account.\n\
Please contact your mail account administrator\n\
or try again later.

!*strings.22102:Manage Newsgroups

!*strings.22103:Netscape is unable to locate the socks server:\n\
  %.200s\n\
The server does not have a DNS entry.\n\
\n\
Check the socks server name in the proxy\n\
configuration and try again.

!*strings.22104:An object with that nickname exists.  Please enter a new nickname.

!*strings.22105:Get New News Articles

!*strings.22106:Local Mail

!*strings.22107:%s Newsgroups

!*strings.22108:%s Receiving: message headers %lu of %lu

!*strings.22109:%s Receiving: message flags %lu of %lu

!*strings.22110:Deleting messages...

!*strings.22111:Deleting message...

!*strings.22112:Moving messages to %s...

!*strings.22113:Moving message to %s...

!*strings.22114:Copying messages %s...

!*strings.22115:Copying message %s...

!*strings.22116:Opening folder %s...

!*strings.22117:Are you sure you want to move %s away from its default \n\
location? Next time Communicator runs, a new %s folder \n\
will be created in the default location

!*strings.22118:Update Message Counts

!*strings.22119:Deleting %lu of %lu messages

!*strings.22120:Copying %lu of %lu messages to %s

!*strings.22121:Moving %lu of %lu messages to %s

!*strings.22122:Your file was uploaded successfully.

!*strings.22123:%d files were uploaded successfully.

!*strings.22124:Mail: delivering message %ld to %s...

!*strings.22125:Mail: delivering message %ld...

!*strings.22126:You are doing an unencrypted Forward of a message which was\n\
encrypted when you received it.  Sending this message unencrypted\n\
may reduce the level of privacy of the attached message.\n\
\n\
Send unencrypted anyway?

!*strings.22127:\n\
\n\
Browse to your default publishing location now?

!*strings.22128:You can not copy and paste between different\n\
versions of Netscape Composer or Netscape Gold.

!*strings.22129:You can not copy and paste between windows with\n\
different character set encodings.

!*strings.22130:NFS URLs not internally supported, use an HTTP proxy server: 

!*strings.22132:Change rule to reflect new folder location?

!*strings.22133:Disable filter rule for this folder?

!*strings.22134:Dynamic Fonts

!*strings.22135:<H2>Installed Font Displayers<HR WIDTH=100%></H2>\n\
 <FONT SIZE=+0>\n\
 The font displayers that you have installed and the font formats\n\
 supported by each, are listed below.

!*strings.22136:Use the radioboxes to enable or disable a particular format for a\n\
 particular displayer.<P>

!*strings.22137:For more information on Netscape Dynamic Fonts, click <a href=http://home.netscape.com/comprod/products/communicator/version_4.0/dynfonts  target=aboutDynamicFonts>here</a><hr>

!*strings.22138:</FONT>

!*strings.22139:<TABLE BORDER WIDTH=99%%><TR>\n\
 <TD COLSPAN=3><B>%s</B><BR>%s<BR>Located at: %s<BR><BR></TD>\n\
 </TR>

!*strings.22140:<TABLE BORDER WIDTH=99%%><TR>\n\
 <TD COLSPAN=3><B>%s</B><BR>%s<BR><BR></TD>\n\
 </TR>

!*strings.22141:<TR>\n\
 <TD WIDTH=33%%><INPUT NAME="%s" TYPE=Radio VALUE="%s" %s><B>%s</B></TD>\n\
 <TD WIDTH=50%%>%s</TD>\n\
 <TD>%s</TD>\n\
 </TR>

!*strings.22142:</TABLE>\n\
 <BR>\n\
 <BR>

!*strings.22143:<B>No Displayers Installed</B>

!*strings.22144:Netscape Default Font Displayer

!*strings.22145:This font displayer handles fonts that are installed on the system.

!*strings.22146:Outbox

!*strings.22147:The `Outbox' folder contains a message which is not\n\
scheduled for delivery!

!*strings.22148:The `Outbox' folder contains %d messages which are not\n\
scheduled for delivery!

!*strings.22149:\n\
\n\
This probably means that some program other than\n\
Netscape has added messages to this folder.\n

!*strings.22150:The `Outbox' folder is special; it is only for storing\n\
messages to be sent later.

!*strings.22151:The local configuration file specified a configuration URL but the AutoAdmin component could not\n\
 be loaded.  AutoAdmin is required to support remote configuration URLs.  You will be unable to load\n\
 any remote documents.

!*strings.22152:Adding to %s: %ld of %ld

!*strings.22153:<B><FONT COLOR="#808080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal</FONT></B>

!*strings.22154:File Name to Import

!*strings.22155:File Name to Export

!*strings.22156:This document is %ld bytes long. That is too large to be read by a Composer Plug-in. The maximum allowed size is %ld bytes.

!*strings.22157:The Composer Plug-in tried to create a document that is %ld bytes long. The maximum allowed size is %ld bytes.

!*strings.22158:S/MIME Encrypted Message

!*strings.22159:S/MIME Cryptographic Signature

!*strings.22160:Netscape was unable to start Netcaster.\n\
Make sure Netcaster is installed correctly.

!*strings.22161:Composer can't open the URL '%s'.\n\
\n\
You must enter an absolute URL or an absolute pathname.\n\
e.g. 'http://mysystem.com/mydoc.html'

!*strings.22162:%d-bit %s

!*strings.22163:Only one operation at a time on this folder is permitted. \n\
Please wait until the other operation completes and try again.

!*strings.22164:Are you sure you want to move the selected folders into the Trash?

!*strings.22165:Netscape is unable to start Netcaster because Java and/or JavaScript are not enabled. \n\
Please verify that your Advanced Preferences are set correctly and try again.

!*strings.22170:0,0,0,Default color

!*strings.22171:255,255,255,#FFFFFF

!*strings.22172:204,204,204,#CCCCCC

!*strings.22173:153,153,153,#999999

!*strings.22174:102,102,102,#666666

!*strings.22175:51,51,51,#333333

!*strings.22176:0,0,0,#000000

!*strings.22177:255,204,204,#FFCCCC

!*strings.22178:255,102,102,#FF6666

!*strings.22179:255,0,0,#FF0000

!*strings.22180:204,0,0,#CC0000

!*strings.22181:153,0,0,#990000

!*strings.22182:102,0,0,#660000

!*strings.22183:51,0,0,#330000

!*strings.22184:255,204,153,#FFCC99

!*strings.22185:255,204,51,#FFCC33

!*strings.22186:255,153,0,#FF9900

!*strings.22187:255,102,0,#FF6600

!*strings.22188:204,102,0,#CC6600

!*strings.22189:153,51,0,#993300

!*strings.22190:102,51,0,#663300

!*strings.22191:255,255,204,#FFFFCC

!*strings.22192:255,255,153,#FFFF99

!*strings.22193:255,255,0,#FFFF00

!*strings.22194:255,204,0,#FFCC00

!*strings.22195:153,153,0,#999900

!*strings.22196:102,102,0,#666600

!*strings.22197:51,51,0,#333300

!*strings.22198:153,255,153,#99FF99

!*strings.22199:102,255,153,#66FF99

!*strings.22200:51,255,51,#33FF33

!*strings.22201:0,204,0,#00CC00

!*strings.22202:0,153,0,#006600

!*strings.22203:0,102,0,#006600

!*strings.22204:0,51,0,#003300

!*strings.22205:204,255,255,#CCFFFF

!*strings.22206:102,255,255,#66FFFF

!*strings.22207:51,204,255,#33CCFF

!*strings.22208:51,102,255,#3366FF

!*strings.22209:51,51,255,#3333FF

!*strings.22210:0,0,153,#000099

!*strings.22211:0,0,102,#000066

!*strings.22212:255,204,255,#FFCCFF

!*strings.22213:255,153,255,#FF99FF

!*strings.22214:204,102,204,#CC66CC

!*strings.22215:204,51,204,#CC33CC

!*strings.22216:153,51,102,#993366

!*strings.22217:102,51,102,#663366

!*strings.22218:51,0,51,#330033

!*strings.22219:

!*strings.22261:

!*strings.22262:SmartUpdate failed: Downloaded archive is not a JAR file.

!*strings.22263:SmartUpdate failed: JAR archive failed security check. %s.

!*strings.22264:SmartUpdate failed: JAR archive has no installer file information.

!*strings.22265:SmartUpdate failed: JAR archive is missing an installer file %s.

!*strings.22266:No automatic configuration file was received.\n\
\n\
You will be unable to load and documents from the network.\n\
See your local system administrator for help.

!*strings.22267:The automatic configuration file is not of the correct type:\n\
\n\
        %s\n\
\n\
Expected the MIME type of application/x-javascript-config.

!*strings.22268:The automatic configuration file could not be loaded.\n\
\n\
You will be unable to load any documents from the network.\n\
See your local system administrator for help.

!*strings.22269:No automatic configuration file was received.\n\
\n\
Will default based on the last configuration.

!*strings.22270:The backup automatic configuration file had errors.\n\
\n\
We will default to the standard configuration.

!*strings.22271:The automatic configuration file has errors:\n\
\n\
        %s\n\
\n\
We will default to the standard configuration.

!*strings.22272:Automatic configuration load was cancelled.\n\
\n\
We will default to the standard configuration.

!*strings.22273:Your certificates have been successfully exported.

!*strings.22274:Your certificates have been successfully imported.

!*strings.22275:Enter password protecting data to be imported:

!*strings.22276:Would you like to add the remaining addresses to the personal address book?

!*strings.22277:User Certificate

!*strings.22278:User E-mail Certificate

!*strings.22279:The Trash already contains a folder named '%s.'\n\
Please either empty the trash or rename this folder.

!*strings.22280:The Trash already contained a folder named '%s.'\n\
The folder which you just deleted can be found in the Trash\n\
under the new name '%s.'

!*strings.22281:The current command did not succeed.  The mail server responded:\n\
%s

!*strings.22282:Where would you like to install %s?

!*strings.22283:View Document Source

!*strings.22284:<H3>No info while document is loading</H3>\n

!*strings.22285:<LI>Frame: 

!*strings.22286:Image:

!*strings.22287:Embed:

!*strings.22288:Applet:

!*strings.22289:Background Image: 

!*strings.22290:<LI>Action URL: 

!*strings.22291:<LI>Encoding: 

!*strings.22292:<LI>Method: 

!*strings.22293:<LI>Layer: 

!*strings.22294:Some of these attachments contain Macintosh specific information. Using UUENCODE will cause this information to be lost. Continue sending?

!*strings.22295:Re-enter the password to confirm it:

!*strings.22296:The passwords entered did not match.  Enter\n\
the password to protect data being exported:

!*strings.22297:Creating folder...

!*strings.22298:Opening folder...

!*strings.22299:Deleting folder %s...

!*strings.22300:Renaming folder %s...

!*strings.22301:Looking for folders...

!*strings.22302:Subscribing to folder %s...

!*strings.22303:Unsubscribing from folder %s...

!*strings.22304:Searching folder...

!*strings.22305:Getting message info...

!*strings.22306:Closing folder...

!*strings.22307:Compacting folder...

!*strings.22308:Logging out...

!*strings.22309:Checking mail server capabilities...

!*strings.22310:Sending login information...

!*strings.22311:Sending authenticate login information...

!*strings.22312:SmartUpdate is not complete until you reboot Windows

!*strings.22313:to Sender Only

!*strings.22314:untitled

!*strings.22315:Advance to next unread message in %s?

!*strings.22316:Sorry, access to the port number given\n\
has been disabled for security reasons

!*strings.22317:Lowest

!*strings.22318:Low

!*strings.22319:Normal

!*strings.22320:High

!*strings.22321:Highest

!*strings.22322:NONE

!*strings.22323:Receiving: message totals: %lu of %lu

!*strings.22324:Please enter your %s and password for access to %s

!*strings.22325:%s - Receiving: message %lu of %lu

!*strings.22326:Sorry, Collabra has been disabled;  newsgroup functionality has been turned off.

!*strings.22327:Downloading message...

!*strings.22328:Folder creation succeeded, but Netscape was unable to subscribe the new folder.

!*strings.22329:Folder deletion succeeded, but Netscape was unable to unsubscribe from the folder.

!*strings.22330:Folder move succeeded, but Netscape was unable to subscribe to the new folder name.

!*strings.22331:Folder move succeeded, but Netscape was unable to unsubscribe from the old folder name.

!*strings.22332:Close Window?

!*strings.22333:Close Window %s?

!*strings.22334:Your Cookies

!*strings.22335:Maximum number of cookies allowed:

!*strings.22336:The number of cookies you have:

!*strings.22337:Maximum number of cookies per server:

!*strings.22338:Maximum size of each cookie:

!*strings.22339:You have no cookies.

!*strings.22340:Name:

!*strings.22341:Value:

!*strings.22342:Host:

!*strings.22343:Send to host:

!*strings.22344:any host in the domain from the host above

!*strings.22345:the above fully qualified host only

!*strings.22346:Send to path:

!*strings.22347: (and below)

!*strings.22348:Secure:

!*strings.22349:Expires:

!*strings.22350:at end of session

!*strings.22351:LDAP Search Results

!*strings.22352:Javascript Cookie Filter Message:\n

!*strings.22353:Edit JavaScript Message Filter

!*strings.22354:New JavaScript Message Filter

!*strings.22355:<form name=jsfilterdlg_form action=internal-panel-handler method=post> <table width="100%%"> <tr><td colspan=2 bgcolor="#000000">     <font color="#ffffff">JavaScript Message Filter</font> %-cont-%

!*strings.22356:<tr><td align=right>Filter Name: \n\
     <td><input name="filter_name" type=text size=30 value="%0%"> %-cont-%

!*strings.22357:<tr><td align=right>JavaScript Function: \n\
     <td><input name="filter_script" type=text size=30 value="%1%"> %-cont-%

!*strings.22358:<tr><td align=right>Description: \n\
     <td><input name="filter_desc" type=text size=30 value="%2%"> %-cont-%

!*strings.22359:<tr><td align=right>Filter is \n\
     <td><input type=radio name=enabled value=on %3%>on<input type=radio name=enabled value=off %4%>off </table></form>

!*strings.22360:

!*strings.22361:

!*strings.22362:

!*strings.22363:

!*strings.22364:

!*strings.22365:Retrieve selected messages

!*strings.22366:Retrieve flagged messages

!*strings.22367:Checking IMAP Namespace...

!*strings.22368:Communicator is unable to replicate the directory because the server's change log information is incomplete.\n\
The change log information may be invalid or incompatible with Communicator.

!*strings.22369:Communicator is unable to replicate the directory because the server's replication information is incomplete.\n\
The server may not support or may not be configured for replication.

!*strings.22370:Can't replicate at this time.  Netscape may be out of memory or busy.

!*strings.22371:New Address Book...

!*strings.22372:New Directory...

!*strings.22373:Templates

!*strings.22374:Saving as draft ...

!*strings.22375:Saving as template ...

!*strings.22376:Add %s to your Address Book

!*strings.22377:Enter a name for your new message template.

!*strings.22378:Note: this Return Receipt only acknowledges that the message was displayed on the recipient's machine. There is no guarantee that the content has been read or understood.

!*strings.22379:The message has been sent somewhere in some manner (e.g., printed, faxed, forwarded) without being displayed to the person you sent it to. They may or may not see it later.

!*strings.22380:The message has been processed in some manner (i.e., by some sort of rules or server) without being displayed to the person you sent it to. They may or may not see it later. There may not even be a human user associated the mailbox.

!*strings.22381:The message has been deleted. The person you sent it to may or may not have seen it. They might "undelete" it at a later time and read it.

!*strings.22382:The recipient of the message does not wish to send a return receipt back to you.

!*strings.22383:A failure occurred. A proper return receipt could not be generated or sent to you.

!*strings.22384:The sender of the message requested a receipt to be returned. \n\
Do you wish to send one?

!*strings.22385:Delivering message...

!*strings.22386:Delivering message... Done

!*strings.22387:Found folder: %s

!*strings.22388:Forward Inline

!*strings.22389:Template

!*strings.22390:Inbox

!*strings.22391:The mail server indicates that you may not have any personal mail folders.\n\
Please verify your subscriptions.

!*strings.22392:While trying to automatically subscribe, Netscape has found a large number of mail folders.\n\
Please select which folders you would like subscribed.

!*strings.22393:Netscape has detected that you have upgraded from a previous version of Communicator.\n\
You will need to choose which mail folders you want subscribed.

!*strings.22394:Any folders which are left unsubscribed will not appear in your folder lists,\n\
but can be subscribed to later by choosing File / Subscribe.

!*strings.22395:Would you like Netscape to try to automatically subscribe to all your folders?

!*strings.22396:Please choose which folders you want subscribed in the Subscribe window...

!*strings.22397:Please wait while Netscape upgrades you to use IMAP mail folder subscriptions...

!*strings.22398:The upgrade was successful.

!*strings.22399:You can have multiple mail servers if they are IMAP servers.  You are currently using a POP server.

!*strings.22400:Are you sure you want to delete this server?

!*strings.22401:Getting folder ACL...

!*strings.22402:Click here to remove all expired articles

!*strings.22403:Return Receipt (displayed)

!*strings.22404:Return Receipt (dispatched)

!*strings.22405:Return Receipt (processed)

!*strings.22406:Return Receipt (deleted)

!*strings.22407:Return Receipt (denied)

!*strings.22408:Return Receipt (failed)

!*strings.22409:Getting Server Configuration Info...

!*strings.22410:Getting Mailbox Configuration Info...

!*strings.22411:This body part will be downloaded on demand.

!*strings.22412:IMAP Error: The message could not be saved due to an error.

!*strings.22413:IMAP Error: The online folder information could not be retrieved.

!*strings.22414:Login failed.

!*strings.22415:Please enter some text to search for and try again.

!*strings.22416:Unverified Signature

!*strings.22417:Full Control

!*strings.22418:Lookup

!*strings.22419:Read

!*strings.22420:Set Read/Unread State

!*strings.22421:Write

!*strings.22422:Insert (Copy Into)

!*strings.22423:Post

!*strings.22424:Create Subfolder

!*strings.22425:Delete Messages

!*strings.22426:Administer Folder

!*strings.22427:Personal Folder

!*strings.22428:Personal Folder

!*strings.22429:Public Folder

!*strings.22430:Other User's Folder

!*strings.22431:This is a personal mail folder.  It is not shared.

!*strings.22432:This is a personal mail folder.  It has been shared.

!*strings.22433:This is a public folder.

!*strings.22434:This is a mail folder shared by the user '%s'.

!*strings.22435:Unknown

!*strings.22436:Password entered doesn't match last password used with server.

!*strings.22437:You have not entered a password or have exceeded the number of password attempts allowed.

!*strings.22438:Are you sure you want to remove the mail host %s?

!*strings.22439:Verify Signature

!*strings.22440:Toggle Attachment Pane

!*strings.22441:Download Status

!*strings.22442:Not downloaded with message

!*strings.22443:Show all recipients

!*strings.22444:The Newsgroups header is not valid

!*strings.22445:To choose which online mail folders are displayed by default in your folder list, select File / Subscribe.\n\
Folders left unsubscribed can be subscribed later.

!*strings.22446:Show short recipient list

!*strings.22447:.* (%ld groups)

!*strings.22448: (%ld subfolder)

!*strings.22449: (%ld subfolders)

!*strings.22452:Waiting for connection to folder %s

!*strings.22453:Password for IMAP user %.100s on %.100s:

!*strings.22454:In the future, you can select which messages or folders to read offline. To do \n\
this, choose Offline from the file menu and then select Synchronize. You can \n\
adjust the Disk Space preference to prevent the downloading of large messages.

!*strings.22455:Communicator can only send a message to one news server at a time.

!*strings.22456:Please wait while Messenger rebuilds summary information \n\
	   about mail folders and newsgroups.

!*strings.22457:The Followup-To header is not valid

!*strings.22460:About Related Items

!*strings.22461:Detailed List...

!*strings.22462:Retrieving data

!*strings.22463:Nothing available

!*strings.22464:Disabled for this site

!*strings.22465:Replicating Directory

!*strings.22466:Connecting to directory server...

!*strings.22467:Replicating directory change entry %d

!*strings.22468:Replicating directory entry %d

!*strings.22469:Mail id invalid or not unique, cannot resolve to directory authorization entry.

!*strings.22470:SmartUpdate\n\
Configure software installation

!*strings.22471:Uninstall 

!*strings.22472:Are you sure you want to uninstall %s?

!*strings.22473:Error in uninstall

!*strings.22474:SmartUpdate: Downloading Install

!*strings.22475:Location: %s

!*strings.22476:Communicator is unable to update your %s replica.\n\
The data is either too old or is corrupt.  Do you want to recreate the replica?

!*strings.22477:Updating Netscape Client Registry

!*strings.22478:Communicator is updating your Netscape registry.

!*strings.22479:%d bytes of %d bytes

!*strings.22480:SmartUpdate: %s

!*strings.22481:Unpacking files for installation

!*strings.22482:Installing...

!*strings.22483:This is a Return Receipt for the mail that you sent to %s.

!*strings.22484:Please enter your password for access to %s

!*strings.22485:SmartUpdate failed: There is not enough disk space to complete this operation.

!*strings.22486:If this directory supports replication, click the Update Now button to start the process now.  Or, select the directory for downloading when you synchronize for working offline.

!*strings.22487:Group

!*strings.22488:Unread Folder

!*strings.22489:Unread Group

!*strings.22490:SmartUpdate warning:\n\
\n\
You are running low on disk space.  This install may not complete successfully.  Do you want to continue?

!*strings.22491:Retrieving %1$ld of %2$ld messages\n\
  in folder %3$s

!*strings.22492:There was a problem receiving your Javascript configuration file.\n\
As a result, you will not be able to connect to the network.\n\
\n\
See your local system administrator for help.

!*strings.22493:The Javascript configuration file has errors:\n\
\n\
        %s\n\
\n\
Use the configuration from the previous session instead?

!*strings.22494:The backup Javascript configuration file was absent or had errors.\n\
\n\
We will default to the standard configuration.

!*strings.22495:http://home.netscape.com/bookmark/4_72/tshop.html

!*strings.22496:http://home.netscape.com/bookmark/4_72/tradio.html

!*strings.22497:Personal Toolbar Folder

!*strings.22498:Type a Web Address or Keyword and press Enter

!*strings.22501:Keep Server File

!*strings.22502:Keep Local File

!*strings.22503:Delete Server File

!*strings.22504:Delete Local File

!*strings.22505:Download conflict

!*strings.22506:Upload conflict

!*strings.22507:Local and server copies of %s are in conflict.\n\
\n\
\n\
	  Local file last modified : %s\n\
\n\
	  Server file last modified : %s

!*strings.22508:%s has been deleted locally.

!*strings.22509:%s has been deleted on the server.

!*strings.22510:File Deleted

!*strings.22511:Your new Roaming Access preference\n\
will take effect the next time\n\
you restart Communicator.

!*strings.22512:An authorization error occurred,\n\
please try retyping your username and password.

!*strings.22513:The Roaming Access server name specified does not exist,\n\
please check the spelling and try again.

!*strings.22514:An unexpected network error occurred.\n\
Cannot connect to the Roaming Access server.

!*strings.22518:Roaming Access

!*strings.22519:User Preferences

!*strings.22520:Mail Filters

!*strings.22521:History

!*strings.22522:Bookmarks File

!*strings.22523:Cookies File

!*strings.22524:Certificates and Private Keys (Certificate Database)

!*strings.22525:Certificates and Private Keys (Personal Key Database)

!*strings.22526:Certificates and Private Keys (Security Module)

!*strings.22527:Java Security (Signed Applet DB)

!*strings.22528:Java Security (Signed Applet DB 0)

!*strings.22529:Address Book

!*strings.22530:Synchronizing item %d of %d.

!*strings.22531:To be able to synchronize your roaming access\n\
profile information, remember to go back online\n\
before exiting Communicator

!*strings.22532:To be able to synchronize your roaming access\n\
profile information, remember to go back online\n\
before quitting Communicator

!*strings.22533:An authorization error occurred,\n\
please try retyping your password.

!*strings.22534:Contacting host...

!*strings.22535:Download from server in progress

!*strings.22536:Verifying login

!*strings.22537:You must specify a username to successfully\n\
log in to the Roaming Access server.\n\
Open the Roaming Access preferences pane to enable\n\
Roaming Access and enter your User Name.

!*strings.22538:You must specify a valid URL to successfully\n\
log in to the Roaming Access server.\n\
Open the Roaming Access - Server Information preferences\n\
pane to enable Roaming Access and enter the server's URL.

!*strings.22539:You must specify a username to successfully\n\
log in to the Roaming Access server.\n\
Files will not be transferred to the server this session.\n\
Open the Roaming Access preferences pane to enter your User Name.

!*strings.22540:You must specify a valid server URL to successfully\n\
log in to the Roaming Access server.

!*strings.22541:Upload to server in progress.

!*strings.22542:Uploading all items

!*strings.22543:Uploading folder

!*strings.22544:Removing remote file

!*strings.22545:Downloading folder

!*strings.22546:Removing local file

!*strings.22547:You must specify a username to successfully\n\
log in to the Roaming Access server.\n

!*strings.22551:Error

!*strings.22552:Published Event

!*strings.22553:Published Free/Busy

!*strings.22554:Reply Free/Busy

!*strings.22555:Event Request

!*strings.22556:Free/Busy Time Request

!*strings.22557:Event Reply

!*strings.22558:Event Cancellation

!*strings.22559:Event Refresh Request

!*strings.22560:Event Counter Proposal

!*strings.22561:Decline Counter Proposal

!*strings.22562:What:

!*strings.22563:When:

!*strings.22564:Location:

!*strings.22565:Organizer:

!*strings.22566:Status:

!*strings.22567:Priority:

!*strings.22568:Categories:

!*strings.22569:Resources:

!*strings.22570:Attachments:

!*strings.22571:Alarms:

!*strings.22572:Created:

!*strings.22573:Last Modified:

!*strings.22574:Sent:

!*strings.22575:UID

!*strings.22577:Legend:

!*strings.22578:free

!*strings.22579:busy

!*strings.22580:unknown

!*strings.22581:undefined

!*strings.22582: AM

!*strings.22583: PM

!*strings.22584:More Details...

!*strings.22585:Add To Schedule

!*strings.22586:Close

!*strings.22587:Accept

!*strings.22588:Accept All

!*strings.22589:Update Schedule

!*strings.22590:Decline

!*strings.22591:Tentative

!*strings.22592:Send Free/Busy Time Infomation

!*strings.22593:Send Refresh

!*strings.22594:Delegate to

!*strings.22595:This event is already in your schedule\n

!*strings.22596:This event is not yet in your schedule\n

!*strings.22597:Conflicts:

!*strings.22598:Note:

!*strings.22599:<FONT COLOR=#FF0000>Error:</FONT>

!*strings.22600: to 

!*strings.22601: ( Day Event) 

!*strings.22602: Begins on 

!*strings.22603:Was

!*strings.22614:Published Calendar Events

!*strings.22615:Published Calendar Free/Busy

!*strings.22616:This messages contains %d events.

!*strings.22617:When

!*strings.22618:What

!*strings.22619:: 

!*strings.22620:There are also %d other errors

!*strings.22621:Display limited to the first %d events.

!*strings.22622:Unknown

!*strings.22623:DTEnd before DTStart.  Setting DTEnd equal to DTStart

!*strings.22624:Prompt value must be ON or OFF

!*strings.22625:Cannot parse time/date string

!*strings.22626:Recurrence rules are too complicated.  Only the first instance was scheduled

!*strings.22627:Invalid property value

!*strings.22628:Invalid property name

!*strings.22629:Invalid parameter name

!*strings.22700:The required configuration file %s could not be found.  Please reinstall the software or contact your administrator.

!*strings.22701:The required configuration file %s is invalid.  Please reinstall the software or contact your administrator.

!*strings.22702:An error occurred while reading the preference file %s.  Default preferences will be used.

!*strings.22703:Communicator could not retrieve preferences from the directory server %s because an authentication error occurred.  Try retyping your password or contact your system administrator for more information.

!*strings.22704:Communicator could not connect to the directory server %s to retrieve preference information.  The server may be down or busy.  Some preferences were retrieved using previously cached information.\n\
\n\
If this error persists, contact your system administrator.

!*strings.22705:Communicator could not retrieve preferences from the directory server %s because the preference map could not be found.  Some preferences were retrieved using previously cached information.\n\
\n\
If this error persists, contact your system administrator.

!*strings.22706:Communicator could not retrieve preferences from the directory server %s because your directory entry could not be found.  Some preferences were retrieved using previously cached information.\n\
\n\
If this error persists, contact your system administrator.

!*strings.22707:Your new passwords did not match.  Please retype your new password in both fields.  If you do not want to password protect your profile, leave both fields blank.

!*strings.22709:Communicator could not complete your request because the profile manager encountered an unexpected error.

!*strings.22710:The profile '%s' requires a password.  Enter your password to login into your Roaming Access Profile and retrieve your profile information.

!*strings.22711:Please enter your password to retrieve preferences from the directory server %s.

!*strings.22712:The profile '%s' requires a password. In order to continue, please enter your local profile password.

!*strings.22713:Another profile already exists with that name.  Please choose a different profile name.

!*strings.22714:You must enter a new profile password to continue.

!*strings.22715:Guest

!*strings.8000:End of List

!*strings.8001:Entire List

!*strings.8003:Save As... (type %.90s, encoding %.90s)

!*strings.8004:Save As... (type %.90s)

!*strings.8005:Save As... (encoding %.90s)

!*strings.8006:Save As...

!*strings.8007:Error opening %.900s:

!*strings.8008:Error deleting %.900s:

!*strings.8009:When connected, log in as user `%.900s'

!*strings.8010:Out Of Memory -- Can't Open URL

!*strings.8011:couldn't load:\n\
%s

!*strings.8012:%s\n\
No other resources were reasonable!\n\
Using fallback font "%s" instead.

!*strings.8013:%s\n\
No other resources were reasonable!\n\
The fallback font "%s" could not be loaded!\n\
Giving up.

!*strings.8014:Bookmarks file has changed on disk: discard your changes?

!*strings.8015:Bookmarks file has changed on disk: reload it?

!*strings.8016:New Item

!*strings.8017:New Header

!*strings.8018:Remove category "%.900s" and its %d entry?

!*strings.8019:Remove category "%.900s" and its %d entries?

!*strings.8020:Export Bookmark

!*strings.8021:Import Bookmark

!*strings.8022:This version supports %s security with %s.

!*strings.8023:Security disabled

!*strings.8024:file:/usr/local/lib/netscape/docs/Welcome.html

!*strings.8025:Document: Done.

!*strings.8026:Open File

!*strings.8027:Error opening pipe to %.900s

!*strings.8028:Warning:\n\
\n

!*strings.8029:%s "%.255s" does not exist.\n

!*strings.8030:%s "%.255s" is unknown.\n

!*strings.8031:No port number specified for %s.\n

!*strings.8032:Mail host

!*strings.8033:News host

!*strings.8034:News RC directory

!*strings.8035:Temporary directory

!*strings.8036:FTP proxy host

!*strings.8037:Gopher proxy host

!*strings.8038:HTTP proxy host

!*strings.8039:HTTPS proxy host

!*strings.8040:WAIS proxy host

!*strings.8041:SOCKS host

!*strings.8042:Global MIME types file

!*strings.8043:Private MIME types file

!*strings.8044:Global mailcap file

!*strings.8045:Private mailcap file

!*strings.8046:Cannot delete toplevel bookmark

!*strings.8047:Cannot cut toplevel bookmark

!*strings.8048:This is an alias to the following Bookmark:

!*strings.8049:File Open...

!*strings.8050:Printing of frames is currently not supported.

!*strings.8051:error saving options

!*strings.8052:unknown %s escape code %%%c:\n\
%%h = host, %%p = port, %%u = user

!*strings.8053:couldn't fork():

!*strings.8054:%s: execvp(%s) failed

!*strings.8055:Save Frame as...

!*strings.8057:Print Frame...

!*strings.8058:Print...

!*strings.8059:Download File: %s

!*strings.8060:Compose: (No Subject)

!*strings.8061:Compose: %s

!*strings.8062:Netscape: <untitled>

!*strings.8063:Netscape: %s

!*strings.8064:(no subject)

!*strings.8065:unknown error code %d

!*strings.8066:Invalid File attachment.\n\
%s: doesn't exist.\n

!*strings.8067:Invalid File attachment.\n\
%s: not readable.\n

!*strings.8068:Invalid File attachment.\n\
%s: is a directory.\n

!*strings.8069:couldn't fork() for movemail

!*strings.8070:problems executing %s:

!*strings.8071:%s terminated abnormally:

!*strings.8072:Unable to open %.900s

!*strings.8073:Please enter your news host in one\n\
of the following formats:\n\
\n\
    news://HOST,\n\
    news://HOST:PORT,\n\
    snews://HOST, or\n\
    snews://HOST:PORT\n\
\n

!*strings.8074:For the internal movemail method to work, we must be able to create\n\
lock files in the mail spool directory.  On many systems, this is best\n\
accomplished by making that directory be mode 01777.  If that is not\n\
possible, then an external setgid/setuid movemail program must be used.\n\
Please see the Release Notes for more information.

!*strings.8075:Can't move mail from %.200s

!*strings.8076:Can't get new mail; a lock file %.200s exists.

!*strings.8077:Can't get new mail; unable to create lock file %.200s

!*strings.8078:Can't get new mail; a system error occurred.

!*strings.8079:Can't move mail; unable to open %.200s

!*strings.8080:Can't move mail; unable to read %.200s

!*strings.8081:Can't move mail; unable to write to %.200s

!*strings.8082:There were problems moving mail

!*strings.8083:There were problems moving mail: exit status %d

!*strings.8134:There were problems cleaning up %s

!*strings.8085:%s\n\
usage: %s [ options ... ]\n\
       where options include:\n\
\n\
       -help                     to show this message.\n\
       -version                  to show the version number and build date.\n\
       -display <dpy>            to specify the X server to use.\n\
       -geometry =WxH+X+Y        to position and size the window.\n\
       -visual <id-or-number>    to use a specific server visual.\n\
       -install                  to install a private colormap.\n\
       -no-install               to use the default colormap.\n

!*strings.8154:       -share                    when -install, cause each window to use the\n\
                                 same colormap instead of each window using\n\
                                 a new one.\n\
       -no-share                 cause each window to use the same colormap.\n

!*strings.8086:       -ncols <N>                when not using -install, set the maximum\n\
                                 number of colors to allocate for images.\n\
       -mono                     to force 1-bit-deep image display.\n\
       -iconic                   to start up iconified.\n\
       -xrm <resource-spec>      to set a specific X resource.\n\
\n\
       -remote <remote-command>  to execute a command in an already-running\n\
                                 Netscape process.  For more info, see\n\
			  http://home.netscape.com/newsref/std/x-remote.html\n\
       -id <window-id>           the id of an X window to which the -remote\n\
                                 commands should be sent; if unspecified,\n\
                                 the first window found will be used.\n\
       -raise                    whether following -remote commands should\n\
                                 cause the window to raise itself to the top\n\
                                 (this is the default.)\n\
       -noraise                  the opposite of -raise: following -remote\n\
                                 commands will not auto-raise the window.\n\
\n\
       -nethelp                  Show nethelp.  Requires nethelp: URL.\n\
\n\
       -dont-force-window-stacking  Ignore the alwaysraised, alwayslowered \n\
                                    and z-lock JavaScript window.open() \n\
                                    attributes.\n\
\n\
       -no-about-splash          Bypass the startup license page.\n\
\n\
       -no-session-management\n\
       -session-management       Netscape supports session management\n\
                                 by default.  Use these flags to force\n\
                                 it on/off.\n\
\n\
       -no-irix-session-management\n\
       -irix-session-management  Different platforms deal with session\n\
                                 management in fundamentally different\n\
                                 ways.  Use these flags if you experience\n\
                                 session management problems.\n\
\n\
                                 IRIX session management is on by default\n\
                                 only on SGI systems.  It is also available\n\
                                 on other platforms and might work with\n\
                                 session managers other than the IRIX\n\
                                 desktop.\n\
\n\
       -dont-save-geometry-prefs Don't save window geometry for session.\n\
\n\
       -ignore-geometry-prefs    Ignore saved window geometry for session.\n\
\n

!*strings.8087:%s: program is version %s, but resources are version %s.\n\
\n\
	This means that there is an inappropriate `%s' file in\n\
	he system-wide app-defaults directory, or possibly in your\n\
	home directory.  Check these environment variables and the\n\
	directories to which they point:\n\
\n\
  $XAPPLRESDIR\n\
  $XFILESEARCHPATH\n\
  $XUSERFILESEARCHPATH\n\
\n\
	Also check for this file in your home directory, or in the\n\
	directory called `app-defaults' somewhere under /usr/lib/.

!*strings.8088:%s: couldn't find our resources?\n\
\n\
	This could mean that there is an inappropriate `%s' file\n\
	installed in the app-defaults directory.  Check these environment\n\
	variables and the directories to which they point:\n\
\n\
  $XAPPLRESDIR\n\
  $XFILESEARCHPATH\n\
  $XUSERFILESEARCHPATH\n\
\n\
	Also check for this file in your home directory, or in the\n\
	directory called `app-defaults' somewhere under /usr/lib/.

!*strings.8089:%s: invalid geometry specification.\n\
\n\
 Apparently "%s*geometry: %s" or "%s*geometry: %s"\n\
 was specified in the resource database.  Specifying "*geometry"\n\
 will make %s (and most other X programs) malfunction in obscure\n\
 ways.  You should always use ".geometry" instead.\n

!*strings.8090:%s: unrecognized option "%s"\n

!*strings.8091:%s has detected a %s\n\
file.\n

!*strings.8092:\n\
This may indicate that another user is running\n\
%s using your %s files.\n

!*strings.8093:It appears to be running on host %s\n\
under process-ID %u.\n

!*strings.8094:\n\
You may continue to use %s, but you will\n\
be unable to use the disk cache, global history,\n\
or your personal certificates.\n

!*strings.8095:\n\
Otherwise, you may choose Cancel, make sure that\n\
you are not running another %s Navigator,\n\
delete the %s file, and\n\
restart %s.

!*strings.8096:%s: %s existed, but was not a directory.\n\
The old file has been renamed to %s\n\
and a directory has been created in its place.\n\
\n

!*strings.8097:%s: %s exists but is not a directory,\n\
and we were unable to rename it!\n\
Please remove this file: it is in the way.\n\
\n

!*strings.8098:%s: unable to create the directory `%s'.\n\
%s\n\
Please create this directory.\n\
\n

!*strings.8099:unknown error

!*strings.8100:error creating %s

!*strings.8101:error writing %s

!*strings.8102:This version of %s uses different names for its config files\n\
than previous versions did.  Those config files which still use\n\
the same file formats have been copied to their new names, and\n\
those which don't will be recreated as necessary.\n\
%s\n\
\n\
Would you like us to delete the old files now?

!*strings.8103:\n\
The old files still exist, including a disk cache directory\n\
(which might be large.)

!*strings.8104:The old files still exist.

!*strings.8105:General

!*strings.8106:Passwords

!*strings.8107:Personal Certificates

!*strings.8108:Site Certificates

!*strings.8109:Checked %s (%d left)\n\
%d%% completed)\n\
\n\
Estimated time remaining: %s\n\
(Remaining time depends on the sites selected and\n\
the network traffic.)

!*strings.8110:Checking ... (%d left)\n\
%d%% completed)\n\
\n\
Estimated time remaining: %s\n\
(Remaining time depends on the sites selected and\n\
the network traffic.)

!*strings.8111:Re: 

!*strings.8112:Done checking %d bookmarks.\n\
%d documents were reached.\n\
%d documents have changed and are marked as new.

!*strings.8115:"%s" exited with status %d

!*strings.8116:%s: The Motif keysyms seem not to be defined.\n\
\n\
 This is usually because the proper XKeysymDB file was not found.\n\
 You can set the $XKEYSYMDB environment variable to the location\n\
 of a file which contains the right keysyms.\n\
\n\
 Without the right XKeysymDB, many warnings will be generated,\n\
 and most keyboard accelerators will not work.\n\
\n\
 (An appropriate XKeysymDB file was included with the %s\n\
 distribution.)\n\
\n

!*strings.8117:%s: Some of the Motif keysyms seem not to be defined.\n\
\n\
 This is usually because the proper XKeysymDB file was not found.\n\
 You can set the $XKEYSYMDB environment variable to the location\n\
 of a file which contains the right keysyms.\n\
\n\
 Without the right XKeysymDB, many warnings will be generated,\n\
 and some keyboard accelerators will not work.\n\
\n\
 (An appropriate XKeysymDB file was included with the %s\n\
 distribution.)\n\
\n

!*strings.8118:Visual 0x%02x is a%s %d bit %s visual.\n\
This is not a supported visual; images %s.\n\
\n\
Currently supported visuals are:\n\
\n\
       StaticGray, all depths\n\
        GrayScale, all depths\n\
        TrueColor, depth 8 or greater\n\
        DirectColor, depth 8 or greater\n\
        StaticColor, depth 8 or greater\n\
        PseudoColor, depth 8 only\n\
\n\
If you have any of the above visuals (see `xdpyinfo'),\n\
it is recommended that you start %s with\n\
the `-visual' command-line option to specify one.\n\
\n\
More visuals may be directly supported in the future;\n\
your feedback is welcome.

!*strings.8119:Visual 0x%02x is a%s %d bit %s visual.\n\
This is not a supported visual; images %s.\n\
\n\
Currently supported visuals are:\n\
\n\
       StaticGray, all depths\n\
       GrayScale, all depths\n\
       TrueColor, depth 8 or greater\n\
        StaticColor, depth 8 or greater\n\
        PseudoColor, depth 8 only\n\
\n\
If you have any of the above visuals (see `xdpyinfo'),\n\
it is recommended that you start %s with\n\
the `-visual' command-line option to specify one.\n\
\n\
More visuals may be directly supported in the future;\n\
your feedback is welcome.

!*strings.8120:Visual 0x%02x is a%s %d bit %s visual.\n\
This is not a supported visual; images %s.\n\
\n\
Currently supported visuals are:\n\
\n\
       StaticGray, all depths\n\
        TrueColor, depth 8 or greater\n\
        DirectColor, depth 8 or greater\n\
        StaticColor, depth 8 or greater\n\
        PseudoColor, depth 8 only\n\
\n\
If you have any of the above visuals (see `xdpyinfo'),\n\
it is recommended that you start %s with\n\
the `-visual' command-line option to specify one.\n\
\n\
More visuals may be directly supported in the future;\n\
your feedback is welcome.

!*strings.8121:Visual 0x%02x is a%s %d bit %s visual.\n\
This is not a supported visual; images %s.\n\
\n\
Currently supported visuals are:\n\
\n\
       StaticGray, all depths\n\
        TrueColor, depth 8 or greater\n\
        StaticColor, depth 8 or greater\n\
        PseudoColor, depth 8 only\n\
\n\
If you have any of the above visuals (see `xdpyinfo'),\n\
it is recommended that you start %s with\n\
the `-visual' command-line option to specify one.\n\
\n\
More visuals may be directly supported in the future;\n\
your feedback is welcome.

!*strings.8122:will be\n\
displayed in monochrome

!*strings.8123:will look bad

!*strings.8124:Appearance

!*strings.8125:Bookmarks

!*strings.8126:Colors

!*strings.8127:Fonts

!*strings.8128:Applications

!*strings.8155:Helpers

!*strings.8129:Images

!*strings.8130:Languages

!*strings.8131:Cache

!*strings.8132:Connections

!*strings.8133:Proxies

!*strings.8135:Compose

!*strings.8136:Servers

!*strings.8137:Identity

!*strings.8138:Organization

!*strings.8139:Mail Frame

!*strings.8140:Mail Document

!*strings.8141:Netscape Mail & Newsgroups

!*strings.8142:Netscape Newsgroups

!*strings.8143:Address Book

!*strings.8144:X resources not installed correctly!

!*strings.8145:<< Empty >>

!*strings.8146:error saving password

!*strings.8147:Unimplemented.

!*strings.8148:%s: ~user/ syntax is not allowed in preferences file, only ~/\n

!*strings.8149:%s: unrecognized visual "%s".\n

!*strings.8150:%s: no visual with id 0x%x.\n

!*strings.8151:%s: no visual of class %s.\n

!*strings.8152:\n\
\n\
<< stderr diagnostics have been truncated >>

!*strings.8153:error creating pipe:

!*strings.8156:Outbox folder contains an unsent\n\
message. Send it now?\n

!*strings.8157:Outbox folder contains %d unsent\n\
messages. Send them now?\n

!*strings.8158:The ``Leave on Server'' option only works when\n\
using a POP3 server, not when using a local\n\
mail spool directory.  To retrieve your mail,\n\
first turn off that option in the Servers pane\n\
of the Mail and News Preferences.

!*strings.8159:Back

!*strings.8160:Back in Frame

!*strings.8161:Forward

!*strings.8162:Forward in Frame

!*strings.8163:Please set the $MAIL environment variable to the\n\
location of your mail-spool file.

!*strings.8164:No new messages.

!*strings.8165:User-Defined

!*strings.8166:Other

!*strings.8167:couldn't fork() for external message delivery

!*strings.8168:Cannot read file %s.

!*strings.8169:%s does not exist.

!*strings.8170:%s is a directory.

!*strings.8171:Lock file not found.

!*strings.8172:Can't open Netscape.lock file.

!*strings.8173:Netscape.lock file has been modified.

!*strings.8174:Could not determine lock file size.

!*strings.8175:Could not read Netscape.lock data.

!*strings.8176:Couldn't open animation file.

!*strings.8177:Animation file modified.\n\
Using default animation.

!*strings.8178:Couldn't read animation file size.\n\
Using default animation.

!*strings.8179:Couldn't read number of animation colors.\n\
Using default animation.

!*strings.8180:Couldn't read animation colors.\n\
Using default animation.

!*strings.8181:Couldn't read animation frames.\n\
Using default animation.

!*strings.8182:Ignoring extra bytes at end of animation file.

!*strings.8183:Look for documents that have changed for:

!*strings.8184:Character

!*strings.8185:Link

!*strings.8186:Paragraph

!*strings.8187:Image

!*strings.8188:Refresh Frame

!*strings.8189:Refresh

!*strings.8190:Netscape Mail & Newsgroups: %.900s

!*strings.8191:Netscape Newsgroups: %.900s

!*strings.8192:Netscape: %.900s

!*strings.8193:Protocols

!*strings.8194:Languages

!*strings.8195:Change Password

!*strings.8196:Set Password...

!*strings.8197:No Plugins

!*strings.8198:Continue Movemail

!*strings.8199:Cancel Movemail

!*strings.8200:Netscape will move your mail from %s\n\
to %s/Inbox.\n\
\n\
Moving the mail will interfere with other mailers\n\
that expect already-read mail to remain in\n\
%s.

!*strings.8201:Show this Alert Next Time

!*strings.8202:Netscape Composer: %.900s

!*strings.8203:Netscape

!*strings.8204:Unknown:Prompt User

!*strings.8205:Save To Disk

!*strings.8206:Plug In : %s

!*strings.8207:Mime type cannot be empty.

!*strings.8208:Description|Handled By

!*strings.8209:Can't get new mail; a lock file %s exists.

!*strings.8210:No plugin %s. Reverting to save-to-disk for type %s.\n

!*strings.8211:ERROR: %s\n\
Cant load plugin %s. Ignored.\n

!*strings.8212:Plugin specifies different Description and/or Suffixes for mimetype %s.\n\
\n\
        Description = "%s"\n\
        Suffixes = "%s"\n\
\n\
Use plugin specified Description and Suffixes ?

!*strings.8213:error Saving options.

!*strings.8214:Some values are out of range:

!*strings.8215:The following value is out of range:

!*strings.8216:You can have between 1 and 100 rows.

!*strings.8217:You can have between 1 and 100 columns.

!*strings.8218:For border width, you can have 0 to 10000 pixels.

!*strings.8219:For cell spacing, you can have 0 to 10000 pixels.

!*strings.8220:For cell padding, you can have 0 to 10000 pixels.

!*strings.8221:For width, you can have between 1 and 10000 pixels,\n\
or between 1 and 100%.

!*strings.8222:For height, you can have between 1 and 10000 pixels,\n\
or between 1 and 100%.

!*strings.8223:For width, you can have between 1 and 10000 pixels.

!*strings.8224:For height, you can have between 1 and 10000 pixels.

!*strings.8225:For space, you can have between 1 and 10000 pixels.

!*strings.8226:Please enter a new value and try again.

!*strings.8227:Please enter new values and try again.

!*strings.8228:Enter the text of the link:

!*strings.8229:Linked image:

!*strings.8230:Linked text:

!*strings.8231:No targets in the selected document

!*strings.8232:Link to a named target in the specified document (optional).

!*strings.8233:Link to a named target in the current document (optional).

!*strings.8234:Do you want to remove the link?

!*strings.8235:<unknown>

!*strings.8236:Unopened Tag: '<' was expected

!*strings.8237:Unopened Tag:  '>' was expected

!*strings.8238:Unterminated String in tag: closing quote expected

!*strings.8239:Premature close of tag

!*strings.8240:Tagname was expected

!*strings.8241:Unknown tag error

!*strings.8242:Tag seems ok

!*strings.8243:This document contains frames. Currently the editor\n\
cannot edit documents which contain frames.

!*strings.8244:This document is an about document. The editor\n\
cannot edit about documents.

!*strings.8245:You must save this document locally before\n\
continuing with the requested action.

!*strings.8246:Do you want to save changes to:\n\
%.900s?

!*strings.8247:The error code = (%d).

!*strings.8248:Cannot copy or cut at this time, try again later.

!*strings.8249:Nothing is selected.

!*strings.8250:The selection includes a table cell boundary.\n\
Deleting and copying are not allowed.

!*strings.8251:Empty command specified!

!*strings.8252:No html editor command has been specified in Editor Preferences.\n\
Specify the file argument with %f. Netscape will replace %f with\n\
the correct file name. Example:\n\
             xterm -e vi %f\n\
Would you like to enter a value in Editor Preferences now?

!*strings.8253:Syntax error in action handler: %s

!*strings.8254:Invalid window type for action handler: %s

!*strings.8255:Modified by the Netscape Navigator Administration Kit.\n\
Version: %s\n\
User agent: C

!*strings.8256:Private Mimetype File (%s) has changed on disk.  Discard your unsaved changes\n\
and reload?

!*strings.8257:Private Mailcap File (%s) has changed on disk.  Discard your unsaved changes\n\
and reload?

!*strings.8258:Private Mimetype File (%s) has changed on disk and is being reloaded.

!*strings.8259:Private Mailcap File (%s) has changed on disk and is being reloaded.

!*strings.8260:No image editor command has been specified in Editor Preferences.\n\
Specify the file argument with %f. Netscape will replace %f with\n\
the correct file name. Example:\n\
             xgifedit %f\n\
Would you like to enter a value in Editor Preferences now?

!*strings.8261:You are about to download a remote\n\
document or image.\n\
You should get permission to use any\n\
copyrighted images or documents.

!*strings.8262:The file is marked read-only.

!*strings.8263:The file is blocked at this time. Try again later.

!*strings.8264:The file URL is badly formed.

!*strings.8265:Error opening file for writing.

!*strings.8266:Error writing to the file.

!*strings.8267:Error creating the temporary backup file.

!*strings.8268:Error deleting the temporary backup file.

!*strings.8269:Continue saving document?

!*strings.8270:There was an error while saving the file:\n\
%.900s

!*strings.8271:The new document template location is not set.\n\
Would you like to enter a value in Editor Preferences now?

!*strings.8272:Please enter an autosave period between 0 and 600 minutes.

!*strings.8273:The default browse location is not set.\n\
Would you like to enter a value in Editor Preferences now?

!*strings.8274:Publish destination must begin with "ftp://", "http://", or "https://".\n\
Please enter new values and try again.

!*strings.8275:Image is at a remote location.\n\
Please save image locally before editing.

!*strings.8276:cannot allocate colormap

!*strings.8277:Uploading file to remote server:\n\
%.900s

!*strings.8278:Saving file to local disk:\n\
%.900s

!*strings.8279:Loading image file:\n\
%.900s

!*strings.8280:File %d of %d

!*strings.8281:Source not found.

!*strings.8282:Press Cancel to turn off AutoSave until you\n\
save this document later.

!*strings.8283:All

!*strings.8284:Search

!*strings.8285:New

!*strings.8286:This list shows the accumulated list of new newsgroups since\n\
the last time you pressed the Clear New button.

!*strings.8287:Message Center for %s

!*strings.8288:on local machine.

!*strings.8289:on server.

!*strings.8290:Message:

!*strings.8291:'%s' from %s in %s Folder

!*strings.8292:Netscape Group - [ %s ]

!*strings.8293:Netscape Folder - [ %s ]

!*strings.8299:Size

!*strings.8300:Lines

!*strings.8301:Name

!*strings.8302:Contact

!*strings.8303:Security

!*strings.8304:Conferencing

!*strings.8305:First Name:

!*strings.8306:Last Name:

!*strings.8307:Email Address:

!*strings.8308:Nickname:

!*strings.8309:Notes:

!*strings.8310:Prefers to receive HTML

!*strings.8311:Organization:

!*strings.8312:Title:

!*strings.8313:Address:

!*strings.8314:City:

!*strings.8315:State:

!*strings.8316:Zip:

!*strings.8317:Country:

!*strings.8318:Work:

!*strings.8319:Fax:

!*strings.8320:Home:

!*strings.8321:You do not have a Security Certificate for this person.\n\
\n\
This means that when you send this person email, it cannot be\n\
encrypted. This will make it easier for other people to read your\n\
message.\n\
\n\
To obtain Security Certificates for the recipient(s), they must\n\
first obtain one for themselves and send you a signed email\n\
message. The Security Certificate will automatically be remembered\n\
once it is received.\n

!*strings.8322:You have this person's Security Certificate.\n\
\n\
This means that when you send this person email, it can be encrypted.\n\
Encrypting a message is like sending it in an envelope, rather than a\n\
postcard. It makes it difficult for other people to view your message.\n\
\n\
This person's Security Certificate will expire on %s. When it\n\
expires, you will no longer be able to send encrypted mail to this\n\
person until they send you a new one.

!*strings.8323:This person's Security Certificate has Expired.\n\
\n\
You cannot send this person encrypted mail until you obtain a new\n\
Security Certificate for them. To do this, have this person send you a\n\
signed mail message. This will automatically include the new Security\n\
Certificate.

!*strings.8324:This person's Security Certificate has been revoked. This means that\n\
the Certificate may have been lost or stolen.\n\
\n\
You cannot send this person encrypted mail until you obtain a new\n\
Security Certificate. To do this, have this person send you a signed\n\
mail message. This will automatically include the new Security\n\
Certificate.

!*strings.8325:You do not have a Security Certificate for yourself.\n\
This means that you cannot receive encrypted mail, which would\n\
make it difficult for other people to eavesdrop on messages\n\
sent to you.\n\
\n\
You also cannot digitally sign mail. A digital signature would\n\
indicate that the message was from you, and would also prevent\n\
other people from tampering with your message.\n\
\n\
To obtain a Security Certificate, press the Get Certificate\n\
button. After you obtain a Certificate it will automatically\n\
be sent out with your signed messages so that other people can\n\
send you encrypted mail.

!*strings.8326:You have a Security Certificate.\n\
This means that you can receive encrypted mail. In order to be able to\n\
do this, you must first send mail to a person and sign the message. By\n\
doing so, you send them your certificate, which makes it possible for\n\
them to send you encrypted mail.\n\
\n\
Encrypting a message is like sending it in a envelope, rather than a\n\
postcard. It makes it difficult for other people to eavesdrop on your\n\
message.\n\
\n\
Your Security Certificate will expire on %s. Before it expires,\n\
you will have to obtain a new Certificate.

!*strings.8327:Your Security Certificate has Expired.\n\
\n\
This means that you can no longer digitally sign messages with this\n\
certificate. You can continue to receive encrypted mail, however.\n\
\n\
This means that you must obtain another Certificate. Click on Show\n\
Certificate to do so.

!*strings.8328:Your Security Certificate has been revoked.\n\
This means that you can no longer digitally sign messages with this\n\
certificate. You can continue to receive encrypted mail, however.\n\
\n\
This means that you must obtain another Certificate.

!*strings.8329:Show Certificate

!*strings.8330:Get Certificate

!*strings.8331:Mailing List Info

!*strings.8332:List Name:

!*strings.8333:List Nickname:

!*strings.8334:Description:

!*strings.8335:Type names or drag addresses into the mailing list below:

!*strings.8336:Name

!*strings.8337:

!*strings.8338:Email Address

!*strings.8339:Nickname

!*strings.8340:Organization

!*strings.8341:City

!*strings.8342:State

!*strings.8343:%d Unread, %d Total

!*strings.8344:Search

!*strings.8345:Stop

!*strings.8346:Remove

!*strings.8347:This message will be sent to:

!*strings.8348:all

!*strings.8349:1 month ago

!*strings.8350:Attachment operation cannot be completed now.\n\
Message delivery or attachment load is in progress.

!*strings.8351:This item is already attached:\n\
%s

!*strings.8352:Attachment panel is full - no more attachments can be added.

!*strings.8353:Getting new messages...

!*strings.8354:Address Book - %s

!*strings.8355:Show Certificate

!*strings.8356:Order

!*strings.8357:Language

!*strings.8358:Filters will be applied to incoming mail in the\n\
following order:

!*strings.8359:To call another person using Netscape Conference, you must first\n\
choose the server you would like to use to look up that person's\n\
address.

!*strings.8360:Netscape Conference DLS Server

!*strings.8361:Specific DLS Server

!*strings.8362:Hostname or IP Address

!*strings.8363:Address:

!*strings.8364:(For example, %s)

!*strings.8365:Card for <%s>

!*strings.8366:New Card

!*strings.8367:Mark Messages Read

!*strings.8368:Mark messages read up to: (MM/DD/YY)

!*strings.8369:The date must be valid,\n\
and must be in the form MM/DD/YY.

!*strings.8370:There are %d new message headers to download for\n\
this newsgroup.

!*strings.8371:Get Next %d Messages

!*strings.8372:unread

!*strings.8373:yesterday

!*strings.8374:1 week ago

!*strings.8375:2 weeks ago

!*strings.8376:6 months ago

!*strings.8377:1 year ago

!*strings.8378:An Address Book entry with this name and email address already exists.

!*strings.8379:Mailing lists can only contain entries from the Personal Address Book.\n\
Would you like to add %s to the address book?

!*strings.8380:Make sure both the server name and port are filled in and are valid.

!*strings.8381:unknown

!*strings.8382:To:

!*strings.8383:CC:

!*strings.8384:BCC:

!*strings.8385:Type Name

!*strings.8386:Next %d

!*strings.8387:This document cannot be attached to a message:\n\
%s

!*strings.8388:Netscape Communicator cannot find your\n\
Personal Card. Would you like to create a\n\
Personal Card now?

!*strings.8389:Communicator Message Center for %s

!*strings.8390:Plain

!*strings.8391:Bold

!*strings.8392:Italic

!*strings.8393:Bold Italic

!*strings.8394:Normal

!*strings.8395:Bigger

!*strings.8396:Smaller

!*strings.8397:Sent

!*strings.8398:Message has not been sent. Do you want to\n\
save the message in the Drafts Folder?

!*strings.8399:Invalid Date Value. No search is performed.

!*strings.8400:Invalid value for the MONTH field.\n\
Please enter month in 2 digits (1-12).\n\
Try again!

!*strings.8401:Invalid value for the DAY of the month field.\n\
Please enter date in 2 digits (1-31).\n\
Try again!

!*strings.8402:Invalid value for the YEAR field.\n\
Please enter year in 4 digits (e.g. 1997).\n\
Year value has to be 1900 or later.\n\
Try again!

!*strings.8403:To:

!*strings.8404:Cc:

!*strings.8405:Bcc:

!*strings.8406:Newsgroup:

!*strings.8407:Reply-To:

!*strings.8408:Followup-To:

!*strings.8414:Address

!*strings.8415:Attachment

!*strings.8416:Option

!*strings.8417:OK

!*strings.8418:Clear

!*strings.8419:Cancel

!*strings.8420:Urgent

!*strings.8421:Important

!*strings.8422:Normal

!*strings.8423:FYI

!*strings.8424:Junk

!*strings.8425:Priority

!*strings.8426:%sLabel

!*strings.8427:Addressing

!*strings.8428:Attachment

!*strings.8429:Compose

!*strings.8430:All Mail Folders

!*strings.8431:All Groups

!*strings.8432:LDAP Directory

!*strings.8433:Location

!*strings.8434:Subject

!*strings.8435:Sender

!*strings.8436:Date

!*strings.8437:Preparing file to publish:\n\
%.900s

!*strings.8438:Name

!*strings.8439:Location

!*strings.8440:Last Visited

!*strings.8441:Last Modified

!*strings.8442:Name

!*strings.8443:Total

!*strings.8444:Unread

!*strings.8445:Category

!*strings.8446:Newsgroup name

!*strings.8447:Messages

!*strings.8448:Subject

!*strings.8449:Date

!*strings.8450:Priority

!*strings.8451:Status

!*strings.8452:Sender

!*strings.8453:Recipient

!*strings.8454:File Here

!*strings.8455:Registering Converters

!*strings.8456:Initializing Security Library

!*strings.8457:Initializing Network Library

!*strings.8458:Initializing Message Library

!*strings.8459:Initializing Image Library

!*strings.8460:Initializing Javascript

!*strings.8461:Initializing Plugins

!*strings.8462:%s: installColormap: %s must be yes, no, or guess.\n

!*strings.8463:Communicator Bookmarks for %s

!*strings.8464:Untitled

!*strings.8465:Unchecking this option means that this group\n\
and all newsgroups above it do not\n\
receive HTML messages

!*strings.8466:Encrypted

!*strings.8467:None

!*strings.8468:Show Column

!*strings.8469:Hide Column

!*strings.8470:That functionality has been disabled

!*strings.8471:file: Untitled

!*strings.8472:%s is not set.\n

!*strings.8473:Newsgroups directory

!*strings.8474:Local mail directory

!*strings.8475:%s "%.255s" does not exist.\n

!*strings.8476:No matches found

!*strings.8477:Please enter a valid email address (e.g. user@internet.com).\n

!*strings.8478:Communicator History for %s

!*strings.8479:Title

!*strings.8480:Location

!*strings.8481:First Visited

!*strings.8482:Last Visited

!*strings.8483:Expires

!*strings.8484:Visit Count

!*strings.8485:Place a call with Netscape Conference to 

!*strings.8486:Send a message to 

!*strings.8487:Default Inbox folder does not exist.\n\
You will not be able to get new messages!

!*strings.8488:telnet

!*strings.8489:TN3270 application

!*strings.8490:rlogin

!*strings.8491:rlogin with user

!*strings.8492:You cannot delete this application from the preferences.

!*strings.8493:The application field is not set.

!*strings.8494:[JavaScript Application]

!*strings.8495:The preferences you have, version %s, is incompatible with the\n\
current version %s. Would you like to save new preferences now?

!*strings.8496:Please be aware that the preferences you have, version %s,\n\
is incompatible with the current version %s.

!*strings.8497:%s: program is version %s, but resources are version %s.\n\
\n\
	This means that there is an inappropriate `%s' file installed\n\
	in the app-defaults directory.  Check these environment variables\n\
	and the directories to which they point:\n\
\n\
	$XAPPLRESDIR\n\
	$XFILESEARCHPATH\n\
	$XUSERFILESEARCHPATH\n\
\n\
	Also check for this file in your home directory, or in the\n\
	directory called `app-defaults' somewhere under /usr/lib/.

!*strings.8498:%s: couldn't find our resources?\n\
\n\
	This could mean that there is an inappropriate `%s' file\n\
	installed in the app-defaults directory.  Check these environment\n\
	variables and the directories to which they point:\n\
\n\
	$XAPPLRESDIR\n\
	$XFILESEARCHPATH\n\
	$XUSERFILESEARCHPATH\n\
\n\
	Also check for this file in your home directory, or in the\n\
	directory called `app-defaults' somewhere under /usr/lib/.

!*strings.8499:%s: locale `%s' not supported by Xlib; trying `C'.\n

!*strings.8500:%s: locale `C' not supported.\n

!*strings.8501:%s: locale `C' not supported either.\n

!*strings.8502:\n\
	If the $XNLSPATH directory does not contain the proper config files,\n\
	%s will crash the first time you try to paste into a text\n\
	field.  (This is a bug in the X11R5 libraries against which this\n\
	program was linked.)\n\
\n\
	Since neither X11R4 nor X11R6 come with these config files, we have\n\
	included them with the %s distribution.  The normal place\n\
	for these files is %s.\n\
    If you can't create that\n\
	directory, you should set the $XNLSPATH environment variable to\n\
	point at the place where you installed the files.\n\
\n

!*strings.8503:	Perhaps the $XNLSPATH environment variable is not set correctly?\n

!*strings.8504: uname failed

!*strings.8505:%s: uname() failed; can't determine what system we're running on\n

!*strings.8506:%s: this is a SunOS 4.1.3 executable, and you are running it on\n\
	SunOS %s (Solaris.)  It would be a very good idea for you to\n\
	run the Solaris-specific binary instead.  Bad Things may happen.\n\
\n

!*strings.8507:%s: failed to initialize mozilla_event_queue!\n

!*strings.8508:%s: invalid `-remote' option "%s"\n

!*strings.8509:%s: the `-id' option must come before all `-remote' options.\n

!*strings.8510:%s: only one `-id' option may be used.\n

!*strings.8511:%s: invalid `-id' option "%s"\n

!*strings.8512:%s: the `-id' option may only be used with `-remote'.\n

!*strings.8513:%s: warning: $XKEYSYMDB is %s,\n\
	but that file doesn't exist.\n

!*strings.8514:%s: warning: no XKeysymDB file in either\n\
	%s, %s, or %s\n\
	Please set $XKEYSYMDB to the correct XKeysymDB file.\n

!*strings.8515:%s: not found in PATH!\n

!*strings.8516:renaming %s to %s:

!*strings.8517:%s: usage: OpenURL(url [ , new-window|window-name ] )\n

!*strings.8518:%s: usage: OpenFile(file)\n

!*strings.8519:%s: usage: print([filename])\n

!*strings.8520:%s: usage: SaveAS(file, output-data-type)\n

!*strings.8521:%s: usage: SaveAS(file, [output-data-type])\n

!*strings.8522:%s: usage: mailto(address ...)\n

!*strings.8523:%s: usage: find(string)\n

!*strings.8524:%s: usage: addBookmark(url, title)\n

!*strings.8525:%s: usage: htmlHelp(map-file, id, search-text)\n

!*strings.8526:%s: unparsable encoding filter spec: %s\n

!*strings.8527:Upload File

!*strings.8528:error saving options

!*strings.8529:# Netscape User History File\n\
# Version: %s\n\
# This is a generated file!  Do not edit.\n\
\n

!*strings.8530:%s: too many args (%d) to ActivateLinkAction()\n

!*strings.8531:%s: unknown parameter (%s) to ActivateLinkAction()\n

!*strings.8532:file:///Untitled

!*strings.8533:printing

!*strings.8534:\n\
This is the default visual and color map.

!*strings.8535:\n\
This is the default visual with a private map.

!*strings.8536:\n\
This is a non-default visual.

!*strings.8537:from network

!*strings.8538:from disk cache

!*strings.8539:from memory cache

!*strings.8540:default

!*strings.8541:%s: too few args (%d) to HistoryItem()\n

!*strings.8542:%s: too many args (%d) to HistoryItem()\n

!*strings.8543:%s: unknown parameter (%s) to HistoryItem()\n

!*strings.8544:%s: unable to read %s property\n

!*strings.8545:%s: invalid data on %s of window 0x%x.\n

!*strings.8546:509 internal error: unable to translatewindow 0x%x to a widget

!*strings.8547:500 unparsable command: %s

!*strings.8548:501 unrecognized command: %s

!*strings.8549:502 no appropriate window for %s

!*strings.8550:200 executed command: %s(

!*strings.8551:200 executed command: %s(

!*strings.8552:%s: windowGravityWorks: %s must be yes, no, or guess.\n

!*strings.8553:could not dup() a stderr:

!*strings.8554:could not fdopen() the new stderr:

!*strings.8555:could not dup() a new stderr:

!*strings.8556:could not dup() a stdout:

!*strings.8557:could not fdopen() the new stdout:

!*strings.8558:could not dup() a new stdout:

!*strings.8559:\n\
%s:\n\
\n\
This Netscape Communicator binary does not run on %s %s.\n\
\n\
Please visit http://home.netscape.com/ for a version of Communicator that runs\n\
on your system.\n\
\n

!*strings.8560:Created On

!*strings.8563:Netscape Exit Confirmation\n

!*strings.8564:Close all windows and exit Netscape?\n

!*strings.8565:Netscape Mail\n

!*strings.8566:Outbox folder contains unsent messages\n\
Send them now?

!*strings.8567:Your POP user name is just your user name (e.g. user),\n\
not your full POP address (e.g. user@internet.com).

!*strings.8568:Please enter valid information.

!*strings.8569:The editing of JavaScript message filters is not available\n\
in this release of Communicator.

!*strings.8570:Phone

!*strings.8571:Cleaning up news messages...

!*strings.8572:Your font preferences will not take effect until you restart Communicator.

!*strings.8573:One or more items in the selection you are dragging do not contain an email address\n\
and was not added to the list. Please make sure each item in your selection includes\n\
an email address.

!*strings.8574:New Folder Name:

!*strings.8575:       -component-bar            Show only the Component Bar.\n\
\n\
       -composer                 Open all command line URLs in Composer.\n\
       -edit                     Same as -composer.\n\
\n\
       -messenger                Show Messenger Mailbox (INBOX).\n\
       -mail                     Same as -messenger.\n\
\n\
       -discussions              Show Collabra Discussions.\n\
       -news                     Same as -discussions.\n\
\n

!*strings.8576:       Arguments which are not switches are interpreted as either files or\n\
       URLs to be loaded.\n\
\n

!*strings.8577:Searching:

!*strings.8578:Search Results

!*strings.8579:Search results for:

!*strings.8580:Name

!*strings.8581:Email

!*strings.8582:Organization

!*strings.8583:Department

!*strings.8584:Search results will appear in address book window

!*strings.8585:Basic Search

!*strings.8586:Advanced Search

!*strings.8587:More

!*strings.8588:Fewer

!*strings.8589:Find items which

!*strings.8590:Match all items below (And)

!*strings.8591:Match one or more of the items below (Or)

!*strings.8592:where

!*strings.8593:

!*strings.8594:and

!*strings.8595:or

!*strings.8596:Description:

!*strings.8597:LDAP Server:

!*strings.8598:Server Root:

!*strings.8599:Port Number:

!*strings.8600:Maximum Number of Hits:

!*strings.8601:Secure

!*strings.8602:Save Password

!*strings.8603:Directory Info

!*strings.8604:Directories

!*strings.8605:Search...

!*strings.8606:Custom Header:

!*strings.8607:Display Name:

!*strings.8608:Pager:

!*strings.8609:Cellular:

!*strings.8610:Cannot drop into the targeted destination folder.

!*strings.8611:Login with name and password

!*strings.8612:No spellchk library found

!*strings.8613:Choose where you would like your %s messages to be stored:

!*strings.8614:Place a copy in folder: '%s' on '%s'

!*strings.8615:Folder '%s' on

!*strings.8616:Keep templates in: '%s' on '%s'

!*strings.8617:Keep drafts in: '%s' on '%s'

!*strings.8618:BCC: %s

!*strings.8619:General

!*strings.8620:Advanced

!*strings.8621:IMAP

!*strings.8622:Sharing

!*strings.8623:This server does not support shared folders

!*strings.8624:You have the following permissions:

!*strings.8625:Share this and other folders with network users \n\
        and display and set access privileges.

!*strings.8626:Folder Type:

!*strings.8627:POP

!*strings.8628:start my reply above the quoted text

!*strings.8629:start my reply below the quoted text

!*strings.8630:select the quoted text

!*strings.8631: (default)

!*strings.8632:Inline

!*strings.8633:Quoted

!*strings.8634:As Attachment

!*strings.8635:Automatically subscribe to all my folders on "%s"

!*strings.8636:MoveMail

!*strings.8637:(Using Movemail)

!*strings.8638:Automatically

!*strings.8639:Ask me

!*strings.8640:Never Send

!*strings.8641:Reply To:

!*strings.8642:multiple matches found

!*strings.8643:%m/%d/%Y

!*strings.8644:The mail filter named '%s' has been truncated because it had more than %d terms.

!*strings.8645:Invalid Date Value.

!*strings.8646:Department:

!*strings.8647:You must pick a file that exists.

!*strings.8648:You are not allowed to choose a directory.

!*strings.8649:Match all items below (And):

!*strings.8650:Download headers for: %s

!*strings.8651:Unable to access directory:\n\
%s\n

!*strings.8652:Ask Me

!*strings.8653:Text

!*strings.8654:HTML

!*strings.8655:Text and HTML

!*strings.8656:Sorry, help is not available for this topic.

!*strings.8657:(None available)

!*strings.8658:Compact Folders

!*strings.8659:Compact This Folder

!*strings.8660:Empty Trash on %s

!*strings.8661:Empty Trash Folder

!*strings.8662:If the message comes from outside the\n\
domain %s:

!*strings.8663:(no domain)

!*strings.8664:Addresses Matching "%s"

!*strings.8665:Select Addresses

!*strings.8666:Mailing List

!*strings.8667:Folder name

!*strings.8668:Delete Mail Server

!*strings.8669:Delete Folders

!*strings.8670:AddressBook Info

!*strings.8671:Name:

!*strings.8672:Basic Search

!*strings.8673:Advanced Search

!*strings.8674:URL:

!*strings.8675:Go

!*strings.8676:Properties

!*strings.8677:Get Info

!*strings.8678:Location: %s

!*strings.8679:No matches

!*strings.8680:

!*strings.8681:

!*strings.8682:

!*strings.8683:

!*strings.8684:

!*strings.8685:Please enter some text for your search and try again.

!*strings.8686:Please enter a valid date for your search and try again.

