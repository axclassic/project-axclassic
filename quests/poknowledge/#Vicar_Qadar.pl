#zone:PoKnowledge
#Angelox

sub EVENT_SAY { 
if(($text=~/hail/i)&&($ulevel<= 45)){
$npc->SetAppearance(0);
quest::say("Hello $name, I can buff you with temperance for a fee of 5pp, and my friend over there, has mind buffs.");
quest::emote("waves at Nomaad");
quest::doanim("29");
}
elsif(($text=~/hail/i)&&($ulevel>=46)){
$npc->SetAppearance(0);
quest::say("Hello $name, I can buff you with Virtue for a fee of 15pp, and my friend over there has mind buffs.");
quest::emote("waves at Nomaad");
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
	if ($random_result<=10){
	quest::shout("Casting Temperance and Virtue for donations behind the main bank!");
	}else{
	#Do Nothing
 }
}

sub EVENT_ITEM{
  if (($platinum>=15)&&($ulevel>= 46)){
    $npc->SetAppearance(0);
    $npc->CastSpell(3467,$userid);
    #quest::selfcast(3467);
    quest::say("Casting Virtue, Good hunting!");
  }elsif(($platinum>=5)&&($ulevel<= 45)){
    $npc->SetAppearance(0);    
    $npc->CastSpell(3692,$userid);
    #quest::selfcast(3692);
    quest::say("Casting Temperance, Good hunting!");
  }else{
    quest::say("Thank you for your donation $name, it wasn't enough though ...");
 }
}

sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=20){
    quest::shout("Casting Temperance and Virtue for donations behind the main bank!");
    }else{
    #say nothing
 }
}

