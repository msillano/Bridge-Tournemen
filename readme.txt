'GioBridge Tournaments': Installation

Configurations:
- Players use their smartphones (PCs, tablets) to log in and see the results (guest mode).
- To program matches, score points, etc. a password is required (user mode).

- Local access: via open WiFi (web-server on during use hours)
- Global access via the Internet: use a router and a free dynamic DNS service,
     for example: https://www.noip.com/
     note: I have both the development PC (windows) and the web-server (top-box) in LAN.
     By configuring a router NAT I have global access to the web-server at port 8880,
     with a domain provided by noip. (web-server on 24/7).
 
 preconditions:
HW:
 - web-server: Linux, Win, Android ...
   The cheapest solution: a dedicated Android Top-box TV (with screen and USB keyboard only during installation).
   I use "MXQ 4K * 2K 1080P Smart TV BOX XBMC / Kodi H.265 Android 4.4.2 Quad Core WiFi 8GB Mini PC"
   (€ 29.78). AC consumption: 20 W.
 - In LAN (also WiFi) with a development PC / laptop. Internet access and router required
   only for: global access, sending emails with results, Shinystat.

SW:
- Apache + php + Mysql (WAMP, LAMP, Palapa etc. free), php ver. 5.5 +
- PhpMyAdmin (install a compatible version if not present, free)
- Useful a FTP-server (if the web-server is dedicated, as in the case of top-box, free)
- To send emails, it may be necessary to install 'sendmail' (linux, windows, andoid) free.
        note: 'sendmail' is included on the Android server I use
        ('Bit Web Server' by Andi UnpamTools, unfortunately not longer updated)
        Use 'phpinfo' to get information on the installed php configuration.

=======================
 Installation:
1) verify correct operation of the FTP server (optional) for example with the client 'winSCP.exe' (free)
  Subsequent operations can all be done conveniently via FTP + winSCP.
2) phpMyAdmin: (can be installed via FTP) check login username and password.
3) Using phpMyAdmin create the 'bridge' DB by importing the bridge.sql file
4) Unzip bridge.zip and copy dir and files to www / bridge /    (or as requested by the server).
    WIFI URL: http: // <IP-WebServer> [: <local_port>] / bridge    (web port default 80)
    Internet URL: http: // <noip_domain> [: <Nat_port>] / bridge

 Configuration:
5) Access DB - 2 options: common_mysql.php (obsolete) and common_pdo.php
       => copy the chosen solution to 'common_use.php'.
6) Edit: 'common_use.php' where indicated for username, password etc.

 Internationalization:
7) messages - 2 options: stringIT.php, stingEN.php
       => copy the desired language into 'string_use.php'.
       note: it is easy to create stringXX.php files for other languages.
   Help: HTML, only in Italian :( (a translation can be done by the browser).

 Shinystat:
8) all pages also contain the code required by Shinystat (commented).
   If you wish to have access statistics: 
     1) subscribe to https://www.shinystat.com (free)
     2) Change the USER value and remove the comments from the code at the foot of the page.
