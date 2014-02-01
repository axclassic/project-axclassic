#zone: gunthak
#quest: Vision Shift
#site3op

sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::emote("sways back and forth, rocking with the gentle motions of the tide. You are nearly mesmerized by its periodic fluctuation, when it suddenly speaks,");
    quest::say("I watch you as you watch me, and I wonder. Do you realize how to become empty of wishes, of dreams, of hope and sorrow? What do you know, strange one, about the virtue of null emotion? Do you understand how to be as unwavering as the ocean itself? Can you envision yourself as the pebble in the river? Can you mute feeling? Do you [dare to learn]?");
  }
  if($text=~/dare to learn/i) {
    quest::say("We will see, Dreamhunter, we will see. If you are a willing pupil then demonstrate that you have begun to comprehend. Bring me something empty that previously numbed feeling and therefore brought emptiness to its possessor. You should not have to travel far.");
  }
  if($text=~/impassive as the sea/i) {
    quest::emote("removes his gaze from the ocean and looks at you.");
    quest::say("Perhaps you can be, but I require proof. If you can defeat the smallest elements of the ocean I shall reward you. Hand me their essences and I shall know you have completed the task. When you are ready to challenge them hand me back that rock.");
  }
}

sub EVENT_ITEM{
  if($itemcount{58010} == 1) {
    quest::say("Well done, strange one. Your perception is admirable.' The spirit hands you an incredibly heavy rock. 'Can you, Dreamhunter, be as [impassive as the sea]?");
     quest::ding(); quest::exp(1000);
    quest::summonitem(59020);
  }
  elsif($itemcount{59020} == 1) {
    quest::emote("melds with the murky ocean water, and two elements of the sea appear.");
    quest::spawn2(id,0,0,xxxx,yyyy,zzzz);
    quest::spawn2(id,0,0,xxxx,yyyy,zzzz);
  }
  elsif($itemcount{58014} == 1 && $itemcount{58015} == 1) {
    quest::say("Now you comprehend. This is the way things are, and the way they have always been. Your acceptance of these truths proves your worthiness.");
    quest::summonitem(59013);
  }
}