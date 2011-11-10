sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetin's t'ye $name!  Isn't the area 'round 'ere so nice an' quiet?  Such a departure from me old days; slaving o'er the forge t'create masterpieces!  T'be 'onest. at times I do miss the old forge. but after I created me finest breastplate. it seemed as if nothing else I made could ever live up t'it.  So I left me home to'wander the land an' see what I could learn o'the world.  I 'ave learned quite a bit from the elders 'ere an' the skilled craftspeople in New Tanaan.  I 'ave even devised a type o'emblem that will impart the magic o'tranquility into the user t'create planar armors from pieces o'energy found in the planes.");
}
if($text=~/emblem/i){
quest::say("Ye look mighty inexperienced t'be in this area. $name. Come an' seek me out when ye 'ave more knowledge o'the planes!"); }
}
#END of FILE Zone:potranquility  ID:203064 -- Bor_Wharhammer 

