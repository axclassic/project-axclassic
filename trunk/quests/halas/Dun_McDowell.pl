sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}
sub EVENT_ITEM { 
 if($itemcount{18762} == 1){
	quest::say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes.");
	quest::summonitem(13513);
	quest::ding();
    quest::faction(275, 10);    #rogues of the white rose
    quest::exp(100);
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:halas  ID:29069 -- Dun_McDowell 
