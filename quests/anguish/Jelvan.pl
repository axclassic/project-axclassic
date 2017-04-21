## Jelvan 317004 This is the second event encountered in the Asylum of Anguish raid expedition.##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
     quest::shout("The tormentors. They are trying to break me. They want me to be one of them. They want my power!");
	} 
sub EVENT_SAY { 
my $help = quest::saylink("help", 1);
if($text=~/Hail/i){
quest::say("You must $help me. You must destroy them.");
} 
if($text=~/help/i){
quest::say("They must be killed! They... Can you here them? They are coming close. I will help you while I can, but I can already feel their taint seeping into my bones.");
quest::spawn2(317099,0,0,-170.6,2163.2,-151.1,181.9);
quest::spawn2(317100,0,0,-343.1,2154.2,-151.1,78.9);
quest::spawn2(317101,0,0,-256.9,1994.8,-150.7,8.1);
 }
}
sub EVENT_SIGNAL {
   if($signal == 394) {
   quest::shout("Oh Thank you! Thankyou! I am free at last!");
   quest::start(11);
   }
 }
sub EVENT_WAYPOINT {
if ($wp == 3) {
quest::spawn2(317111,0,0,-259.7,2069.1,-150.9,131.3);
quest::depop(); 
 }
} 
