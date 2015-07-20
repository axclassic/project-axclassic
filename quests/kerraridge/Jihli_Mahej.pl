sub EVENT_SAY {
my $special = quest::saylink("special", 1);
if($text=~/Hail/i){
quest::say("Hello $name, are you just browsing?, or is there something $special you need?");
}
if($text=~/special/i){
quest::say("Oh! Something was ordered? Do you have the receipt?");
}
}
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,5954 => 1)){
quest::say("There seems to be a small problem with this order, it seems that it got broken in shipping and since you are not the one who purchased it, I can not offer a refund and getting a replacement would take weeks.")
quest::say(" The best thing I can offer since Gawfed needs it today is to give you the broken pieces and let you take it to Chogar. I am sure he can fix it up good as new.");
quest::summonitem(5955);
}
}
#END of FILE Zone:sharvahl  ID:155263 -- Jihli_Mahej 

