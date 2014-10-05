sub EVENT_DEATH {
quest::say("My brothers will make short work of you for this! We wont need a contract, it will be payback for what you have done here!");
quest::spawn2(340092,0,0,1896.6,-66.8,135.6,111.6);
quest::spawn2(340090,0,0,2182,-793.9,125.5,244);
quest::spawn2(340090,0,0,2254.1,-598.1,125.5,197.8);
quest::spawn2(340090,0,0,2260.4,-354.7,125.5,188.5);
quest::spawn2(340090,0,0,2186.3,-128.9,125.5,137.1);
quest::spawn2(340090,0,0,2078,-127.7,125.5,119.5);
quest::spawn2(340090,0,0,1969.3,-408.8,125.5,66.2);
quest::spawn2(340090,0,0,2328.4,-887.6,156.7,221.2);
quest::spawn2(340090,0,0,2246.5,-434.7,175.5,66.2);
quest::spawn2(340090,0,0,2323.3,-56.7,156.7,149.5);
quest::spawn2(340090,0,0,2242.3,-146.1,156.7,243.9);
quest::signalwith(340092,870,0);
$client->Message(14,"Your object is to destroy all members of the Autum Rose Assassin brotherhood.");
quest::say("Lets see if you can kill off my bretheren before they finish you off.");
}