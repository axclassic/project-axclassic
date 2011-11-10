sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well hello... How may I help you?"); }
}
sub EVENT_ITEM { 
if($itemcount{30665} == 4){
quest::say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl and its people are in your debt. Please, accept these gifts to assist you in your endeavors. It is the least I can do to return the favor you have done many many people.");
quest::summonitem("31586");
quest::givecash("3","3","0","0");
quest::faction("Not_Found","1");
}
if($itemcount{30602} == 1 && $itemcount{30964} == 1){
quest::say("Well done $name. I hope it isnt too late.'' Ragnar begins to chant over the carapace and the claw, holding each in opposite hands. A soft light travels from the claw to the carapace as the claw turns to dust. Ragnar opens his eyes and begins to speak. ''It has worked, but all we have done is buy ourselves more time. While you were away, I have been speaking to Master Barkhem. He has a shield frame that can support these carapaces. You will need to craft such a shield by including this carapace and into the frame along with enough to fill each slot. You are doing quite well young $name, Siver has grown a little stronger. You can make use of her innate strength by weaving this spell.''");
quest::summonitem("30977");
quest::faction("Not_Found","1");
}
if($itemcount{30965} == 1){
quest::say("Nicely done $name. This anchor should be sufficient to keep Siver bound to this realm for a while. She is strong enough to blind your enemies with a bright flash of light now, all you have to do is call on her spirit. I still cannot make complete sense of her thoughts. I think she is trying to tell me of another whisperling entrapped within the crater. Keep an eye open for the whisperling Scorpialis.");
quest::say("In the meantime, you can seek out a shield made of Xakra. Xakra made of the ethereal fabric of the spirit realm. I know the Shak Dratha within the thicket are weavers of this rare form of shadow silk. Such a shield can help us strengthen the anchor, making it easier for Siver to aid you. It will also improve her health greatly. She has been through a lot and is in rather poor condition as it stands now.");
quest::summonitem("15021","1");
quest::faction("Not_Found","1"); }
}
#END of FILE Zone:sharvahl  ID:155198 -- Spiritist_Ragnar 

