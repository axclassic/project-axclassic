#angelox
##a_grimling_chieftain
sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Don't run. Make this easier on both of us.");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("Don't worry, this will be quick.");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("I've always wanted to eat someone like you.");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Interfere with our fishing will you? If you want to be eaten, you'll have to wait your turn!");
    }elsif($combat_state == 1){
    quest::say("Tribesmen, we are under siege!");}
}

sub EVENT_ATTACK{
{quest::say("Tribesmen, we are under siege!");}
}

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition("hollowshade",4,1); #grimlin defender are 4
	quest::spawn_condition("hollowshade",6,0); #wolf defender are 6
	quest::spawn_condition("hollowshade",5,0); #owl defender are 5
	quest::say("");
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",3,3,"F"); #wolves
	$astate=undef;
	quest::me("Sonic wolves begins to attack the grimlin camp");
	quest::signal(166179,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",2,3,"F"); #owlbears
	$astate=undef;
	quest::me("Owlbears begin to attack the grimlin camp");
	quest::signal(166179,5);
  }
    if($random_result<=20){
    quest::say("coughs up a bit of blood. 'You'll never escape us...");
    }elsif($random_result<=40){
    quest::say("staggers for a moment and then collapses..");
    }elsif($random_result<=60){
    quest::say("coughs up a bit of blood. 'You'll never escape us...");
    }elsif($random_result<=80){
    quest::say("screams as it collapses, 'Brothers and sisters, show no mercy to this outlander.");
    }else{
    quest::say("Tribesmen, we are under siege!");}
}
