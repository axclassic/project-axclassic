sub EVENT_AGGRO
{

if($spawn == undef) {
quest::settimer(1,1800);
quest::spawn2(200064,0,0,270,-47,-59,0); 
quest::spawn2(200065,0,0,319,-25,,-59,0); 
quest::spawn2(200066,0,0,319,-149,-59,0); 
$spawn=1
}

}

sub EVENT_TIMER
{
quest::signal(200064,1); #depop mob 1
quest::signal(200065,1); #depop mob 2
quest::signal(200066,1); #depop mob 3
}

sub EVENT_DEATH
{
$spawn=undef;
quest::spawn2(200058,0,0,408,150,-61.5,135);
}