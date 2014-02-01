sub EVENT_SAY { 
if($text=~/i want to see the dancing skeleton/i){
quest::say("Oh!!  You wish to see the great Oowomp perform his magic!!  I have studied with the grand mages and wise [McMerin clan] of Norrath. as my speech implies.  I can call forth the skeleton with but a twinkling of my power and five of your gold.");
}
if($text=~/who is McMerin clan/i){
quest::say("Clan McMerin were wise shamans from the North.  They allowed me to study with them.  I learned many spells while I communed with them.  From them. I sto.. I mean. I learned. the secret of McMerin's Feast.  If you want to know the secret. you could [help gather components] for future rituals.");
}
if($text=~/i will help gather components/i){
quest::say("Actually... Not so much help as do - ALL - of the gathering.  In the lands of Kunark are clay of Ghiosk. crushed dread diamond and powder of Yun.  A rare find would be the bones of one who touched the Bath of Obulus.  Find and return these to me and the shaman secret of McMerin's Feast is yours."); }
}
#END of FILE Zone:timorous  ID:2030 -- The_Great_Oowomp 

