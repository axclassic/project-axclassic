#zone:PoKnowledge
#Angelox
#Druid Buffs
#NPC: Befaydra

sub EVENT_SAY { 
if($text=~/hail/i){
$npc->SetAppearance(0);
quest::say("Hello $name, Any donation you can afford will be ok");
quest::emote("winks at you");
$npc->CastSpell(278,$userid);
quest::say("I also have [PoN] if  you're interested, but you need to  at least be level 40");
quest::selfcast(1569);
}
elsif(($text=~/PoN/i)&&($ulevel>=40)){
$npc->SetAppearance(0);
$npc->CastSpell(3234,$userid);
quest::say("Casting PoN, enjoy!");
 }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(1);
	my $random_result = int(rand(100));
	if ($random_result<=10){
	quest::shout("Casting SOW for donations up front the main bank, just hail me!");
	}else{
	#Do Nothing
 }
}


sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=20){
    quest::shout("Casting SOW for donations up front the main bank! just hail me");
    }else{
    #say nothing
 }
}

