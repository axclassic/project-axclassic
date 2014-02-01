#zone:PoKnowledge
#Angelox

sub EVENT_SAY { 
if(($text=~/hail/i)&&($ulevel<= 45)){
$npc->SetAppearance(0);
quest::say("Hello $name, I can buff you with clarity for a fee of 5pp, and my friend over there has cleric buffs.");
quest::emote("waves at Qadar");
quest::doanim("29");
}
elsif(($text=~/hail/i)&&($ulevel>=46)){
$npc->SetAppearance(0);
quest::say("Hello $name, I can buff you with KEI for a fee of 15pp, and my friend over there has cleric buffs");
quest::emote("waves at Qadar");
quest::doanim("29");
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
	if ($random_result<=15){
	quest::shout("Casting KEI and Clarity for donations on the rock behind the main bank!");
	}else{
	#Do Nothing
 }
}

sub EVENT_ITEM{
  if (($platinum>=15)&&($ulevel>= 46)){
    $npc->SetAppearance(0);
    quest::selfcast(2570);
    #$npc->CastSpell(2570,$userid);
    quest::say("Casting KEI, Good hunting!");
 #   $t = 0;
#    KEI()
  }elsif(($platinum>=5)&&($ulevel<= 45)){
    $npc->SetAppearance(0);
   #quest::selfcast(174);
    $npc->CastSpell(174,$userid);
    quest::say("Casting Clarity, Good hunting!");
  }else{
    quest::say("Thank you for your donation $name, it wasn't enough though ...");
 }
}

sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=25){
    quest::shout("Casting KEI and Clarity for donations on the rock behind the main bank!");
    }else{
    #say nothing
 }
}


#sub KEI {
# while ($t <= 10000000) {
#     $t ++;
#  }
#quest::doanim("43");
#quest::selfcast(2570);
#quest::say("Done.");
# }
