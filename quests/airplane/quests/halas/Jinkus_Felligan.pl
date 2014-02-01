sub EVENT_SAY
{ 
  if($text=~/Hail/i)
  {
    quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice] eh?");
  }
  if($text=~/i am new to the shamans of justice/i)
  {
    quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye ready to [contribute to yer church] or do ye [wish to meditate] within our walls?");
  } 
  if($text=~/contribute/i)
  {
    quest::say("Your first task will be to gather the materials I require. Find Greta Terrilon and ask her for some Datura Ink. See Cindl and ask for some mammoth hide parchment. Bring those items to me."); 
  }
}

sub EVENT_ITEM
{
  #Datura Ink and Mammoth hide parchment handin
  if(plugin::check_handin(\%itemcount, 12619 => 1, 12621 => 1)) 
  {
     quest::say("This is what I needed, thank you. Your next task is to take this wanted poster to Dun at the bank in Qeynos. Go quickly, this is important");
     quest::summonitem(12620);
  }
  #List of criminals handin, symbol awarded. This item could use a bit of reward tweaking.Please consider changing it.
  #This is currently a necklace (+1 wis) that summons the hammer of wrath, A 6/32 1HB with a +3 against undead. May I   
  #suggest a charm slot (there are a slew of neckpiececes out there, and very few charms at low levels) that summons a spear 
  #on the order of a boggling battlespear. before you think thats overpowered, remember that shaman must melee till 23 or  
  #higher if he solos, and in EQemu we are in a soloing situation. It wouldnt hurt to make this a level 5 and up itemif it is
  #tweaked.
  if(plugin::check_handin(\%itemcount, 12622 => 1)) 
  {
    quest::say("Great work, $name You will be a welcome addition to our rolls. Take this as a token of your new status");
    quest::summonitem(1376); 
  }
}
#END of FILE Zone:halas  ID:29025 -- Jinkus_Felligan 

