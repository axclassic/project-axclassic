sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("SNORT!  HHUUUUCCCKSSH..  Peh!  You speak at Kaglari. High Priestess of Dark Ones.  Children of Hate.  Spawn of Innoruuk.  $name . speak or be gone!  SNORT!  You [wish majik power]?"); }
if($text=~/power/i){quest::say("GOOD!  <SNORT!!>  Innoruuk needs more childrens.  You show majik skill or I give you to Innoruuk.  You bring two froglok tadpole fleshes and two bone chips ..<SNORT>..  from old bones.  I teach you majik.  GO!  <SNORT!!>"); }
}
sub EVENT_ITEM { 
	if ($item1=="18791"){quest::say("Good.. Kaglari need you help.. Kaglari teach you majik now.");
quest::summonitem("13530");
quest::ding(); quest::exp("100"); }
}
#END of FILE Zone:grobb  ID:40026 -- Kaglari 

