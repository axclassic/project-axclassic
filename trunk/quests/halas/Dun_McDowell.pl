sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Hail $name, I am Dun McDowell, leader or the White Rose guild. Don't turn ye back on any of us, the result could be costly for ye."); }
}
sub EVENT_ITEM { 
 if($itemcount{18762} == 1){
	quest::say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes.");
	quest::say("Here is your tunic $name, wear it proudly young rouge!");
	quest::summonitem(13513);
	quest::ding();
    quest::faction(275, 10);    #rogues of the white rose
    quest::exp(1000);
 }
else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
 }
#END of FILE Zone:halas  ID:29069 -- Dun_McDowell 
