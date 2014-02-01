#npc - KerraRidge Guard Protectors Right side one cave north (tutorialb)
#zone - TOX
#Guard Thurad 38201
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail $name, our [trip] here was well worth the trouble.");
  quest::say("Beware of what comes through the old [Gloomingdeep] mine...");}
 if($text=~/Gloom/i){
  quest::say("Yes, the vermon have dug a tunnel just north of here.");
  quest::say("Follow the wall to the north, you'll see...");}
 if($text=~/trip/i){
  quest::say("We came from the city of Shar Vahl");
  quest::say("Talk to Guardian Jaamil, he will tell you more...");}
}

sub EVENT_COMBAT {
   if (($combat_state ==1)&&($toxgrd == 2)){
   quest::signal(38200);
   quest::say("Over here Jaamil!");
   quest::say("For the protection of all Kerranians!");
   quest::say("This town will be a safer place now that we are here!");
   quest::delglobal("toxgrd");
   quest::setglobal("toxgrd",3,3,"F");
   $toxgrd=undef;
   }
}

sub EVENT_SIGNAL {
   quest::say("On my way comrad!");
   quest::say("show them no mercy!");
#   quest::delglobal("toxgrd");
#   quest::setglobal("toxgrd",2,3,"F");
#   $toxgrd=undef;

   }

sub EVENT_ATTACK {
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Another corpse for the caretaker ...");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("You fool!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("Let me polish my sword with your skin!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("You death will come quickly!");
    }elsif($combat_state == 1){
    quest::say("Halt! who enters here?");}
   }
   
   sub EVENT_SPAWN
{
   quest::delglobal("toxgrd");
   quest::setglobal("toxgrd",2,3,"F");
   $toxgrd=undef;
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
   quest::delglobal("toxgrd");
   quest::setglobal("toxgrd",2,3,"F");
   $toxgrd=undef;
}

