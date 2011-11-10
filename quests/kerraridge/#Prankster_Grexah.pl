#NPC: #Prankster_Grexah   Zone: kerraridge
#by Qadar

sub EVENT_SAY {
  if($khazi==1){                      # if key hasnt been given to him
    if($text=~/Hail/i){
      quest::say("Please leave me alone, I am busy.");
    }
    if($text=~/key/i){
      quest::say("Did Khazi send you?  I took the keys as a joke but I have lost them.  If she finds out I have lost her keys, I will be in big trouble for sure!  Will you [help] me find them?");
    }
    if($text=~/help/i){
      quest::say("Thank you!  I lost them on the island with the skeletons.  One jumped out at me and I was so scared, the keys fell out of my hand and into a pit.  They are still down there, but I am too afraid to go get them.  Please find them and bring them to me.  I will reward you if you do.  Do not let Khazi know, she will not be happy.");
    }
  }elsif($khazi==2){
    quest::say("Follow me.");         # if $khazi == 2 then he is on his way to free prisoners, so just say "Follow me"
  }else{
    quest::say("Have you seen the trouble I have created!  Kobolds running around the city!  Isn't it funny!");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 501 => 1)){
    if($khazi == 1){
      quest::say("Thank you!  Now I can give you your reward.  Please follow me, you will enjoy this!");
      quest::delglobal("khazi");
      quest::setglobal("khazi",2,3,"F");   # set $khazi = 2 (Grexah has key, is on his way to free kobolds)
      $khazi=undef;
      quest::start(28);                    # start on grid 28 to path to Khazi
    }
    else{
      plugin::return_items(\%itemcount);
      quest::emote("cannot take this right now.  He is laughing too hard about his recent prank.");
    }
  }else{
    quest::say("I don't need this!");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_WAYPOINT {                     # when he gets to kobold pen
  if($wp==19){
    quest::say("HAHAHAHAHA!  Thanks to you I can finish my prank!  I shall now release all the kobold prisoners!");

    quest::signal(74547);                # signal Khazi that they have been released

   
    quest::spawn2(74541,29,0,143.5,332.2,7.0,187.9);
    quest::spawn2(74541,30,0,6.7,61.5,5.0,112.2);
    quest::spawn2(74541,31,0,391.7,646.1,1.0,88.4);
    quest::spawn2(74541,32,0,372.9,928.9,9.8,207.6);
   
    quest::depop();               # despawn Grexah
  }
}