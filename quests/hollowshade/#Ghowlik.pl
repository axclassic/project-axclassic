#angelox
##Ghowlik.pl
sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("growls as it senses the presence of an outsider.");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("sniffs at the ground, picking up the scent of a threat.");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("sniffs at the ground, picking up the scent of a threat.");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("growls as it senses the presence of an outsider.");
    }elsif($combat_state == 1){
    quest::say("lunges forward, saliva dripping from its fanged jaw.");}
}

sub EVENT_ATTACK{
{quest::say("lunges forward, saliva dripping from its fanged jaw.");}
}

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	quest::spawn_condition("hollowshade",6,1); #wolf defender are 6
	quest::spawn_condition("hollowshade",5,0); #owl defender are 5
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",1,3,"F"); #grimlins
	$astate=undef;
	quest::me("Grimlins begin to attack the sonic wolves tribe");
	quest::signal(166146,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",2,3,"F"); #owlbears
	$astate=undef;
	quest::me("Owlbears begin to attack the sonic wolf tribe");
	quest::signal(166146,5);
  }
  
    if($random_result<=20){
    quest::say("coughs up a bit of blood. 'You'll never escape us. . .");
    }elsif($random_result<=40){
    quest::say("screams as it collapses, 'Brothers and sisters, show no mercy to this outlander.");
    }elsif($random_result<=60){
    quest::say("collapses, its fur matted with blood.");
    }elsif($random_result<=80){
    quest::say("staggers for a moment and then collapses.");
    }
}
