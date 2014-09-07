===EQEmu In-Game Mail Server===

The EQEmu mail server is called 'mailserver', surprisingly enough. It runs as a separate process to world and zone and communicates directly with the EQ client.

To setup the mailserver, you must have a <mailserver> block in your eqemu_config.xml

E.g. If you want to run the mailserver on the computer with IP address 192.168.1.100, and want it to use UDP port 10235, your config would look like this:

<mailserver>
	<host>192.168.1.100</host>
	<port>10235</port>
</mailserver>

The defaults are:

<mailserver>
	<host>channels.eqemulator.net</host>
	<port>7779</port>
</mailserver>

You can leave the port at the default value of 7779, if you have no other programs using that port, but you **must** change the host address.

Note that this config portion must sit within the <server> config block.

The SQL required consists of a table:

CREATE TABLE `mail` (
  `msgid` int(10) unsigned NOT NULL auto_increment,
  `charid` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL default '0',
  `from` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `to` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY  (`msgid`),
  KEY `charid` (`charid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

and a column in the character_ table:

ALTER TABLE `character_` ADD `mailkey` CHAR( 16 ) NOT NULL ;

The following rules govern the operation of the mail system:

RULE_BOOL ( Mail, EnableMailSystem, true) // If false, client won't bring up the Mail window.
RULE_INT ( Mail, ExpireTrash, 0) // Time in seconds. 0 will delete all messages in the trash when the mailserver starts
RULE_INT ( Mail, ExpireRead, 31536000 ) // 1 Year. Set to -1 for never
RULE_INT ( Mail, ExpireUnread, 31536000 ) // 1 Year. Set to -1 for never

If Mail:EnableMailSystem is set to false, the client will not be able to bring up the mail window, and the mailserver will exit if you try to start it.

On startup, mail will be deleted according to the three Expiration rules, so with the defaults shown above, all mail in the 'Trash' folder will be deleted each time the mailserver starts up. Read and Unread mail will be deleted one year after being sent.

Expiration is done only when the mailserver first starts.

The following log categories are available for use in log.ini

LOG_CATEGORY( MAIL )
LOG_TYPE( MAIL, INIT, ENABLED )
LOG_TYPE( MAIL, ERROR, ENABLED )
LOG_TYPE( MAIL, CLIENT, DISABLED )
LOG_TYPE( MAIL, TRACE, DISABLED )
LOG_TYPE( MAIL, PACKETS, DISABLED)

By default, no messages will be produced unless an error occurs. When first implementing the mail server, you may like to enable ""MAIL__CLIENT"" and ""MAIL__TRACE"". This will produce messages as clients connect and disconnect to the mail server, and as messages are sent and retrieved, etc.

**{{color c="red" text="Note that the Server Operator, and anybody they grant access to the database CAN READ ALL MAIL sent through the system. For this reason, players should not use in-game mail for the exchange of sensitive information. It is the responsibility of the Server Operator to ensure their players know this."}}**

The mailserver uses a different set of Opcodes than world or zone. These are stored in a file called mail_opcodes.conf which should be placed in the same directory as your world/zone/eqlaunch/mailserver executables. A copy of mail_opcodes.conf is provided in the utils directory of the distribution. For reference, it contains:

#Mail opcodes
OP_MailLogin=0x01
OP_Mail=0x02
OP_MailSendHeaders=0x00
OP_MailSendBody=0x0f
OP_MailDeliveryStatus=0x12
OP_MailboxChange=0x14
OP_MailNew=0x10

Once you have your database, rules, log settings and mail_opcodes.conf all setup, the next step is to start the mailserver executable.

You should get output similar to the following:

%%
[Debug] Starting Log: logs/eqemu_debug_mail.log
[Debug] [RULES__CHANGE] Resetting running rules to default values
[Debug] [MAIL__INIT] Starting EQEmu MailServer
[Debug] [MAIL__INIT] Log settings loaded from log.ini
[Debug] [MAIL__INIT] Connecting to MySQL...
[Status] Starting Log: logs/eqemu_mail.log
[Status] Using database 'ykesha' at localhost:3306
[Debug] [RULES__CHANGE] Loading rule set 'default' (1)
[Debug] [RULES__CHANGE] <Lots of these lines>
[Debug] [MAIL__INIT] Loaded default rule set 'default'
[Debug] [MAIL__INIT] Expiring mail...
[Debug] [MAIL__INIT] There are 0 messages in the database.
[Debug] [MAIL__INIT] Expired 0 trash messages.
[Debug] [MAIL__INIT] Expired 0 read messages.
[Debug] [MAIL__INIT] Expired 0 unread messages.
[Debug] [MAIL__INIT] Client (UDP) Mail listener started on port 10235.
[Debug] [COMMON__THREADS] Starting EQStreamFactoryWriterLoop with thread ID -1223365728
[Debug] [COMMON__THREADS] Starting EQStreamFactoryReaderLoop with thread ID -1214973024
%%

If you have the default logging levels, no more messages will be produced unless an error occurs.

If you have ""MAIL__CLIENT"" logging set to on, you will see messages each time a player connects and disconnects:

%%
[Debug] [MAIL__CLIENT] New Client UDP Mail connection from 192.168.1.50:62302
[Debug] [MAIL__CLIENT] New Client UDP Mail connection from 192.168.1.50:61162
[Debug] [MAIL__CLIENT] Client connection from 192.168.1.50:62302 closed.
%%

Note that the client disconnects and reconnects to the mailserver each time they zone.

You can stop the mailserver at anytime. Doing so, or if it should crash, will not cause any problems to your world or zone processes, nor to the clients themselves, other than that they will no longer be able to use in-game mail. If the mailserver is stopped and restarted, players must zone before their clients will reconnect to the mailserver and become able to use the mail system again.

If ""MAIL__TRACE"" is enabled, you will see further debugging information, e.g. when a client requests mail headers, a mail body, or when they send an email.

All email addresses are prefixed with SOE.EQ.<your server shortname>. It is not possible to send emails between different EQEmu servers, nor between an EQEmu server and an Internet email address. Technically, both of these could be done with further development work.

----
CategoryServer
