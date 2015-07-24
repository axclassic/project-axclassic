sub EVENT_SAY { 
my $camp = quest::saylink("camp", 1);
my $glowing = quest::saylink("glowing", 1);
    if($text=~/Hail/i){
     quest::say("Greetings $name, what brings you to the battlegrounds? Looking to raid a grimling $camp perhaps?");
     }
    if($text=~/camp/i){
     quest::say("I can lead a dozen men of my strength on a raid against a well fortified grimling encampment. It's a risky mission, but one that has the potential to yield substantial rewards. If you have the manpower and the courage, give me a $glowing acrylia sphere and we'll get started.");
     }
    if($text=~/glowing/i){
     quest::say("If you don't have one for me, I aint risking my life for nothing. They can be purchased right here in our outpost from Shopkeeper Chirrin.");
     }
    if ($text=~/ready/i) {
     quest::say("Very well then $name, Follow me.");
     quest::spawn2(167982,0,0,-982.5,919.2,34.7,243);
     quest::spawn2(167981,0,0,-982.5,919.2,34.7,243);
     quest::signalwith(167981,7212,0);
     quest::signalwith(167982,7213,10);
     quest::start(501017);
     }
}
sub EVENT_ITEM {
my $ready = quest::saylink("ready", 1);
    if (plugin::check_handin(\%itemcount,4376=>1)) {
     quest::say("Thank you $name, Whenever you and your party are $ready to move out, just tell me.");
     }
}
sub EVENT_WAYPOINT {
    if ($wp == 10) {
     quest::spawn2(167980,0,0,-758.9,873.3,-0.4,211.5);
     quest::depop();
     }
}
#END of FILE Zone:grimling  ID:167132 -- Scout_Derrin 

