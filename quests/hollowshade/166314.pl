sub EVENT_DEATH {
  if ($istate == 4){
  #depop all invaders and defenders
  #resets the invaders
  quest::spawn_condition("hollowshade",8,0); #owl invader to grimlin camp are 8
  quest::spawn_condition("hollowshade",9,0); #wolf invader to grimlin camp are 9
  quest::spawn_condition("hollowshade",10,0); #wolf invader to owl camp are 10
  quest::spawn_condition("hollowshade",11,0); #grimlin invader to owl camp are 11
  quest::spawn_condition("hollowshade",12,0); #owl invader to wolf camp are 12
  quest::spawn_condition("hollowshade",13,0); #grimlin invader to wolf camp are 13
  #reset defenders
  quest::delglobal("defder1");
  quest::setglobal("defder1",0,3,"F");
  $defder1=undef;
  quest::delglobal("defder2");
  quest::setglobal("defder2",0,3,"F");
  $defder2=undef;
  quest::delglobal("defder3");
  quest::setglobal("defder3",0,3,"F");
  $defder3=undef;
  quest::delglobal("defder4");
  quest::setglobal("defder4",0,3,"F");
  $defder4=undef;
  quest::delglobal("defder5");
  quest::setglobal("defder5",0,3,"F");
  $defder5=undef;
  quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
  quest::spawn_condition("hollowshade",5,0); #owls defender are 5
  quest::spawn_condition("hollowshade",6,0); #wolves defender are 6
  #reset counter
  quest::delglobal("istate");
  quest::setglobal("istate",0,3,"F");
  $istate=undef;
  }
  else{
  my $a = 1;
  my $b = $istate;
  $a = ++$b;  
  quest::delglobal("istate");
  quest::setglobal("istate",$b,3,"F");
  }
}
#Angelox 
#counter for invader deaths - when six invaders get killed, 
#all defenders and invaders de-pop
#general invader script
#if this works, then I wasted a lot of scripting on the 
#other defender spawns (this is much better).
