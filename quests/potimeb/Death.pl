# Death.pl npcid - 223251

sub EVENT_SAY {

if($status == 255){
	if($text=~/help/i){
	quest::delglobal("blockout");
	quest::delglobal("blockout2");
	quest::doanim(15);
	}
}

if($text=~/hail/i) {
	quest::say("Yes?");
	quest::doanim(5);
	}

}#END sub EVENT_SAY