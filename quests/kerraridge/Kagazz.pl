sub EVENT_SAY {
my $need = quest::saylink("need", 1);
if($text=~/Hail/i){
quest::say("Hail to you citizen. did you $need something from me?");
}
if($text=~/need/i){
quest::say("I am sorry but unless you have an Acrylica Slate, I can not do business with you... Kings rules.");
}
}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount,2877 =>1 )){
quest::say("My wife is making some jewelry. Not the sparkly stuff. mind you. She is nearly blind so appearance means little to her. She is intent on making jewelry with a more. uhh. natural feel. Currently she's constructing a special scorpion leg necklace. and is in need of more scorpion legs. I can't leave the shop so I need your help. Fill this box with scorpion legs and I'll pay you with forged fasteners that any merchant will gladly buy.");
quest::summonitem(2877);
quest::summonitem(17238);
}
elsif(plugin::check_handin(\%itemcount,3676 =>1 )){
quest::say("Thank you $name, as promised here is your forged fasteners.");
quest::summonitem(3667);
}
}
#END of FILE Zone:sharvahl  ID:155279 -- Kagazz 

