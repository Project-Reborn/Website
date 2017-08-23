; <?php die( 'Do not access this page directly.' ); ?>

      ; This is the Flysplay configuration file. It contains the basic settings
      ; needed for Flyspray to operate. All other preferences are stored in the
      ; database itself and are managed directly within the Flyspray admin interface.
      ; You should consider putting this file somewhere that isn't accessible using
      ; a web browser, and editing header.php to point to wherever you put this file.
[database]
dbtype = "mysqli"
dbhost = "localhost"
dbname = "bugtracker"
dbuser = "root"
dbpass = "ascent"
dbprefix = "cms_"


[general]
cookiesalt = "c68719da828c5f6b12a81a2734c82a2f"			; Randomisation value for cookie encoding
output_buffering = "on"				; Available options: "on" or "gzip"
passwdcrypt = ""         ; Available options: "" which chooses best default (coming FS1.0: using crypt/password_hash() with blowfish), "crypt" (auto salted md5), "md5",  "sha1" Note: md5 and sha1 are considered insecure for hashing passwords, avoid if possible.
dot_path = "" ; Path to the dot executable (for graphs either dot_public or dot_path must be set)
dot_format = "png" ; "png" or "svg"
reminder_daemon = "0"		; Boolean. 0 = off, 1 = on (cron job), 2 = on (PHP).
doku_url = "http://en.wikipedia.org/wiki/"      ; URL to your external wiki for [[dokulinks]] in FS
syntax_plugin = "dokuwiki" ; Plugin name for Flyspray's syntax (use any non-existing plugin name for default syntax)
update_check = "1"                               ; Boolean. 0 = off, 1 = on.


[attachments]
zip = "application/zip" ; MIME-type for ZIP files


[oauth]
; These are only needed if you plan to use them. You can turn them on in the admin panel.


github_secret = ""
github_id = ""
github_redirect = "YOURDOMAIN/index.php?do=oauth&provider=github"
google_secret = ""
google_id = ""
google_redirect = "YOURDOMAIN/index.php?do=oauth&provider=google"
facebook_secret = ""
facebook_id = ""
facebook_redirect = "YOURDOMAIN/index.php?do=oauth&provider=facebook"
microsoft_secret = ""
microsot_id = ""
microsoft_redirect = "YOURDOMAIN/index.php"