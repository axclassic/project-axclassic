## Betrayal Armor Quest ##
## Part 2 Sends you into Betrayal ##
## 4/13/2013 ##

sub EVENT_SAY{
 if ($text =~ /Hail/i && $ulevel >= 65){
     quest::say("Necklace, Betrayed so betrayed, so many needs, so lost so so so...");
}
else {
        $client->Message(14,"Me no, so, not now, No No Nooooooo");
        plugin::return_items(\%itemcount);
	    return 1;
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 119783 => 1)) {
        $client->Message(14,"BETRAYAL! You have no idea of the state of betrayal. No No you don't but yes, yes, you will now");
    quest::movepc(277, -188, 288, 6.03);
    return 1;
 }

else {
        $client->Message(14,"Your like the rest of them! Go Away!");
        plugin::return_items(\%itemcount);
	    return 1;
 }
}
