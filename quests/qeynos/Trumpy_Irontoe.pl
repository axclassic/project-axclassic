#############
#NPC: Trumpy_Irontoe
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Sunsa_Jocub, Bruno_Barstomper
#Items Involved: 
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
	  quest::say("Heh?  What's yer name?  $name?  Never heard of ya.  Now quit breathin' on me and buy us some [drinks]!");
  }
  elsif($text=~/what drinks/i){
    quest::say("<BURP!>  Yeah.  Gimme a..  <BURP!> er..  honey mead.");
  }
  elsif($text=~/Who is Skippy/i){
    quest::say("Skippy? You mean that fish farmer? Heh heh heh. What a moron. And his brother [Beren] has the nerve to actually threaten ME!?.. Burp.. Bah. Remind me to tell [Kane] about that steaming pile of gnoll dung.");
  }
  elsif($text=~/Who is Beren/i){
    quest::say("Don't even mention that weakling's name. He.. burp.. Keeps threatening me. ME! Trumpy IRONTOE!!! Peh! That useless son of a goblin had better wise up and realize that in this burg if you ain't with [Kane], you are against him. And if you are against him.. burp.. you ain't nothing but a corpse.");
  }
  elsif($text=~/Who is kane/i){
    quest::say("Ah.. burp.. that piece of cr.. eh? Oh its you.. Kane runs this burg.. or at least he will.. if [Sragg] can get his act together.");
  }
  elsif($text=~/Sragg/i){
    quest::say("Where did you hear that name?!? Not from me! I didn't say nothing about Sragg or those Bloodsabers or their dang temple in the sewers! Get away from me ya hobgoblins! I don't wants no trouble!");
  }
  elsif($text=~/wh(at|ere).*?Kaladim/i){
    quest::say("Heh? Kaladim, you say? It's a long way from here, I tell you.. Home to us dwarves it is. I miss it sometimes though.. Its tough being a swashbuckling dwarf with my rugged good looks when all the other dwarves are so envious. Cripes, $name... You got me all misty-eyed now.. <BURP!> Peh! Buy me a honey mead, will ya?");
  }
  elsif($text=~/what.*?dragon/i){
    quest::say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are a proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP!>");
  }
}

sub EVENT_ITEM {
  # Honey Mead ID:13033 
  if (plugin::check_handin(\%itemcount, 13033 =>4 )) {
    quest::say("Beh!  Thanks, Skippy.  Why don't ya buy yourself one?  And..  <GULP>.. <BURP!>.. get me another!"); 
  }
  else{
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_WAYPOINT {
  my $h = int($npc->GetHeading());
  if (!defined($bar_trigger) || !defined($dock_trigger)) {
    $bar_trigger = 0;
    $dock_trigger = 0;
  }
  elsif($wp == 1) {
    my $random = int(rand(100));
    if ($random <= 35 && $h >= 10 && $h <=120 ){
      quest::say("Time to drain the [dragon]..  If ya know what I mean..  Bwah ha ha ha.");
      #checking to see if Sunsa_Jacub is spawned and send signal
      my $npccheck = $entity_list->GetMobByNpcTypeID(1074);
      if ($npccheck != 0) {
        quest::signalwith(1074, 1, 2);
      }
      #setting variable for response check during patrol
      $bar_trigger = 1;
    }
  }
  #This is only used when a statement above is used.
  elsif($wp == 5 && $bar_trigger == 1){
    #Resets response variable.
    $bar_trigger = 0;
    #checking to see if Bruno_Barstomper is spawned and send signal
    
    my $npccheck = $entity_list->GetMobByNpcTypeID(1075);
    if ($npccheck != 0) {
      quest::say("Outta my way, ya big lummox!");

      quest::signalwith(1075, 1, 2);
    }    
  }
  #Banter with Guard_Beren
  elsif ($wp == 13 && $h == 71){
    quest::say("<BURP!>Heh heh.. Enjoy that one boys!");
    #checking to see if Guard_Beren is spawned and send signal
    my $npccheck = $entity_list->GetMobByNpcTypeID(1090);
    if ($npccheck != 0) {
      quest::signalwith(1090, 2, 2);
    }
  }
  #Banter with Guard_Beren
  elsif ($wp == 15 && $h == 146){
    quest::say("Hey. What a loser!");
    #checking to see if Faren is spawned and send signal
    my $npccheck = $entity_list->GetMobByNpcTypeID(1090);
    if ($npccheck != 0) {
      quest::signalwith(1090, 3, 2);
    }
  }
  # For trigger at wp 34.
  # This is due to wp 34 giving the incorrect heading if checked.
  elsif ($wp == 33){
    if ($h >= 50 && $h <= 60) {
      $dock_trigger = 1;
    }
  }
  elsif ($wp == 34){
    if ($dock_trigger == 1) {
      #checking to see if Faren is spawned and send signal
      my $npccheck = $entity_list->GetMobByNpcTypeID(1159);
      if ($npccheck != 0) {
        quest::doanim(1);
        quest::say("Hey Fishboy! You dropped something! Bwah ha ha ha!"); 
        quest::signalwith(1159, 1, 2);
      }
      $dock_trigger = 0;
    }
  }
}

sub EVENT_SIGNAL {
  #response to Sunsa_Jocub
  if ($signal == 1) {
    quest::say("You know you love me.");
  }
  #resonpse to Faren
  elsif ($signal == 2) {
    quest::say("Better start learning, [Skippy].");
    quest::signalwith(1159, 2, 2);
  }
  #resonpse to Guard_Beren
  elsif ($signal == 3) {
    quest::say("Peh! What have you been eating? Your brother's bait? You are lucky I don't have time to give you the beating you so richly deserve.");
  }
}

#END of FILE Zone:qeynos  ID:1042 -- Trumpy_Irontoe

