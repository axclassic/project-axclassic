sub EVENT_SAY { 
    if($text=~/Hail/i) {
    quest::say("You! You will get the ingredients I need for this bath! I have a very important Kirin client who is expected to be here shortly, and I am out of his favorite soap. If I don't get all the ingredients to make more soap for his bath, he will be very, very angry.");
    quest::say("Return to me with a branch of pink blossoms, some green herbs, a vial of pond water, and the tail from the puma that stalks these grounds. What? Yes, yes I will reward you. Now go!");
    quest::spawn2(338089,2780153,0,429.8,247.4,-28.8,192.1);
	}
 }
 sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 55996 =>1, 55997 =>1, 55998 =>1, 55999 =>1 )) {
    quest::say("Thank you $name! Now I don't need to worry about the rathe from Hong Lei.");
    quest::say("Here is your reward I promised you."); 
    quest::ding();
    quest::exp(10000);
    quest::givecash(0,0,0,2);
    }
 }	