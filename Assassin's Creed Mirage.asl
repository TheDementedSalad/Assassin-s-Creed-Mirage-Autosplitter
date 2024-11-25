//Load remover orginally by TheDementedSalad
//Update for latest Release by TpRedNinja
state ("ACMirage", "Release")
{
	byte Load	: 0x6F20504;
}

state("ACMirage","Current")
{
    int loading: 0x061028B8, 0x68;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
}

init
{
	string md5 = "";
    md5 = (string)vars.Helper.GetMD5Hash();

    switch (md5)
    {
        case "A4D96EBBFF2D861198F1D70191778246":
            version = "Release";
            break;
        default:
            version = "Current";
            break;
    }
}

isLoading
{
	if (version == "Release")
    {
        return current.Load != 11;
    } else if(version == "Current")
    {
        if (current.loading == 1 && old.loading == 0)
        {
            return true;
        }
    }
	
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}
