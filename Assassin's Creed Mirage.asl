state ("ACMirage", "Release")
{
	byte Load	: 0x6F20504;
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
            print("Unknown version detected");
            return false;
    }
}

isLoading
{
	return current.Load != 11;
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}