#npc - KerraRidge Guard Protectors Left side one cave south (Hollowshade)
#zone - TOX
#Guard Jaamil 38200
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail $name!");
  quest::say("We now live here in Kerraridge, we came to [help] and defend our brother Kerranains");}
if($text=~/help/i){
  quest::say("Aye, we left our city through a [tunnel] in Hollowshade Moore found by our sister in arms [Vahlara]");}
if($text=~/tunnel/i){
  quest::say("Yes, I like travel back occasionaly, the entrance is just south of here, you can follow the wall");}
if($text=~/Vahlara/i){
  quest::say("She was the first to arrive here, but since has moved to [Gloomingdeep] in support of the rebellion there");}
if($text=~/Gloomingdeep/i){
  quest::say("Aye, ask Guardian Thurad if you wish to learn more of Gloomingdeep.");}
}

sub EVENT_COMBAT {
   if (($combat_state ==1)&&($toxgrd == 2)){
   quest::signal(38201);
   quest::say("Over here Thurad!");
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
    quest::say("Your death will come quickly!");
    }elsif($combat_state == 1){
    quest::say("Halt! who enters here?");}
}