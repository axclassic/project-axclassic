sub EVENT_SAY{
my $brother = quest::saylink("brother",1);
my $betrayal = quest::saylink("betrayal",1);
my $power = quest::saylink("power",1); 
my $outside = quest::saylink("outside",1);
my $enter = quest::saylink("enter",1);
my $illusion = quest::saylink("illusion",1);
my $stopped = quest::saylink("stopped",1);
my $essence = quest::saylink("essence",1);
my $him = quest::saylink("him",1);

if ($text =~ /hail/i && $faction <= 2){
 $client->Message(14,"Ahhh $name! I have heard you would come to ask for my help to destroy my $brother.");
}
if ($text =~ /hail/i && $faction > 3){
 $client->Message(14,"Leave me be I'm just getting some supplies.");
}
if ($text =~ /brother/i){
 $client->Message(14,"Well I will not do that. No to many through the years have blamed him for the act of $betrayal for power");
}
if ($text =~ /betrayal/i){
 $client->Message(14,"It was not him that did the betrayal. No my sill $race. It was he that was betrayed! Allied with a goblin who in turned traicked him into cursing everyone now forever trapped. But my brother stopped him from gaining anymore $power");
}
if ($text =~ /power/i){
 $client->Message(14,"With the items they had made the goblin would have been to strong for anyone to stop. So my brother, Xo, ensured they were broken so the goblin would not be able to use them. He then trapped the goblin making him watch his failure from the $outside. ");
}
if ($text =~ /outside/i){
 $client->Message(14,"Yes, Outside in the scarred land. Never can he $enter the Halls as long as he has no part of his past. ");
}
if ($text =~ /enter/i){
 $client->Message(14,"No what you have seen in the Halls are just a shell, an $illusion sent to trick you. To help him end his curse.");
}
if ($text =~ /illusion/i){
 $client->Message(14,"He wants you to restore the items so he can return to the halls and take back control. He must be $stopped be for it is to late and more darkness takes the land.");
}
if ($text =~ /stopped/i){
 $client->Message(14,"You must find him first he has hidden his identity. He is quick to anger like all goblins so I am certain if you tell him you know who he is he will reveal his true form. Then you can destroy him before he can merge any Items with his $essence. ");
}
if ($text =~ /essence/i){
 $client->Message(14,"Combined with the repaired items it will create items of great power. Destroy $him and he will be unable to do so!");
}
if ($text =~ /him/i){
 $client->Message(14,"I see then this is mutual gain in this. I get revenge for my brother and you will get what you need to become stronger. Now head off and take car of this matter while I finish my supply run.");
}
}

sub EVENT_ITEM{
        $client->Message(14,"Why are you giving me this?");
        plugin::return_items(\%itemcount);
	    return 1;
}
