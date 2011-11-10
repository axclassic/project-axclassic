     ############################################
    # ZONE: Grobb (grobb)
    # DATABASE: AX-Classic 3.10f
    # LAST EDIT DATE: April 15,2009
    # VERSION: 1.0
    # BASE QUEST BY: ASRAM
    # DEVELOPER: ASRAM
    #
    # *** NPC INFORMATION ***
    #
    # NAME: Kugaran.pl
    # ID: 52106
    # TYPE: Shadowknight
    # RACE: Troll
    # LEVEL: 61
    #
    # *** ITEMS GIVEN OR TAKEN ***
    #
    # Dark Bashers Armor Assembly Kit - 61096
    # Enchanted Armguard Mold         - 22613
    # Enchanted Boots Mold            - 22612
    # Enchanted Bracer Mold           - 22611
    # Enchanted Breastplate Mold      - 22616
    # Enchanted Gauntlet Mold         - 22615
    # Enchanted Greaves Mold          - 22614
    # Enchanted Helm Mold             - 22610
    # Dark Bashers Two-Handed Sword   - 61101
    #
    # *** QUESTS INVOLVED IN ***
    #
    # Dark Basher's Armguards
    # Dark Basher's Boots
    # Dark Basher's Bracer
    # Dark Basher's Breastplate
    # Dark Basher's Final Task
    # Dark Basher's Gauntlets
    # Dark Basher's Greaves
    # Dark Basher's Helm
    #
    # *** QUESTS AVAILABLE TO ***
    #
    # Shadowknights (All)
    #
    # *** NPC NOTES ***
    #
    #
    #
    ############################################

    ######## EVENT_SAY AREA ####################
    ### Called when the NPC is spoken to by a PC

    sub EVENT_SAY {
    if($text=~/Hail/i){
    quest::say("'Whut yoo want from Kugaran! Unless yoo [Shadowknight] yoo leave me alone.");
    }
    if($text=~/Shadowknight/i){
    quest::say("I don't know if I should trust yoo, but I suppose I can let yoo prove yerself. If yoo are [interested] in helping me wit gathering some tings and creating yer own armor, yoo let Kugaran know.");
    }

    if($text=~/interested/i){
    quest::say("Well den I guess we get started. Dere isn't much to tell besides dat yoo will have to go out and collect [various items] fer yer armor materials. First tings first go ahead and take yer assembly kit now, it is in here dat yoo will put da items yoo collect to make yer armor material. Once yoo have da material yoo can use it wit da right mold I gib yoo to make yer armor.");
    quest::summonitem("61096"); #Dark Bashers Armor Assembly Kit
    }

    if($text=~/various items/i){
    quest::say("Dere are lots of tings yoo will need. Once yoo are ready I can gib yoo da mold fer Dark Basher's [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate]. When yoo are ready to make a piece yoo tell me which piece you wish to craft and I gib yoo da right mold.");
    }

    if($text=~/armguards/i){
    quest::say("To create yer armguard material yoo will need to combine 1 small bricks of ore, 2 snake fangs and spiderling legs in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Armguards.");
    quest::summonitem("22613"); # Enchanted Armguard Mold
    }

    if($text=~/boots/i){
    quest::say("To create yer boot material yoo will need to combine 3 Bricks of Crude Bronze, 1 Kobold Hide, 1 Froglok Blood and 1 Ration in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Boots.");
    quest::summonitem("22612"); # Enchanted Boots Mold
    }

    if($text=~/bracers/i){
    quest::say("To create yer Bracer material yoo will need to combine 1 Brick of Crude Bronze, 2 Snake Scales, 1 Ruined Kobold Pelt and 1 Bottle in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Bracer.");
    quest::summonitem("22611"); # Enchanted Bracer Mold
      }
     
    if($text=~/breastplate/i){
    quest::say("To create yer breastplate material yoo will need to combine 1 Lightstone, 1 Bull Alligator Spines, 1 Desert Tarantula Chitin, 1 Giant Moccasin Fang, and 2 Small Bricks of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Breastplate. Return to me for one [final task] I have to ask of yoo after yoo have completed yer breastplate.");
    quest::summonitem("22616"); # Enchanted Breastplate Mold
      }
     
    if($text=~/helm/i){
    quest::say("To create yer helm material, yoo will need to combine 2 small bricks of ore, a giant snake rattle, and a fungus clump in yer assembly kit. Once yoo have created da proper material, take it to a forge along with this mold to fashion yer very own Dark Basher's Helm.");
    quest::summonitem("22610"); # Enchanted Helm Mold
      } 
     
    if($text=~/final task/i){
    quest::say("Da task is to get me a few [important items] that I need for me studies. If yoo go get dem I give you nice shiny ting."); 
    }

    if($text=~/gauntlets/i){
    quest::say("To create yer gauntlets material, yoo will need to combine a Small Mosquito Wing, a Large Snake Skin, two Zombie Skins, and one Small Brick of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Gauntlets.");
    quest::summonitem("22615"); # Enchanted Gauntlet Mold
      }
     
    if($text=~/greaves/i){
    quest::say("To create yer greaves material, yoo will need to combine 4 Bricks of Crude Bronze, 2 Ruined kobold Pelts, 1 Spiderling Eye and 1 Mead in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Greaves.");
    quest::summonitem("22614"); # Enchanted Greaves Mold
      }

    if($text=~/important items/i){
    quest::say("Me needs 1 Burned Out Lightstone, 1 Preserved Snake Eye and 2 Embalming Dust. Bring me these tings and I give yoo nice reward.");
      }

    }
    ######## EVENT_ITEM AREA ###################
    ### Called when the NPC is handed items

sub EVENT_ITEM {
      # Dark Basher's Two-Handed Sword   - 61101
      if (plugin::check_handin(\%itemcount, 9893 => 1, 10299 => 1, 16990 => 2)) {
    quest::say("Yoo did good. Heer 'tis, nice n' shiny fer ya.");
    
    quest:summonitem("61101");   # Dark Bashers Two-Handed Sword   - 61101

      }

     else {
    plugin::return_items(\%itemcount); #function from file plugins/check_handin.pl
     }
     
}



    ### EQEmu Quest Template By: MWMDRAGON
    ### The End of this script must contain 2 empty lines for the EQ Quest System
    #END of FILE Zone:paineel  ID:52106 -- Kugaran.pl





