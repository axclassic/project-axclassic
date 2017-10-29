sub EVENT_DEATH {
#grimlins killed owls
if (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==1)){
	#Set Zone Race to Grimlins
	quest::spawn_condition("hollowshade",3,0);
	quest::spawn_condition("hollowshade",2,0); 
	quest::spawn_condition("hollowshade",1,1);  #grimlins won
	#Remove Camp Defenders
	quest::spawn_condition("hollowshade",5,0); #owl defender are 5
	#Remove Camp Invaders
	quest::spawn_condition("hollowshade",11,0); #grimlin to owl camp invader are 11
}
#wolves killed owls
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==1)){
	#Set Zone Race to OWolves (Sonics)
	quest::spawn_condition("hollowshade",3,1); #wolves won
	quest::spawn_condition("hollowshade",2,0);
	quest::spawn_condition("hollowshade",1,0);
	#Remove Camp Defenders
	quest::spawn_condition("hollowshade",5,0); #owl defender are 5
	#Remove Camp Invaders
	quest::spawn_condition("hollowshade",10,0); #wolf to owl camp invader are 10
}
#If not all $defder variables are set, then must be this one needs to be set
else{ 
	quest::delglobal("defder2");
	quest::setglobal("defder2",1,3,"F");
	$defder2=undef;
 }
}
#angelox
#2an_owlbear_defender 
#Hollowshade script owlbear defenders