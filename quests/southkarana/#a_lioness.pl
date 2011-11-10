#Quillmane spawn
#npc - #a_lioness - randomly spawns 1 of 3 Quilmane locs around the zone)
#zone - SouthKarana
#Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a=14139; #npc - Quillmane
 my $b=14139; #npc - Fabled Quillmane
 if(($random_result<=5) && ($quill==2)){
   #quest::say("Spawning Fabled1");
   quest::spawn2($b,101,0,3210,-6821.6,38.3,193.3);
   quest::delglobal("quill");
   quest::setglobal("quill",3,3,"F");
   $quill=undef;
 }elsif(($random_result>=6) && ($random_result<=10) && ($quill==2)){
   #quest::say("Spawning Quillmane1");
   quest::spawn2($a,101,0,3210,-6821.6,38.3,193.3);
   quest::delglobal("quill");
   quest::setglobal("quill",3,3,"F");
   $quill=undef;
  }elsif(($random_result>=11) && ($random_result<=20)&& ($quill==2)){
    #quest::say("Spawning Quillmane2");
     quest::spawn2($a,102,0,-2761.8,-6076,0.7,4.0);
     quest::delglobal("quill");
     quest::setglobal("quill",3,3,"F");
     $quill=undef;
  }elsif(($random_result>=21) && ($random_result<=30)&& ($quill==2)){
     #quest::say("Spawning Quillmane3");
     quest::spawn2($a,103,0,-2333.8,1296.5,38.7,247.3);
     quest::delglobal("quill");
     quest::setglobal("quill",3,3,"F");
     $quill=undef;
  }elsif(($random_result>=31) && ($random_result<=36)&& ($quill==2)){
     #quest::say("Spawning Fabled3");
     quest::spawn2($b,103,0,-2333.8,1296.5,38.7,247.3);
     quest::delglobal("quill");
     quest::setglobal("quill",3,3,"F");
     $quill=undef;
  }else{
    #quest::say("No spawn");
  };
};
