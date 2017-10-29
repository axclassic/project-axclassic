sub EVENT_DEATH {
#owls killed gremlins
if (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==1)){
	#Set Zone Race to Owls
	quest::spawn_condition("hollowshade",3,0);
	quest::spawn_condition("hollowshade",2,1);  #owls won
	quest::spawn_condition("hollowshade",1,0);
	#Camp Defenders
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	#Camp Invaders
	quest::spawn_condition("hollowshade",8,0); #owl invader are 8
}
#wolves killed grimlins
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==1)){
	#Set Zone Race to Wolves (Sonics)
	quest::spawn_condition("hollowshade",3,1); #wolves won
	quest::spawn_condition("hollowshade",2,0);
	quest::spawn_condition("hollowshade",1,0);
	#Remove Camp Defenders
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	#Camp Invaders
	quest::spawn_condition("hollowshade",9,0); #wolf invader are 9
}
#If not all $defder variables are set, then must be this one needs to be set
else{
	quest::delglobal("defder1");
	quest::setglobal("defder1",1,3,"F");
	$defder1=undef;
 }
}
#angelox
#1a_grimling_defender 
#Hollowshade script grimlin defenders

