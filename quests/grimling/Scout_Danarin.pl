sub EVENT_SAY { 
my $action = quest::saylink("action", 1);
my $marbled = quest::saylink("marbled", 1);
if($text=~/Hail/i){
quest::say("Hello $name. welcome to the front lines of our war against the bastard grimlings. As I'm sure you know. we Vah Shir shun violence, but with this enemy there is no other way. Let me know if you'd like to see some $action.");
}
if($text=~/action/i){
quest::emote(' smiles.');
quest::say("I can escort you to a camp but I aint going into battle for free. Give me a $marbled acrylia sphere nad I will lead you to the slaughter.");
}
if($text=~/marbled/i){
quest::say("You say you dont have one? Well I know a shopkeeper right here in the outpost that sells them. Go see Chirrin and dont come back without one.");
}
if ($text=~/ready/i) {
     quest::say("We must sneak up on the encampment, rushing in this time would surely mean death for both us. Follow me.");
     quest::spawn2(167989,0,0,531.4,-831.4,13.8,15.5);
     quest::spawn2(167990,0,0,531.4,-831.4,13.8,15.5);
     quest::signalwith(167960,7222,0);
     quest::signalwith(167989,7223,10);
     quest::start(501018);
     }
}
sub EVENT_ITEM {
my $ready = quest::saylink("ready", 1)
elsif (plugin::check_handin(\%itemcount,4349=>1)) {
     quest::say("$name, There are reports of an Encampment west of here. Get your party together and come with me. Hopfully there wont be too many of them there as we have no one to back us up."); 
     quest::say("Tell me when you are $ready to travel.");
     }
     }
sub EVENT_WAYPOINT {
    if ($wp == 5) {
     quest::spawn2(167992,0,0,641.8,-899.9,-9,237.2);
     quest::depop();
     }
}     
#END of FILE Zone:grimling  ID:167133 -- Scout_Danarin 

