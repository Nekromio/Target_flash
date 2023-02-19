
public Plugin myinfo = 
{
	name	= "Target Flash/Ослепить цель",
	version	= "1.0.1",
	description	= "Админ может ослепить игрока",
	author	= "Nek.'a 2x2 | ggwp.site)",
	url	= "https://ggwp.site/"
}

public void OnPluginStart()
{
	LoadTranslations("common.phrases");
	RegAdminCmd("sm_tflash", CmdTaregetFlash, ADMFLAG_BAN, "sm_tflash <#userid|name> [force] [time]");
}

Action CmdTaregetFlash(int client, any args)
{
	if(args < 1)
	{
		ReplyToCommand(client, "[SM] Usage: sm_tflash <#userid|name> [force] [time]");
		return Plugin_Handled;
	}
	
	char arg[65];
	GetCmdArg(1, arg, sizeof(arg));
	
	float fForce = 0.0;
	if(args > 1)
	{
		char arg2[20];
		GetCmdArg(2, arg2, sizeof(arg2));
		if (StringToFloatEx(arg2, fForce) == 0 || fForce < 0)
		{
			ReplyToCommand(client, "[SM] %t", "Invalid Amount");
			return Plugin_Handled;
		}
	}
	
	float fTime = 0.0;
	if(args > 2)
	{
		char arg3[20];
		GetCmdArg(3, arg3, sizeof(arg3));
		if (StringToFloatEx(arg3, fTime) == 0.0 || fTime < 0.0)
		{
			ReplyToCommand(client, "[SM] %t", "Invalid Amount");
			return Plugin_Handled;
		}
	}
	
	char target_name[MAX_TARGET_LENGTH];
	int target_list[MAXPLAYERS], target_count;
	bool tn_is_ml;
	if((target_count = ProcessTargetString(arg, client, target_list, MAXPLAYERS, COMMAND_FILTER_ALIVE, target_name, sizeof(target_name), tn_is_ml)) <= 0)
	{
		ReplyToTargetError(client, target_count);
		return Plugin_Handled;
	}
	
	for(int i = 0; i < target_count; i++)
		PerformFlash(client, target_list[i], fForce, fTime);

	return Plugin_Changed;
}

void PerformFlash(int client, int target, float force, float time)
{
	SetEntPropFloat(target, Prop_Send, "m_flFlashDuration", time);
	SetEntPropFloat(target, Prop_Send, "m_flFlashMaxAlpha", force);
	PrintToChat(client, "Вы ослепили [%N] на [%.2f] в течении [%.2f] секунд", target, force, time);
}