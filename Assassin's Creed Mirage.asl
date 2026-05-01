//Load remover orginally by TheDementedSalad
//Update for latest Release by TpRedNinja

state("ACMirage","Current")
{
    int loading: 0x061A74B8, 0x58, 0xC0, 0x110, 0x2C;
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
        case "75A493343F6DA1B0BF38FF8C039512CF":
            version = "Current";
            break;
        default:
            version = "N/A";
            break;
    }
}

isLoading
{
    return current.loading == 1;
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}
