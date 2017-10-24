sub EVENT_DEATH {
#owls killed gremlins
if (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==1)){
	#Zone Race
	quest::spawn_condition("hollowshade",3,0);
	quest::spawn_condition("hollowshade",2,1);  #owls are 2
	quest::spawn_condition("hollowshade",1,0);
	#Camp Defenders
	quest::spawn_condition("hollowshade",6,0); #wolf defender are 6
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	#Camp invaderw
	quest::spawn_condition("hollowshade",8,0); #owl invader are 8
}
#wolves killed grimlins
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==1)){
	#Zone Race
	quest::spawn_condition("hollowshade",3,1); #wolves are 3
	quest::spawn_condition("hollowshade",2,0);
	quest::spawn_condition("hollowshade",1,0);
	#Camp Defenders
	quest::spawn_condition("hollowshade",5,0); #owl defender are 5
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	#Camp Invaders
	quest::spawn_condition("hollowshade",9,0); #wolf invader are 9
}
else{
	quest::delglobal("defder4");
	quest::setglobal("defder4",1,3,"F");
	$defder4=undef;
 }
}
#angelox
#4a_grimling_defender 
#Hollowshade script grimlin defenders
