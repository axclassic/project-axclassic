#angelox
##Skrietat`Chu 
sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::emote("assails you with a deafening shriek!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::emote("emits a loud screech, vibrating the ground at your feet.");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::emote("snaps its powerful beak.");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::emote("emits a loud screech, vibrating the ground at your feet.");
    }elsif($combat_state == 1){
    quest::emote("catches sight of an enemy and ruffles its feathers in anger.");}
}

sub EVENT_ATTACK{
{quest::emote("catches sight of an enemy and ruffles its feathers in anger.");}
}

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	quest::spawn_condition("hollowshade",6,0); #wolf defender are 6
	quest::spawn_condition("hollowshade",5,1); #owl defender are 5
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",3,3,"F"); #wolves
	$astate=undef;
	quest::me("Sonic wolves begins to attack the owlbear tribe");
	quest::signal(166217,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",1,3,"F"); #gremlins
	$astate=undef;
	quest::me("Grimlins begins to attack the owlbear tribe");
	quest::signal(166217,5);
  }
    if($random_result<=20){
    quest::emote("emits a muffled screech as it collapses.");
    }elsif($random_result<=40){
    quest::emote("twitches as life fades from its round yellow eyes.");
    }elsif($random_result<=60){
    quest::emote("emits a muffled screech as it collapses.");
    }elsif($random_result<=80){
    quest::emote("twitches as life fades from its round yellow eyes.");
    }else{
    quest::emote("staggers for a moment and then collapses...");}
}
