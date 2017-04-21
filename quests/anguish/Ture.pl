##A_chest 317003 needed for global flag##
sub EVENT_DEATH {
quest::setglobal("FTure", 1, 5, "F");
$client->Message(14,"You recieve a character flag!");
}