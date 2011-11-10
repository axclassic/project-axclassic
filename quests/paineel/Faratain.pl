    ############################################
    # ZONE: Paineel (paineel)
    # DATABASE: AX-Classic 3.10e
    # LAST EDIT DATE: April 10,2009
    # VERSION: 1.1
    # BASE QUEST BY: HELLIFIKNOW
    # DEVELOPER: ASRAM
    #
    # *** NPC INFORMATION ***
    #
    # NAME: Faratain.pl
    # ID: 75046
    # TYPE: Shopkeeper
    # RACE: Erudite
    # LEVEL: 50
    #
    # *** ITEMS GIVEN OR TAKEN ***
    #
    # Mail Assembly Kit       - ID 17124
    # Crude Helm Mold         - ID 19631
    # Crude Boot Mold         - ID 19634
    # Crude Bracer Mold       - ID 19632
    # Crude Breastplate Mold  - ID 19637
    # Crude Gauntlets Mold    - ID 19633
    # Crude Greaves Mold      - ID 19636
    # Crude Vambrace Mold     - ID 19635
    # Clan Kolbok Blacksmith Traditions - ID 20421
    # Dull Fell Blade Cutlass - ID 20403
    # Sharp Fell Blade Cutlass- ID 20404
    # Large Briar Snake Skin  - ID 20355
    # Petrified Eyeball       - ID 20402 
    # Fell Blade Cutlass      - ID 20416
    #
    #
    # *** QUESTS INVOLVED IN ***
    #
    # Fell Blade Boots
    # Fell Blade Bracer
    # Fell Blade Breastplate
    # Fell Blade Gauntlets
    # Fell Blade Greaves
    # Fell Blade Helm
    # Fell Blade Vambraces
    # Fell Blade Task
    #
    # *** QUESTS AVAILABLE TO ***
    #
    # Shadowknights (Erudite)
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
    quest::say("Salutations $name. If you are here to make use of the forges then feel free to pursue your crafts within this chamber. If you are a new Fell Blade in need of a suit of armor and weapon then I will assist you in crafting [armaments] fitting of a young Shadow Knight.");
    }

    if($text=~/armaments/i){
    quest::say("You will require this specially prepared Mail Assembly Kit in order to construct a suit of Fell Blade Armor. The materials required vary depending on the piece of armor you desire to craft. Once you have been outfitted in the Fell Blade Armor. return to me and I will present you with a somewhat important [task]. Do you desire to craft a [fell blade helm]. a [fell blade bracer]. [fell blade gauntlets]. [fell blade boots]. [fell blade vambraces]. [fell blade greaves]. or a [fell blade breastplate]?");
    quest::summonitem("17124");     # Mail Assembly Kit - ID 17124
    }

    if($text=~/fell blade boots/i){
    quest::say("To assemble Fell blade Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Kobold Pelts. and two Calcified Foot Bones in the Mail Assembly Kit.");
    quest::summonitem("19634"); }   # Crude Boot Mold    - ID 19634

    if($text=~/fell blade helm/i){
    quest::say("To assemble a Fell blade Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Kobold Pelt and a Calcified Skull in the Mail Assembly Kit.");
    quest::summonitem("19631");     # Crude Helm Mold     - ID 19631
    }

    if($text=~/fell blade bracer/i){
    quest::say("To assemble a Fell blade Bracer, you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Kobold Pelt and a Calcified Ulna Bone in the Mail Assembly Kit.");
    quest::summonitem("19632");     # Crude Bracer Mold    - ID 19632
    }

    if($text=~/fell blade greaves/i){
    quest::say("To assemble Fell blade Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Intact Kobold Pelts and two Calcified Tibia in the Mail Assembly Kit.");
    quest::summonitem("19636");     # Crude Greaves Mold    - ID 19636
    }

    if($text=~/fell blade breastplate/i){
    quest::say("To assemble Fell blade Breastplate, you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done, combine the Crude Bronze Breastplate with a Pristine Kobold Pelt, a Calcified Sternum, and a Calcified Ribcage in the Mail Assembly Kit.");
    quest::summonitem("19637");     # Crude Breastplate Mold  - ID 19637
    }

    if($text=~/fell blade vambraces/i){
    quest::say("To assemble Fell blade Vambraces, you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done, combine the Crude Bronze Vambraces with an Intact Kobold Pelt and two Calcified Humerus Bones in the Mail Assembly Kit.");
    quest::summonitem("19635");     # Crude Vambrace Mold     - ID 19635
    }

    if($text=~/fell blade gauntlets/i){
    quest::say("To assemble Fell blade Gauntlets, you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Gauntlets Mold. Once that is done, combine the Crude Bronze Gauntlets with a Ruined Kobold Pelt and two Calcified Finger Bones in the Mail Assembly Kit.");
    quest::summonitem("19633");     # Crude Gauntlets Mold    - ID 19633
    }

    if($text=~/task/i){
    quest::say("The blacksmiths of [Clan Kolbok] craft weapons using an ancient Kobold tradition that has been long forgotten by most of the kobold clans. I believe there is something to be learned from their traditions should we discover their intricacies. Go into the Warrens and locate the chambers of the kobold blacksmiths. There you should be able to find some record of their traditional techniques to return to me here in Paineel where they can be translated and studied.");
    }

    }


    ######## EVENT_ITEM AREA ###################
    ### Called when the NPC is handed items

    sub EVENT_ITEM {

    if (plugin::check_handin(\%itemcount, 20421 => 1)) {
        quest::say("Well done, $name. I will have this translated immediately so that it may be studied. Take this Dull Fell Blade Cutlass and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done, bring me the Sharp Fell Blade Cutlass, a Large Briar Snake Skin, and a Petrified Eyeball, and I will put the finishing touches on the weapon.");
        quest::summonitem("20403");   # Dull Fell Blade Cutlass    - ID 20403
        }

    #     Sharp Fell Blade Cutlass = 20404, Large Briar Snake Skin = 20355
    #     Petrified Eyeball = 20402   
    if (plugin::check_handin(\%itemcount, 20404=>1, 20355=>1, 20402=>1)) {
      quest::emote("fashions a grip from the large briar snake skin, fastens the petrified eyeball to the pommel of the hilt, and polishes the blade with a shimmering black substance.");
      quest::say("I present you with your Fell Blade Cutlass. May it serve you well in the name of Cazic Thule.");
      quest::summonitem("20416");
      }
     
     
    }
    #END of FILE Zone:paineel  ID:75110 -- Faratain.pl




