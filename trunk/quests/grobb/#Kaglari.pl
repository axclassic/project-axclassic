sub EVENT_SAY { 
my $power = quest::saylink("power", 1);
if($text=~/Hail/i) {
quest::say("SNORT!  HHUUUUCCCKSSH..  Peh!  You speak at Kaglari. High Priestess of Dark Ones.  Children of Hate.  Spawn of Innoruuk.  $name . speak or be gone!  SNORT!  You wish majik $power?"); 
}
if($text=~/power/i) {
quest::say("GOOD!  <SNORT!!>  Innoruuk needs more childrens.  You show majik skill or I give you to Innoruuk.  You bring two froglok tadpole fleshes and two bone chips ..<SNORT>..  from old bones.  I teach you majik.  GO!  <SNORT!!>"); 
}
if($text=~/help/i) {
quest::say("Kaglari knows someone who can help, go find Bregna in Neriak. Tell her youz help Innoruuk.");
}
}
sub EVENT_ITEM { 
my $help = quest::saylink("help", 1);
if (plugin::check_handin(\%itemcount, 18791 => 1)) {
    quest::say("Good.. Kaglari need you help.. Kaglari teach you majik now.");
    quest::summonitem(13529);
    quest::faction(70,10); #Dark Ones
	quest::faction(292,10); #Shadowknights of Night Keep
	quest::faction(106,-30); #Frogloks of Guk
    quest::ding();
	quest::exp(1000);
	quest::rebind(52,68.4,76.1,2.2)
 }
elsif (plugin::check_handin(\%itemcount, 13187 => 2 &&  13073 => 2)){ #Handin: 2x Froglok Tadpole Flesh & 2x Bone Chip
    quest::say("SNORT!! Good. Innoruuk get special gift. Not you, dis time. Here. Learning majik wid dis. You more want $help Innoruuk?"); 
    quest::faction(70,10); #Dark Ones
	quest::faction(292,10); #Shadowknights of Night Keep
	quest::faction(106,-30); #Frogloks of Guk
    quest::ding();
    quest::exp(500);
	
 }
else {
    plugin::try_tome_handins(\%itemcount, $class, 'Shaman');
    quest:say("Me can not eat this... Take back!");
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:grobb  ID:40026 -- Kaglari 

