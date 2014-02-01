################################### 
#Zone: The Dreadlands             #                                              
#Short Name: dreadlands           #                                                                  
#Zone ID: 86                      #                                        
###################################                                             
#NPC Name: Veltar                 #                             
#NPC ID: 86092                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::emote(" 's body has scars all about it, looking as though beaten with whips. One wrist bares a unique looking bracer, the other is bare.");
quest::say("Leave me be! I did not come up here because I wanted company.");
}
if($text=~/Tell me about the tynnonium shackle/i){ 
quest::say("So it is the one that has freed me before! You seek the ways of Tynn I see. You must be on the true path of the monk to accomplish what is needed. The path will test the [three virtues] most important to becoming a true vessel for Cazic Thule's power.");
}
if($text=~/three virtues/i){
quest::say("The three virtues are [patience], [agility], and [peace of mind]. Patience is important in knowing in when to strike your opponent, too soon and you may crushed, too late and your opportunity may pass. Agility is very important in showing your ability to avoid blows sent your way, and then returning what was sent to you. Without striking quickly you are no monk at all. Peace of mind will allow you to concentrate on the situation you are in. With it you can control your actions and make decisive strikes at critical times. Without peace of mind you may attack out of rage and will surely fall for your mind is clouded. You must complete these three [trials] to earn the shackle of the Grandmaster.");
}
if($text=~/patience/i){
quest::say("Patience shall be tested by the one whom has the greatest patience. Seek Master Rinmark, and ask him of this trial.");
}
if($text=~/agility/i){
quest::say("To show agility you must be tested by the most swift of us. Grandmaster Glox will provide your test for this. Ask him of the trial of agility.");
}
if($text=~/peace of mind/i){
quest::say("To show peace of mind you must decipher a tome found in the library of Kaesora. An undead tome keeper will wait for you to come, ask him of the trial of peace of mind. The tome will tell you what you shall seek. Do with the tome the same as you would with the item you seek. Show you have clarity of mind in solving this."); }
}

sub EVENT_ITEM {
if($item1=="7880" && $item2=="7879" && $item3=="5192"){
quest::summonitem(4199);
 quest::ding(); quest::exp(85); }
}


