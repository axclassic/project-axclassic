sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Ogog not smart, but Ogog smarter than you.  You ready for Ogog or no?");
}
if($text=~/i am ready/i){
quest::say("Ok, $name.  Ogog got some hard things for you.  You do bash, smash, or think test?");
}
if($text=~/i do think test/i){
quest::say("Ogog think you can do this one maybe, Ogog no know, though.  You bring Ogog efreeti belt, pegasus statue, a spiroc wind totem, and a wind tablet.  Ogog say good luck!");
}
if($text=~/i do smash test/i){
quest::say("Ogog smash good. . . Ogog no think you can smash good.  But Ogog let you try.  You get Ogog Djinni War Blade, some virulent wasp poison, and a mottled spiroc feather.  Ogog say you good warrior if you do this!");
}
if($text=~/i do bash test/i){
quest::say("This one hard, Ogog like it.  Ogog need efreeti battle axe, some honey nectar, bottled djinni, and ethereal emerald. Then Ogog make you best basher."); }
}
#END of FILE Zone:airplane  ID:Not_Found -- Ogog 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hail!  So you think you are a mighty Knight of Shadows?  We must test these skills.  Are you ready to begin the test?  Or do you think you have already proof of your deeds?");
}
if($text=~/i am ready to begin the test/i){
quest::say("Great, let us waste no more time!  I offer to you three challenges,  Bash, smash, or slash?  What do you wish to be tested in?"); }
}
#END of FILE Zone:airplane  ID:Not_Found -- Gragrot 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Do not waste my time, $name.  Do you wish to take the test of blades or not? Or do you have one of my old trinkets you wish to trade in?");
}
if($text=~/what trinkets/i){
quest::say("Ahh, I've given out some lesser trinkets in the past that many have gotten bored with.  I'm willing to accept Aerated Pauldrons in trade for Pauldrons of the Blue Sky.");
}
if($text=~/i wish to take the test of blades/i){
quest::say("The test of blades is not easy.  I hope you are as powerful as you are brave.  What do you wish to strive for? Strength, force, or skill?");
}
if($text=~/i strive for strength/i){
quest::say("Remember, true strength lies not only in the body, but in the mind as well. Return to me a bronze disc, a small pick, and a stone amulet.  If you manage to do this, my runed wind amulet shall be yours.");
}
if($text=~/i strive for force/i){
quest::say("Foolishness or bravery, $name?  We shall see.  Return to me a pearlescent globe, silver mesh and a spiroc air totem.  In return, you will receive both my deepest respect and the Pauldrons of the Blue Sky.");
}
if($text=~/i strive for skill/i){
quest::say("The test of skill it is. Go upward and retrieve these three items: an ivory tessera, a small ruby, and an azure ring.  Return these to me and the azure ruby ring shall be yours."); }
}
#END of FILE Zone:airplane  ID:Not_Found -- Falorn 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Welcome, $name.  I am apprentice Rayne.  Do you wish to test your abilities? Or perhaps you would like to find out what I have to trade?");
}
if($text=~/what trade/i){
quest::say("Bartering is another important skill.  Sometimes finding something that most consider junk can be useful to another for a whole different reason.  Find me a Transparent Mask, Bracer of Protection or Ebonsting and I will search out a much better upgrade for you.");
}
if($text=~/what do you have for trade/i){
quest::say("Bartering is another important skill.  Sometimes finding something that most consider junk can be useful to another for a whole different reason.  Find me a Transparent Mask, Bracer of Protection or Ebonsting and I will search out a much better upgrade for you.");
}
if($text=~/what do you have to trade/i){
quest::say("Bartering is another important skill.  Sometimes finding something that most consider junk can be useful to another for a whole different reason.  Find me a Transparent Mask, Bracer of Protection or Ebonsting and I will search out a much better upgrade for you.");
}
if($text=~/what abilities/i){
quest::say("Great, let us waste no more time!  Do you wish to begin your test of deception, stealth, or cunning?");
}
if($text=~/what test of deception/i){
quest::say("Deception it is.  Proceed upward through the sky and return to me the honied nectar, a bixie stinger from this plane, a lightning rod, and a bloodsky sapphire for the test of deception and earn Thornstinger, dirk of rampage.");
}
if($text=~/what test of stealth/i){
quest::say("Stealth is a must.  Travel among the residents of the sky and bring to me a pegasus statuette, a prismatic sphere, and a fine wool cloak.  In return, the shimmering bracer of protection shall be yours.");
}
if($text=~/what test of cunning/i){
quest::say("Cunning, the true source of all rogue power.  Plan and succeed above us and return to me a bronze disc, a Jester's Mask, and some red face paint to complete the test of cunning.  The crystal mask shall be yours if you do so."); }
}
#END of FILE Zone:airplane  ID:Not_Found -- Rayne 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Welcome, $name.  I am apprentice Kendrick.  Do you wish to test your abilities?");
}
if($text=~/what abilities/i){
quest::say("Great, let us waste no more time!  Do you wish to begin your test of thievery, silence , or trickery?");
}
if($text=~/what test of thievery/i){
quest::say("Thievery is absolute.  Travel beyond and bring forth an ivory tessera, a gem of invigoration, and an inlaid choker to complete the test of thievery and earn the wispy choker of vigor!");
}
if($text=~/what test of silence/i){
quest::say("Silence makes us deadly.  Proceed upward and bring to me a spiroc sky totem, a pearlescent globe, and a black griffon feather.  Griffon wing spauldors shall be yours if you complete this.");
}
if($text=~/what test of trickery/i){
quest::say("Trickery, ahh, how Fizzlethorpe blesses us!  Adventure and return a mottled spiroc feather, a cracked leather belt, and a sphinxian circlet to complete the test of trickery and earn Renard's Belt of Quickness."); }
}
#END of FILE Zone:airplane  ID:Not_Found -- Kendrick 

