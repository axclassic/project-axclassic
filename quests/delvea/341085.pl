sub EVENT_DEATH {
quest::spawn2(341083,0,0,-1090.6,-1199.6,-92.2,106.5);
quest::signalwith(341082,541,0);
$client->CameraEffect(3000, 3);
     $client->Message(14,"The ground shakes slightly, and a loud crack and thud can be heard echoing through the tunnels.");
}