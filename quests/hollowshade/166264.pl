sub EVENT_DEATH {
#grimlins killed wolves
if (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==1)){
	#Set Zone Race to Grimlins
	quest::spawn_condition("hollowshade",3,0);
	quest::spawn_condition("hollowshade",2,0); 
	quest::spawn_condition("hollowshade",1,1);  #grimlins won
	#Remove Camp Defenders
	quest::spawn_condition("hollowshade",6,0); #wolf defender are 6
	#Remove Camp Invaders
	quest::spawn_condition("hollowshade",13,0); #grimlin to wolf camp invader are 13
}
#owls killed wolves
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==1)){
	#Set Zone Race to OWolves (Sonics)
	quest::spawn_condition("hollowshade",3,1); #wolves won
	quest::spawn_condition("hollowshade",2,0);
	quest::spawn_condition("hollowshade",1,0);
	#Remove Camp Defenders
	quest::spawn_condition("hollowshade",6,0); #wolf defender are 6
	#Remove Camp Invaders
	quest::spawn_condition("hollowshade",12,0); #owl to wolf camp invader are 12
}
#If not all $defder variables are set, then must be this one needs to be set
else{ 
	quest::delglobal("defder1");
	quest::setglobal("defder1",1,3,"F");
	$defder1=undef;
 }
}
#angelox
#1a_sonic_defender 
#Hollowshade script wolf defenders